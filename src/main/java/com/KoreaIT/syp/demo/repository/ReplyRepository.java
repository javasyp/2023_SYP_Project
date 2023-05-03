package com.KoreaIT.syp.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.KoreaIT.syp.demo.vo.Reply;

@Mapper
public interface ReplyRepository {
	
	// 댓글 작성
	@Insert("""
			<script>
				INSERT INTO reply
				SET regDate = NOW(),
				updateDate = NOW(),
				memberId = #{actorId},
				relTypeCode = #{relTypeCode},
				relId =#{relId},
				`body`= #{body}
			</script>
			""")
	void writeReply(int actorId, String relTypeCode, int relId, String body);
	
	// 댓글 개수
	@Select("""
			<script>
				SELECT LAST_INSERT_ID()
			</script>
			""")
	int getLastInsertId();
	
	// 댓글 목록
	@Select("""
				SELECT R.*, M.nickname AS extra_writer
				FROM reply AS R
				LEFT JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.relTypeCode = #{relTypeCode}
				AND R.relId = #{relId}
				ORDER BY R.id ASC
			""")
	List<Reply> getForPrintReplies(int actorId, String relTypeCode, int relId);
	
	// 댓글 가져오기
	@Select("""
				SELECT R.*
				FROM reply AS R
				WHERE R.id = #{id}
			""")
	Reply getReply(int id);
	
	// 댓글 삭제
	@Delete("""
				DELETE FROM reply
				WHERE id = #{id}
			""")
	void deleteReply(int id);
	
	// 출력용 데이터
	@Select("""
				SELECT R.*, M.nickname AS extra_writer
				FROM reply AS R
				INNER JOIN `member` AS M
				ON R.memberId = M.id
				WHERE R.id = #{id}
			""")
	Reply getForPrintReply(int id);
	
	// 댓글 수정
	@Update("""
			<script>
				UPDATE reply
				<set>
					<if test="body != null and body != ''">
						`body` = #{body},
					</if>
					updateDate = NOW()
				</set>
				WHERE id = #{id}
			</script>
			""")
	void modifyReply(int id, String body);

}
