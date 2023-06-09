package com.KoreaIT.syp.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.KoreaIT.syp.demo.vo.Article;

@Mapper
public interface ArticleRepository {

	public void writeArticle(int memberId, int boardId, String title, String body);

	public List<Article> getArticles();
	
	// article 테이블에서 "좋아요" 및 "싫어요" 보여주므로 reactionPoint 테이블 조인할 필요 없음.
	@Select("""
			<script>
				SELECT A.*, M.nickname AS extra_writer
				FROM article AS A
				INNER JOIN `member` AS M
				ON A.memberId = M.id
				WHERE 1
				<if test="boardId != 0">
					AND A.boardId = #{boardId}
				</if>
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchType == 'title'">
							AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
						</when>
						<when test="searchType == 'body'">
							AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
						</when>
						<otherwise>
							AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
							OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
						</otherwise>
					</choose>
				</if>
				ORDER BY A.id DESC
				<if test="limitFrom >= 0">
					LIMIT #{limitFrom}, #{limitTake}
				</if>
			</script>
			""")
	public List<Article> getForPrintArticles(int boardId, int limitFrom, int limitTake,
			String searchType, String searchKeyword);

	public Article getArticle(int id);
	
	@Select("""
			<script>
				SELECT A.*, M.nickname AS extra_writer
				FROM article AS A
				INNER JOIN `member` AS M
				ON A.memberId = M.id
				WHERE A.id = #{id}
			</script>
			""")
	public Article getForPrintArticle(int id);

	public void deleteArticle(int id);

	public void modifyArticle(int id, String title, String body);

	public int getLastInsertId();
	
	@Select("""
			<script>
				SELECT COUNT(*) AS cnt
				FROM article AS A
				WHERE 1
				<if test="boardId != 0">
					AND A.boardId = #{boardId}
				</if>
				<if test="searchKeyword != ''">
					<choose>
						<when test="searchType == 'title'">
							AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
						</when>
						<when test="searchType == 'body'">
							AND A.body LIKE CONCAT('%',#{searchKeyword},'%')
						</when>
						<otherwise>
							AND A.title LIKE CONCAT('%',#{searchKeyword},'%')
							OR A.body LIKE CONCAT('%',#{searchKeyword},'%')
						</otherwise>
					</choose>
				</if>
			</script>
			""")
	public int getArticlesCount(int boardId, String searchType, String searchKeyword);
	
	// 조회수 증가
	@Update("""
			<script>
				UPDATE article
				SET hitCount = hitCount + 1
				WHERE id = #{id}
			</script>
			""")

	public int increaseHitCount(int id);
	
	// 조회수 값 가져오기 (ajax)
	@Select("""
			<script>
				SELECT hitCount
				FROM article
				WHERE id = #{id}
			</script>
			""")
	public int getArticleHitCount(int id);
	
	// "좋아요" 개수 증가
	@Update("""
			<script>
				UPDATE article
				SET goodReactionPoint = goodReactionPoint + 1
				WHERE id = #{relId}
			</script>
			""")
	public int increaseGoodReationPoint(int relId);
	
	// "싫어요" 개수 증가
	@Update("""
			<script>
				UPDATE article
				SET badReactionPoint = badReactionPoint + 1
				WHERE id = #{relId}
			</script>
			""")
	public int increaseBadReationPoint(int relId);
	
	// "좋아요" 개수 감소
	@Update("""
			<script>
				UPDATE article
				SET goodReactionPoint = goodReactionPoint - 1
				WHERE id = #{relId}
			</script>
			""")
	public int decreaseGoodReationPoint(int relId);
	
	// "싫어요" 개수 감소
	@Update("""
			<script>
				UPDATE article
				SET badReactionPoint = badReactionPoint - 1
				WHERE id = #{relId}
			</script>
			""")
	public int decreaseBadReationPoint(int relId);

}
