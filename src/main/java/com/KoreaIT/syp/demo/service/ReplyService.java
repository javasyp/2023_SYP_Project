package com.KoreaIT.syp.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.KoreaIT.syp.demo.vo.Reply;
import com.KoreaIT.syp.demo.repository.ReplyRepository;
import com.KoreaIT.syp.demo.util.Ut;
import com.KoreaIT.syp.demo.vo.ResultData;

@Service
public class ReplyService {

	@Autowired
	private ReplyRepository replyRepository;

	public ReplyService(ReplyRepository replyRepository) {
		this.replyRepository = replyRepository;
	}
	
	// 댓글 작성
	public ResultData<Integer> writeReply(int actorId, String relTypeCode, int relId, String body) {
		
		replyRepository.writeReply(actorId, relTypeCode, relId, body);

		int id = replyRepository.getLastInsertId();

		return ResultData.from("S-1", Ut.f("%d번 댓글이 생성되었습니다.", id), "id", id);
	}
	
	// 댓글 목록
	public List<Reply> getForPrintReplies(int actorId, String relTypeCode, int relId) {
		
		return replyRepository.getForPrintReplies(actorId, relTypeCode, relId);
	}

}
