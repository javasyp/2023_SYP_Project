<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MEMBER" />
<%@ include file="../common/head.jspf"%>
<%@ page import="com.KoreaIT.syp.demo.util.Ut"%>
<hr />

<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<table border="1">
				<colgroup>
					<col width="200" />
				</colgroup>

				<tbody>
					<tr>
						<td>가입일</td>
						<td>${rq.loginedMember.regDate }</td>
					</tr>
					<tr>
						<td>아이디</td>
						<td>${rq.loginedMember.loginId }</td>
					</tr>
					<tr>
						<td>이름</td>
						<td>${rq.loginedMember.name }</td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td>${rq.loginedMember.nickname }</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td>${rq.loginedMember.cellphoneNum }</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${rq.loginedMember.email }</td>
					</tr>
					<tr>
						<td colspan="2">
							<a href="../member/checkPw?replaceUri=${Ut.getEncodedUri('../member/modify') }">
								회원 정보 수정</a>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div>
			<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>
<%@ include file="../common/foot.jspf"%>