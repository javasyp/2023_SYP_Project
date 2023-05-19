<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="버스 시간표 상세" />
<%@ include file="../common/head.jspf"%>

<section class="mt-8">
	<div class="">
		<div class="table-box-type-1">
			<table border="1">
				<colgroup>
					<col width="150" />
				</colgroup>
				<thead>
					<tr>
						<th>구분</th>
						<th colspan="2">1</th>
						<th colspan="2">2</th>
						<th colspan="2">3</th>
						<th colspan="2">4</th>
						<th colspan="2">5</th>
						<th colspan="2">6</th>
						<th colspan="2">7</th>
						<th colspan="2">8</th>
						<th colspan="2">9</th>
						<th colspan="2">10</th>
					</tr>
				</thead>
	
				<tbody>
					<c:forEach var="bustime" items="${bustime }">
						<tr style="width:100px;">
							<td>${bustime.line }</td>
							<td>${bustime.startingPoint1_1 }</td>
							<td>${bustime.startingPoint1_2 }</td>
							<td>${bustime.startingPoint2_1 }</td>
							<td>${bustime.startingPoint2_2 }</td>
							<td>${bustime.startingPoint3_1 }</td>
							<td>${bustime.startingPoint3_2 }</td>
							<td>${bustime.startingPoint4_1 }</td>
							<td>${bustime.startingPoint4_2 }</td>
							<td>${bustime.startingPoint5_1 }</td>
							<td>${bustime.startingPoint5_2 }</td>
							<td>${bustime.startingPoint6_1 }</td>
							<td>${bustime.startingPoint6_2 }</td>
							<td>${bustime.startingPoint7_1 }</td>
							<td>${bustime.startingPoint7_2 }</td>
							<td>${bustime.startingPoint8_1 }</td>
							<td>${bustime.startingPoint8_2 }</td>
							<td>${bustime.startingPoint9_1 }</td>
							<td>${bustime.startingPoint9_2 }</td>
							<td>${bustime.startingPoint10_1 }</td>
							<td>${bustime.startingPoint10_2 }</td>
						</tr>
					</c:forEach>
				</tbody>
	
			</table>
		</div>
	</div>
</section>

<%@ include file="../common/foot.jspf"%>