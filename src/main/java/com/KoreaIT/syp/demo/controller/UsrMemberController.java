package com.KoreaIT.syp.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KoreaIT.syp.demo.service.MemberService;
import com.KoreaIT.syp.demo.util.Ut;
import com.KoreaIT.syp.demo.vo.Member;
import com.KoreaIT.syp.demo.vo.ResultData;
import com.KoreaIT.syp.demo.vo.Rq;

@Controller
public class UsrMemberController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private Rq rq;
	
	// 액션 메서드
	// 로그인
	@RequestMapping("/usr/member/login")
	public String showLogin(HttpSession session) {
		return "usr/member/login";
	}
	
	@RequestMapping("/usr/member/doLogin")
	@ResponseBody
	public String doLogin(String loginId, String loginPw, @RequestParam(defaultValue = "/") String afterLoginUri) {

		if (rq.isLogined()) {
			return Ut.jsHistoryBack("F-5", Ut.f("이미 로그인 상태입니다."));
		}
		
		if (Ut.empty(loginId)) {
			return Ut.jsHistoryBack("F-1", "아이디를 입력해 주세요.");
		}
		
		if (Ut.empty(loginPw)) {
			return Ut.jsHistoryBack("F-2", "비밀번호를 입력해 주세요.");
		}
		
		Member member = memberService.getMemberByLoginId(loginId);
		
		if (member == null) {
			return Ut.jsHistoryBack("F-3", Ut.f("%s은(는) 존재하지 않는 아이디입니다.", loginId));
		}
		
		if (member.getLoginPw().equals(loginPw) == false) {
			return Ut.jsHistoryBack("F-4", "비밀번호가 일치하지 않습니다.");
		}
		
		rq.login(member);
		
		return Ut.jsReplace(Ut.f("%s 님 환영합니다.", member.getName()), afterLoginUri);
	}
	
	// 로그아웃
	@RequestMapping("/usr/member/doLogout")
	@ResponseBody
	public String doLogout(@RequestParam(defaultValue = "/") String afterLogoutUri) {

		if (!rq.isLogined()) {
			return Ut.jsHistoryBack("F-1", Ut.f("이미 로그아웃 상태입니다."));
		}
		
		rq.logout();
		
		return Ut.jsReplace(Ut.f("로그아웃 되었습니다."), afterLogoutUri);
	}
	
	// 회원가입
	@RequestMapping("/usr/member/doJoin")
	@ResponseBody
	public ResultData<Member> doJoin(String loginId, String loginPw,
			String name, String nickname, String cellphoneNum, String email) { // 제네릭 추가

		if (Ut.empty(loginId)) {
			return ResultData.from("F-1", "아이디를 입력해 주세요.");
		}
		if (Ut.empty(loginPw)) {
			return ResultData.from("F-2", "비밀번호를 입력해 주세요.");
		}
		if (Ut.empty(name)) {
			return ResultData.from("F-3", "이름을 입력해 주세요.");
		}
		if (Ut.empty(nickname)) {
			return ResultData.from("F-4", "닉네임을 입력해 주세요.");
		}
		if (Ut.empty(cellphoneNum)) {
			return ResultData.from("F-5", "전화번호를 입력해 주세요.");
		}
		if (Ut.empty(email)) {
			return ResultData.from("F-6", "이메일을 입력해 주세요.");
		}

		ResultData<Integer> joinRd = memberService.join(loginId, loginPw, name,
				nickname, cellphoneNum, email);

		// 중복일 때
		if (joinRd.isFail()) {
			return (ResultData) joinRd;
		}

		// joinRd에 저장된 data1(id) 값
		Member member = memberService.getMemberById(joinRd.getData1());

		return ResultData.newData(joinRd, "member", member);
	}
	
	// 마이페이지
	@RequestMapping("/usr/member/myPage")
	public String showMyPage() {
		
		return "usr/member/myPage";
	}
	
	// 회원 정보 수정 시 비밀번호 한번 더 체크
	@RequestMapping("/usr/member/checkPw")
	public String showCheckPw() {
		
		return "usr/member/checkPw";
	}
	
	@RequestMapping("/usr/member/doCheckPw")
	@ResponseBody
	public String doCheckPw(String loginPw, String replaceUri) {
		System.out.println("========================================" + loginPw);
		System.out.println("========================================" + replaceUri);
		
		if (Ut.empty(loginPw)) {
			return rq.jsHistoryBackOnView("비밀번호를 입력하세요.");
		}
		
		if (rq.getLoginedMember().getLoginPw().equals(loginPw) == false) {
			return rq.jsHistoryBack("F-1", "비밀번호가 일치하지 않습니다.");
		}
		
		return rq.jsReplace("", replaceUri);
	}
	
	// 수정
	@RequestMapping("/usr/member/modify")
	public String showModify() {
		
		return "usr/member/modify";
	}
	
	@RequestMapping("/usr/member/doModify")
	@ResponseBody
	public String doModify(String loginPw, String name, String nickname, String cellphoneNum, String email) {

		if (Ut.empty(loginPw)) {
			loginPw = null;
		}
		if (Ut.empty(name)) {
			return rq.jsHistoryBackOnView("이름을 입력해 주세요.");
		}
		if (Ut.empty(nickname)) {
			return rq.jsHistoryBackOnView("닉네임을 입력해 주세요.");
		}
		if (Ut.empty(cellphoneNum)) {
			return rq.jsHistoryBackOnView("전화번호를 입력해 주세요.");
		}
		if (Ut.empty(email)) {
			return rq.jsHistoryBackOnView("이메일을 입력해 주세요.");
		}

		ResultData modifyRd = memberService.modify(rq.getLoginedMemberId(), loginPw, name, nickname, cellphoneNum,
				email);

		return rq.jsReplace(modifyRd.getMsg(), "../member/myPage");
	}
}