package com.KoreaIT.syp.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.KoreaIT.syp.demo.vo.Bustime;

@Mapper
public interface BustimeRepository {
	
	// 목록, 검색
	@Select("""
			<script>
				SELECT *
				FROM busSchedule
				WHERE line = ''
				<if test="busRoute != ''">
					AND busRoute = #{busRoute}
				</if>
				<if test="dayType != ''">
					AND dayType = #{dayType}
				</if>
				<if test="limitFrom >= 0">
					LIMIT #{limitFrom}, #{limitTake}
				</if>
			</script>
			""")
	public List<Bustime> getForPrintBustimes(int limitFrom, int limitTake, String busRoute, String dayType);
	
//	@Select("""
//			<script>
//				SELECT *
//				FROM busSchedule
//				WHERE line = ''
//				<if test="busRoute != ''">
//					<choose>
//						<when test="busRoute == 'busRoute'">
//							AND busRoute LIKE CONCAT('%',#{busRoute},'%')
//						</when>
//						<when test="dayType == 'dayType'">
//							AND dayType LIKE CONCAT('%',#{dayType},'%')
//						</when>
//						<otherwise>
//							AND busRoute LIKE CONCAT('%',#{busRoute},'%')
//							OR dayType LIKE CONCAT('%',#{dayType},'%')
//						</otherwise>
//					</choose>
//				</if>
//				<if test="limitFrom >= 0">
//					LIMIT #{limitFrom}, #{limitTake}
//				</if>
//			</script>
//			""")
//	public List<Bustime> getForPrintBustimes(int limitFrom, int limitTake, String busRoute, String dayType);
	
	// 시간표 개수
	@Select("""
			<script>
				SELECT COUNT(*) AS cnt
				FROM busSchedule
				WHERE line = ''
				<if test="busRoute != ''">
					AND busRoute = #{busRoute}
				</if>
				<if test="dayType != ''">
					AND dayType = #{dayType}
				</if>
			</script>
			""")
	public int getBustimesCount(String busRoute, String dayType);
	
	// 상세보기 (시간표만)
	@Select("""
			<script>
				SELECT *
				FROM busSchedule
				WHERE busRoute = #{busRoute}
				AND dayType = #{dayType}
			</script>
			""")
	public List<Bustime> getForPrintBustime(String busRoute, String dayType);
	
	// 상세보기 (노선정보만)
	@Select("""
			<script>
				SELECT *
				FROM busSchedule
				WHERE line = ''
				AND busRoute = #{busRoute}
				AND dayType = #{dayType}
			</script>
			""")
	public Bustime getForPrintBus(String busRoute, String dayType);
	
	// 노선 검색
	@Select("SELECT DISTINCT busRoute FROM busSchedule WHERE line = '';")
	public List<Bustime> searchBusRoutes(String busRoute);

//	// 조회수 증가
//	@Update("""
//			<script>
//				UPDATE article
//				SET hitCount = hitCount + 1
//				WHERE id = #{id}
//			</script>
//			""")
//
//	public int increaseHitCount(int id);
//	
//	// 조회수 값 가져오기 (ajax)
//	@Select("""
//			<script>
//				SELECT hitCount
//				FROM article
//				WHERE id = #{id}
//			</script>
//			""")
//	public int getArticleHitCount(int id);
//	
//	// "좋아요" 개수 증가
//	@Update("""
//			<script>
//				UPDATE article
//				SET goodReactionPoint = goodReactionPoint + 1
//				WHERE id = #{relId}
//			</script>
//			""")
//	public int increaseGoodReationPoint(int relId);
	
//	// "좋아요" 개수 감소
//	@Update("""
//			<script>
//				UPDATE article
//				SET goodReactionPoint = goodReactionPoint - 1
//				WHERE id = #{relId}
//			</script>
//			""")
//	public int decreaseGoodReationPoint(int relId);
}
