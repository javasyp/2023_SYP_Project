<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="버스 시간표" />
<%@ include file="../common/head.jspf"%>

<style>
table {
  border-collapse: collapse;
  border-spacing: 0;
}

section.notice {
  padding: 80px 0;
}

.page-title {
  margin-bottom: 30px;
}

.page-title h3 {
  font-size: 28px;
  color: #333333;
  font-weight: 400;
  text-align: center;
}

#board-search .search-window {
  padding: 15px 0;
}

#board-search .search-window .search-wrap {
  position: relative;
/*   padding-right: 124px; */
  margin: 0 auto;
  width: 80%;
  max-width: 400px;
  display: flex;
  justify-content: center;
}

#board-search .search-window .search-wrap select {
  outline: 0;
  height: 40px;
  width: 110px;
  font-size: 14px;
  border: 1px solid #ccc;
  font-family: 'AppleSDGothicNeoR', sans;
}

#board-search .search-window .search-wrap select:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}

#board-search .search-window .search-wrap input {
  height: 40px;
  width: 100%;
  font-size: 14px;
  padding: 7px 14px;
  border: 1px solid #ccc;
  font-family: 'AppleSDGothicNeoR', sans;
}

#board-search .search-window .search-wrap input:focus {
  border-color: #333;
  outline: 0;
  border-width: 1px;
}

#board-search .search-window .search-wrap .btn {
  right: 0;
  top: 0;
  bottom: 0;
  width: 100px;
  padding: 0;
  font-size: 16px;
  font-family: 'AppleSDGothicNeoR', sans;
}

.board-table {
  font-size: 13px;
  width: 100%;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin-top: 10px;
}

.board-table a {
  color: #333;
  display: inline-block;
  line-height: 1.4;
  word-break: break-all;
  vertical-align: middle;
}

.board-table a:hover {
  text-decoration: underline;
}

.board-table th {
  text-align: center;
}

.board-table th, .board-table td {
  padding: 14px 0;
}

.board-table tbody td {
  border-top: 1px solid #e7e7e7;
  text-align: center;
}

.board-table tbody th {
  padding-left: 28px;
  padding-right: 14px;
  border-top: 1px solid #e7e7e7;
  text-align: left;
}

.board-table tbody th p {
  display: none;
}

.btn {
  display: inline-block;
  padding: 0 30px;
  font-size: 15px;
  font-weight: 400;
  background: transparent;
  text-align: center;
  white-space: nowrap;
  vertical-align: middle;
  -ms-touch-action: manipulation;
  touch-action: manipulation;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  border: 1px solid transparent;
  text-transform: uppercase;
  -webkit-border-radius: 0;
  -moz-border-radius: 0;
  border-radius: 0;
  -webkit-transition: all 0.3s;
  -moz-transition: all 0.3s;
  -ms-transition: all 0.3s;
  -o-transition: all 0.3s;
  transition: all 0.3s;
}

.btn-dark {
  background: #555;
  color: #fff;
}

.btn-dark:hover, .btn-dark:focus {
  background: #373737;
  border-color: #373737;
  color: #fff;
}

.box {
	text-align: center;
	display: inline;
	height: 100px;
	vertical-align: middle;
	display: flex;
	justify-content: center;
	margin-top: 30px;
}

/* reset */

* {
  list-style: none;
  text-decoration: none;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.clearfix:after {
  content: '';
  display: block;
  clear: both;
}
.container {
  width: 900px;
  margin: 0 auto;
}
.blind {
  position: absolute;
  overflow: hidden;
  clip: rect(0 0 0 0);
  margin: -1px;
  width: 1px;
  height: 1px;
}

/* 페이징 */
.page_wrap {
	text-align:center;
	font-size:0;
	margin-top: 30px;
 }
.page_nation {
	display:inline-block;
}
.page_nation .none {
	display:none;
}
.page_nation a {
	display:block;
	margin:0 3px;
	float:left;
	border:1px solid #e6e6e6;
	width:28px;
	height:28px;
	line-height:28px;
	text-align:center;
	background-color:#fff;
	font-size:13px;
	color:#999999;
	text-decoration:none;
}
.page_nation a.active {
	background-color:#42454c;
	color:#fff;
	border:1px solid #42454c;
}
</style>

<script>
$('#step1').on("change", function() {
	loadArea('busRoute', $(this));
});

$('#step2').on("change", function() {
	loadArea('busType', $(this));
});

function loadArea(type, element) {
	var value = $(element).find('option:selected').text();
	var data = {
		type : type,
		keyword : value
	};

	console.log(data);
	$.ajax({
		url : "/usr/bus/list",
		data : data,
		dataType : "JSON",
		method : "POST",
		success : function(result) {
			if (type == 'busRoute') {
				result.forEach(function(searchRoute) {
					$('#step1').append(
							'<option value="' + searchRoute.areacode + '">'
									+ searchRoute.step1 + '</option>')
				});
			} else if (type == 'busType') {
				$('#busRoute').siblings().remove();
				$('#town').siblings().remove();
				res.forEach(function(county) {
					$('#step2').append(
							'<option value="'+county.areacode+'">'
									+ county.step2 + '</option>')
				});
			} else {
				$('#town').siblings().remove();
				res.forEach(function(town) {
					$('#step3').append(
							'<option value="'+town.areacode+'">'
									+ town.step3 + '</option>')
				});
			}
		},
		error : function(xhr) {
			alert(xhr.responseText);
		}
	});
}

function updateSecondSelect() {
    var firstSelect = document.getElementById('firstSelect');
    var secondSelect = document.getElementById('secondSelect');
    var selectedValue = firstSelect.value;

    // AJAX를 통해 서버에 선택된 값에 따른 두 번째 셀렉트 박스의 옵션을 요청
    // 서버에서 JSON 형태로 옵션 데이터를 반환하고, 해당 데이터를 기반으로 두 번째 셀렉트 박스를 업데이트
    // 이 과정은 JavaScript의 fetch() 함수나 jQuery의 AJAX 메소드 등을 사용하여 구현 가능
}
</script>

<section class="notice">
  <div class="page-title">
        <div class="container">
            <h3>버스 시간표 (${bustimesCount })</h3>
        </div>
    </div>

    <!-- board search area -->
    <div id="board-search">
        <div class="container">
            <div class="search-window">
                <form action="">
                    <div class="search-wrap">
                    	<select data-value="${param.busRoute }" name="busRoute">
                    		<option value="" selected>노선번호</option>
                    		<c:forEach var="searchRoute" items="${searchRoute }" varStatus="status">
								<option value="${searchRoute.busRoute }">${searchRoute.busRoute }</option>
							</c:forEach>
						</select>
						<select data-value="${param.dayType }" name="dayType">
							<option value="" selected>운행일</option>
							<option value="평일">평일</option>
							<option value="휴,토">휴,토</option>
							<option value="토요일" >토요일</option>
							<option value="ALL">ALL</option>
						</select>
						<button type="submit" class="btn btn-dark">🔍︎</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
   
  <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
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
                	<c:set var="startIndex" value="${(page - 1) * 15}" />
                
	               <c:forEach var="bustime" items="${bustimes }" varStatus="status">
						<tr>
							<td>${startIndex + status.index + 1}</td>
							<td>
								<a style="color:red;" href="detail?busRoute=${bustime.busRoute }&dayType=${bustime.dayType }">${bustime.busRoute }</a>
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
            
            <c:if test="${empty bustimes}">
	            <div class="box">
	            	검색 결과가 존재하지 않습니다.
	            </div>
			</c:if>
            
			<!-- 변수 지정 -->
			<c:set var="baseUri" value="?busRoute=${busRoute }" />
			<c:set var="baseUri" value="${baseUri }&busType=${busType }" />
			
			<!-- 페이지네이션 블록 크기 -->
			<c:set var="blockSize" value="5" />
			
			<!-- 현재 블록의 시작 페이지 번호 -->
			<c:set var="startBlockPage" value="${(page - 1) - ((page - 1) % blockSize) + 1}" />
			
			<!-- 현재 블록의 끝 페이지 번호 -->
			<c:set var="endBlockPage" value="${startBlockPage + blockSize - 1}" />
			<!-- 마지막 블록 페이지가 전체 페이지 개수보다 클 경우 -->
			<c:if test="${endBlockPage > pagesCount}">
			  <c:set var="endBlockPage" value="${pagesCount}" />
			</c:if>
			
			<div class="page_wrap">
				<div class="page_nation">
				
					 <!-- 이전 블록 버튼 -->
					  <c:if test="${page > blockSize}">
					    <a href="${baseUri }&page=${startBlockPage - blockSize}">&lt</a>
					  </c:if>
					  
					<!-- 페이지 그룹 -->
					<c:forEach var="pageNumber" begin="${startBlockPage}" end="${endBlockPage}">
					  <c:if test="${pageNumber <= pagesCount}">
					    <c:choose>
					      <c:when test="${pageNumber == page}">
					        <a class="active" href="${baseUri }&page=${pageNumber}">${pageNumber}</a>
					      </c:when>
					      <c:otherwise>
					        <a href="${baseUri }&page=${pageNumber}">${pageNumber}</a>
					      </c:otherwise>
					    </c:choose>
					  </c:if>
					</c:forEach>
					
					<!-- 다음 블록 버튼 -->
					<c:if test="${endBlockPage < pagesCount}">
				        <a href="${baseUri }&page=${endBlockPage + 1}">&gt</a>
				    </c:if>
				</div>
			</div>
			
        </div>
    </div>
    
</section>

<%@ include file="../common/foot.jspf"%>