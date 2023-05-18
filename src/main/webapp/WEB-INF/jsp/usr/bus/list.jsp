<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="버스 시간표" />
<%@ include file="../common/head.jspf"%>
<hr />
<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<div class="flex mb-4">
				<div>게시물 개수 : ${bustimesCount } 개</div>
				<div class="flex-grow"></div>
				<!-- 검색 -->
				<form action="">
					<select class="select select-ghost" name="searchType">
						<option value="busRoute">노선번호</option>
					    <option value="dayType">운행일</option>
					    <option value="busRoute,dayType">전체</option>
					</select>
					<input value="${param.searchKeyword }" maxlength="20" name="searchKeyword"
						class="input input-bordered" type="text" placeholder="검색어를 입력해 주세요.">
					<button class="btn btn-ghost" type="submit">검색</button>
				</form>
			</div>
			<!-- 목록 -->
			<table class="table table-zebra w-full">
				<colgroup>
					<col width="70" />
					<col width="140" />
					<col width="200" />
					<col width="100" />
					<col width="100" />
					<col width="100" />
					<col width="140" />
				</colgroup>
				<thead>
					<tr>
						<th>번호</th>
						<th>노선번호</th>
						<th>운행지역</th>
						<th>운행일</th>
						<th>평균 배차간격</th>
						<th>편도</th>
						<th>시행일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bustime" items="${bustimes }" varStatus="status">
						<tr class="hover">
							<td><div class="badge">${status.count }</div></td>
							<td>
								<a class="hover:underline" href="detail?busRoute=${bustime.busRoute }&dayType=${bustime.dayType }">${bustime.busRoute }</a>
							</td>
							<td>${bustime.departure1 } ~ ${bustime.departure2 }</td>
							<td>${bustime.dayType }</td>
							<td>${bustime.interval }</td>
							<td>${bustime.oneWay }</td>
							<td>${bustime.serviceDate }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- 페이징 -->
		<div class="pagination flex justify-center mt-3 mb-3">
			<div class="btn-group">
			
				<c:set var="paginationLen" value="4" />
				<c:set var="startPage" value="${page - paginationLen >= 1 ? page - paginationLen : 1 }" />
				<c:set var="endPage" value="${page + paginationLen <= pagesCount ? page + paginationLen : pagesCount }" />
				
				<!-- 변수 지정 -->
				<c:set var="baseUri" value="?" />
				<c:set var="baseUri" value="${baseUri }&searchType=${searchType }" />
				<c:set var="baseUri" value="${baseUri }&searchKeyword=${searchKeyword }" />
				
				<!-- 맨 앞으로 -->
				<c:if test="${startPage > 1 }">
					<a class="btn" href="${baseUri }&page=1">1</a>
					<button class="btn btn-disabled">...</button>
				</c:if>
				<!-- 중간 페이지 -->
				<c:forEach begin="${startPage }" end="${endPage }" var="i">
					<a class="btn ${page == i ? 'btn-active' : '' }" href="${baseUri }&page=${i }">${i }</a>
				</c:forEach>
				<!-- 맨 뒤로 -->
				<c:if test="${endPage < pagesCount }">
					<button class="btn btn-disabled">...</button>
					<a class="btn" href="${baseUri }&page=${pagesCount }">${pagesCount }</a>
				</c:if>
				
			</div>
		</div>
		
	</div>
</section>

<%@ include file="../common/foot.jspf"%>