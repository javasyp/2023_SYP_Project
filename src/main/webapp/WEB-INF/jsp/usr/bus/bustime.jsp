<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.ArrayList" %>
<c:set var="pageTitle" value="버스 시간표" />
<%@ include file="../common/head.jspf"%>

<hr />
<script>
//테이블 요소 찾기
const table = document.getElementById("your-table-id");

// 데이터 배열을 순회하면서 각 행을 생성
data.forEach((rowData, index) => {
  // tr 요소 생성
  const row = document.createElement("tr");

  // 첫 번째 열(td) 생성
  const firstCell = document.createElement("td");
  firstCell.textContent = index + 1;
  row.appendChild(firstCell);

  // 데이터 배열의 요소를 순회하면서 나머지 열(td) 생성
  rowData.forEach((cellData) => {
    const cell = document.createElement("td");
    cell.textContent = cellData;
    row.appendChild(cell);
  });

  // 테이블에 행 추가
  table.appendChild(row);
});
</script>

<select name="" id="">
	<option value="1">급행1번</option>
	<option value="1">급행1번</option>
	<option value="1">급행1번</option>
	<option value="1">급행1번</option>
</select>
<select name="" id="">
	<option value="1"></option>
</select>

<table th:each="data : ${data}">
	<tr>
		<!-- <th>데이터</th> -->
		<th>번호</th>
		<th>출발점</th>
		<th>종점</th>
		<th>운행일</th>
		<th>운행사</th>
		<th>평균간격</th>
		<th>편도</th>
		<th>시행일</th>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[0][0]} </td>
		<td> ${data[0][7]} </td>
		<td> ${data[0][11]} </td>
		<td> ${data[0][19]} </td>
		<td> ${data[2][2]} </td>
		<td> ${data[2][15]} </td>
		<td> ${data[2][19]} </td>
		<td> ${data[39][2]} </td>
	</tr>
</table>
<table th:each="data : ${data}" id="your-table-id">
	<tr>
		<!-- <th>데이터</th> -->
		<td rowspan="2"> 구분 </td>
		<td colspan="2"> 1 </td>
		<td colspan="2"> 2 </td>
		<td colspan="2"> 3 </td>
		<td colspan="2"> 4 </td>
		<td colspan="2"> 5 </td>
		<td colspan="2"> 6 </td>
		<td colspan="2"> 7 </td>
		<td colspan="2"> 8 </td>
		<td colspan="2"> 9 </td>
		<td colspan="2"> 10 </td>
		<!-- <th>시트</th> -->
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[5][1]} </td>
		<td> ${data[5][2]} </td>
		<td> ${data[5][3]} </td>
		<td> ${data[5][4]} </td>
		<td> ${data[5][5]} </td>
		<td> ${data[5][6]} </td>
		<td> ${data[5][7]} </td>
		<td> ${data[5][8]} </td>
		<td> ${data[5][9]} </td>
		<td> ${data[5][10]} </td>
		<td> ${data[5][11]} </td>
		<td> ${data[5][12]} </td>
		<td> ${data[5][13]} </td>
		<td> ${data[5][14]} </td>
		<td> ${data[5][15]} </td>
		<td> ${data[5][16]} </td>
		<td> ${data[5][17]} </td>
		<td> ${data[5][18]} </td>
		<td> ${data[5][19]} </td>
		<td> ${data[5][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[6][0]} </td>
		<td> ${data[6][1]} </td>
		<td> ${data[6][2]} </td>
		<td> ${data[6][3]} </td>
		<td> ${data[6][4]} </td>
		<td> ${data[6][5]} </td>
		<td> ${data[6][6]} </td>
		<td> ${data[6][7]} </td>
		<td> ${data[6][8]} </td>
		<td> ${data[6][9]} </td>
		<td> ${data[6][10]} </td>
		<td> ${data[6][11]} </td>
		<td> ${data[6][12]} </td>
		<td> ${data[6][13]} </td>
		<td> ${data[6][14]} </td>
		<td> ${data[6][15]} </td>
		<td> ${data[6][16]} </td>
		<td> ${data[6][17]} </td>
		<td> ${data[6][18]} </td>
		<td> ${data[6][19]} </td>
		<td> ${data[6][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[7][0]} </td>
		<td> ${data[7][1]} </td>
		<td> ${data[7][2]} </td>
		<td> ${data[7][3]} </td>
		<td> ${data[7][4]} </td>
		<td> ${data[7][5]} </td>
		<td> ${data[7][6]} </td>
		<td> ${data[7][7]} </td>
		<td> ${data[7][8]} </td>
		<td> ${data[7][9]} </td>
		<td> ${data[7][10]} </td>
		<td> ${data[7][11]} </td>
		<td> ${data[7][12]} </td>
		<td> ${data[7][13]} </td>
		<td> ${data[7][14]} </td>
		<td> ${data[7][15]} </td>
		<td> ${data[7][16]} </td>
		<td> ${data[7][17]} </td>
		<td> ${data[7][18]} </td>
		<td> ${data[7][19]} </td>
		<td> ${data[7][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[8][0]} </td>
		<td> ${data[8][1]} </td>
		<td> ${data[8][2]} </td>
		<td> ${data[8][3]} </td>
		<td> ${data[8][4]} </td>
		<td> ${data[8][5]} </td>
		<td> ${data[8][6]} </td>
		<td> ${data[8][7]} </td>
		<td> ${data[8][8]} </td>
		<td> ${data[8][9]} </td>
		<td> ${data[8][10]} </td>
		<td> ${data[8][11]} </td>
		<td> ${data[8][12]} </td>
		<td> ${data[8][13]} </td>
		<td> ${data[8][14]} </td>
		<td> ${data[8][15]} </td>
		<td> ${data[8][16]} </td>
		<td> ${data[8][17]} </td>
		<td> ${data[8][18]} </td>
		<td> ${data[8][19]} </td>
		<td> ${data[8][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[9][0]} </td>
		<td> ${data[9][1]} </td>
		<td> ${data[9][2]} </td>
		<td> ${data[9][3]} </td>
		<td> ${data[9][4]} </td>
		<td> ${data[9][5]} </td>
		<td> ${data[9][6]} </td>
		<td> ${data[9][7]} </td>
		<td> ${data[9][8]} </td>
		<td> ${data[9][9]} </td>
		<td> ${data[9][10]} </td>
		<td> ${data[9][11]} </td>
		<td> ${data[9][12]} </td>
		<td> ${data[9][13]} </td>
		<td> ${data[9][14]} </td>
		<td> ${data[9][15]} </td>
		<td> ${data[9][16]} </td>
		<td> ${data[9][17]} </td>
		<td> ${data[9][18]} </td>
		<td> ${data[9][19]} </td>
		<td> ${data[9][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[10][0]} </td>
		<td> ${data[10][1]} </td>
		<td> ${data[10][2]} </td>
		<td> ${data[10][3]} </td>
		<td> ${data[10][4]} </td>
		<td> ${data[10][5]} </td>
		<td> ${data[10][6]} </td>
		<td> ${data[10][7]} </td>
		<td> ${data[10][8]} </td>
		<td> ${data[10][9]} </td>
		<td> ${data[10][10]} </td>
		<td> ${data[10][11]} </td>
		<td> ${data[10][12]} </td>
		<td> ${data[10][13]} </td>
		<td> ${data[10][14]} </td>
		<td> ${data[10][15]} </td>
		<td> ${data[10][16]} </td>
		<td> ${data[10][17]} </td>
		<td> ${data[10][18]} </td>
		<td> ${data[10][19]} </td>
		<td> ${data[10][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[11][0]} </td>
		<td> ${data[11][1]} </td>
		<td> ${data[11][2]} </td>
		<td> ${data[11][3]} </td>
		<td> ${data[11][4]} </td>
		<td> ${data[11][5]} </td>
		<td> ${data[11][6]} </td>
		<td> ${data[11][7]} </td>
		<td> ${data[11][8]} </td>
		<td> ${data[11][9]} </td>
		<td> ${data[11][10]} </td>
		<td> ${data[11][11]} </td>
		<td> ${data[11][12]} </td>
		<td> ${data[11][13]} </td>
		<td> ${data[11][14]} </td>
		<td> ${data[11][15]} </td>
		<td> ${data[11][16]} </td>
		<td> ${data[11][17]} </td>
		<td> ${data[11][18]} </td>
		<td> ${data[11][19]} </td>
		<td> ${data[11][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[12][0]} </td>
		<td> ${data[12][1]} </td>
		<td> ${data[12][2]} </td>
		<td> ${data[12][3]} </td>
		<td> ${data[12][4]} </td>
		<td> ${data[12][5]} </td>
		<td> ${data[12][6]} </td>
		<td> ${data[12][7]} </td>
		<td> ${data[12][8]} </td>
		<td> ${data[12][9]} </td>
		<td> ${data[12][10]} </td>
		<td> ${data[12][11]} </td>
		<td> ${data[12][12]} </td>
		<td> ${data[12][13]} </td>
		<td> ${data[12][14]} </td>
		<td> ${data[12][15]} </td>
		<td> ${data[12][16]} </td>
		<td> ${data[12][17]} </td>
		<td> ${data[12][18]} </td>
		<td> ${data[12][19]} </td>
		<td> ${data[12][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[13][0]} </td>
		<td> ${data[13][1]} </td>
		<td> ${data[13][2]} </td>
		<td> ${data[13][3]} </td>
		<td> ${data[13][4]} </td>
		<td> ${data[13][5]} </td>
		<td> ${data[13][6]} </td>
		<td> ${data[13][7]} </td>
		<td> ${data[13][8]} </td>
		<td> ${data[13][9]} </td>
		<td> ${data[13][10]} </td>
		<td> ${data[13][11]} </td>
		<td> ${data[13][12]} </td>
		<td> ${data[13][13]} </td>
		<td> ${data[13][14]} </td>
		<td> ${data[13][15]} </td>
		<td> ${data[13][16]} </td>
		<td> ${data[13][17]} </td>
		<td> ${data[13][18]} </td>
		<td> ${data[13][19]} </td>
		<td> ${data[13][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[14][0]} </td>
		<td> ${data[14][1]} </td>
		<td> ${data[14][2]} </td>
		<td> ${data[14][3]} </td>
		<td> ${data[14][4]} </td>
		<td> ${data[14][5]} </td>
		<td> ${data[14][6]} </td>
		<td> ${data[14][7]} </td>
		<td> ${data[14][8]} </td>
		<td> ${data[14][9]} </td>
		<td> ${data[14][10]} </td>
		<td> ${data[14][11]} </td>
		<td> ${data[14][12]} </td>
		<td> ${data[14][13]} </td>
		<td> ${data[14][14]} </td>
		<td> ${data[14][15]} </td>
		<td> ${data[14][16]} </td>
		<td> ${data[14][17]} </td>
		<td> ${data[14][18]} </td>
		<td> ${data[14][19]} </td>
		<td> ${data[14][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[15][0]} </td>
		<td> ${data[15][1]} </td>
		<td> ${data[15][2]} </td>
		<td> ${data[15][3]} </td>
		<td> ${data[15][4]} </td>
		<td> ${data[15][5]} </td>
		<td> ${data[15][6]} </td>
		<td> ${data[15][7]} </td>
		<td> ${data[15][8]} </td>
		<td> ${data[15][9]} </td>
		<td> ${data[15][10]} </td>
		<td> ${data[15][11]} </td>
		<td> ${data[15][12]} </td>
		<td> ${data[15][13]} </td>
		<td> ${data[15][14]} </td>
		<td> ${data[15][15]} </td>
		<td> ${data[15][16]} </td>
		<td> ${data[15][17]} </td>
		<td> ${data[15][18]} </td>
		<td> ${data[15][19]} </td>
		<td> ${data[15][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[16][0]} </td>
		<td> ${data[16][1]} </td>
		<td> ${data[16][2]} </td>
		<td> ${data[16][3]} </td>
		<td> ${data[16][4]} </td>
		<td> ${data[16][5]} </td>
		<td> ${data[16][6]} </td>
		<td> ${data[16][7]} </td>
		<td> ${data[16][8]} </td>
		<td> ${data[16][9]} </td>
		<td> ${data[16][10]} </td>
		<td> ${data[16][11]} </td>
		<td> ${data[16][12]} </td>
		<td> ${data[16][13]} </td>
		<td> ${data[16][14]} </td>
		<td> ${data[16][15]} </td>
		<td> ${data[16][16]} </td>
		<td> ${data[16][17]} </td>
		<td> ${data[16][18]} </td>
		<td> ${data[16][19]} </td>
		<td> ${data[16][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[17][0]} </td>
		<td> ${data[17][1]} </td>
		<td> ${data[17][2]} </td>
		<td> ${data[17][3]} </td>
		<td> ${data[17][4]} </td>
		<td> ${data[17][5]} </td>
		<td> ${data[17][6]} </td>
		<td> ${data[17][7]} </td>
		<td> ${data[17][8]} </td>
		<td> ${data[17][9]} </td>
		<td> ${data[17][10]} </td>
		<td> ${data[17][11]} </td>
		<td> ${data[17][12]} </td>
		<td> ${data[17][13]} </td>
		<td> ${data[17][14]} </td>
		<td> ${data[17][15]} </td>
		<td> ${data[17][16]} </td>
		<td> ${data[17][17]} </td>
		<td> ${data[17][18]} </td>
		<td> ${data[17][19]} </td>
		<td> ${data[17][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[18][0]} </td>
		<td> ${data[18][1]} </td>
		<td> ${data[18][2]} </td>
		<td> ${data[18][3]} </td>
		<td> ${data[18][4]} </td>
		<td> ${data[18][5]} </td>
		<td> ${data[18][6]} </td>
		<td> ${data[18][7]} </td>
		<td> ${data[18][8]} </td>
		<td> ${data[18][9]} </td>
		<td> ${data[18][10]} </td>
		<td> ${data[18][11]} </td>
		<td> ${data[18][12]} </td>
		<td> ${data[18][13]} </td>
		<td> ${data[18][14]} </td>
		<td> ${data[18][15]} </td>
		<td> ${data[18][16]} </td>
		<td> ${data[18][17]} </td>
		<td> ${data[18][18]} </td>
		<td> ${data[18][19]} </td>
		<td> ${data[18][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[19][0]} </td>
		<td> ${data[19][1]} </td>
		<td> ${data[19][2]} </td>
		<td> ${data[19][3]} </td>
		<td> ${data[19][4]} </td>
		<td> ${data[19][5]} </td>
		<td> ${data[19][6]} </td>
		<td> ${data[19][7]} </td>
		<td> ${data[19][8]} </td>
		<td> ${data[19][9]} </td>
		<td> ${data[19][10]} </td>
		<td> ${data[19][11]} </td>
		<td> ${data[19][12]} </td>
		<td> ${data[19][13]} </td>
		<td> ${data[19][14]} </td>
		<td> ${data[19][15]} </td>
		<td> ${data[19][16]} </td>
		<td> ${data[19][17]} </td>
		<td> ${data[19][18]} </td>
		<td> ${data[19][19]} </td>
		<td> ${data[19][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[20][0]} </td>
		<td> ${data[20][1]} </td>
		<td> ${data[20][2]} </td>
		<td> ${data[20][3]} </td>
		<td> ${data[20][4]} </td>
		<td> ${data[20][5]} </td>
		<td> ${data[20][6]} </td>
		<td> ${data[20][7]} </td>
		<td> ${data[20][8]} </td>
		<td> ${data[20][9]} </td>
		<td> ${data[20][10]} </td>
		<td> ${data[20][11]} </td>
		<td> ${data[20][12]} </td>
		<td> ${data[20][13]} </td>
		<td> ${data[20][14]} </td>
		<td> ${data[20][15]} </td>
		<td> ${data[20][16]} </td>
		<td> ${data[20][17]} </td>
		<td> ${data[20][18]} </td>
		<td> ${data[20][19]} </td>
		<td> ${data[20][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[21][0]} </td>
		<td> ${data[21][1]} </td>
		<td> ${data[21][2]} </td>
		<td> ${data[21][3]} </td>
		<td> ${data[21][4]} </td>
		<td> ${data[21][5]} </td>
		<td> ${data[21][6]} </td>
		<td> ${data[21][7]} </td>
		<td> ${data[21][8]} </td>
		<td> ${data[21][9]} </td>
		<td> ${data[21][10]} </td>
		<td> ${data[21][11]} </td>
		<td> ${data[21][12]} </td>
		<td> ${data[21][13]} </td>
		<td> ${data[21][14]} </td>
		<td> ${data[21][15]} </td>
		<td> ${data[21][16]} </td>
		<td> ${data[21][17]} </td>
		<td> ${data[21][18]} </td>
		<td> ${data[21][19]} </td>
		<td> ${data[21][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[22][0]} </td>
		<td> ${data[22][1]} </td>
		<td> ${data[22][2]} </td>
		<td> ${data[22][3]} </td>
		<td> ${data[22][4]} </td>
		<td> ${data[22][5]} </td>
		<td> ${data[22][6]} </td>
		<td> ${data[22][7]} </td>
		<td> ${data[22][8]} </td>
		<td> ${data[22][9]} </td>
		<td> ${data[22][10]} </td>
		<td> ${data[22][11]} </td>
		<td> ${data[22][12]} </td>
		<td> ${data[22][13]} </td>
		<td> ${data[22][14]} </td>
		<td> ${data[22][15]} </td>
		<td> ${data[22][16]} </td>
		<td> ${data[22][17]} </td>
		<td> ${data[22][18]} </td>
		<td> ${data[22][19]} </td>
		<td> ${data[22][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	<tr>
		<!-- <td> ${data} </td> -->
		<td> ${data[23][0]} </td>
		<td> ${data[23][1]} </td>
		<td> ${data[23][2]} </td>
		<td> ${data[23][3]} </td>
		<td> ${data[23][4]} </td>
		<td> ${data[23][5]} </td>
		<td> ${data[23][6]} </td>
		<td> ${data[23][7]} </td>
		<td> ${data[23][8]} </td>
		<td> ${data[23][9]} </td>
		<td> ${data[23][10]} </td>
		<td> ${data[23][11]} </td>
		<td> ${data[23][12]} </td>
		<td> ${data[23][13]} </td>
		<td> ${data[23][14]} </td>
		<td> ${data[23][15]} </td>
		<td> ${data[23][16]} </td>
		<td> ${data[23][17]} </td>
		<td> ${data[23][18]} </td>
		<td> ${data[23][19]} </td>
		<td> ${data[23][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
	
	<tr>
		<!-- <td> ${data} </td> -->
		<c:foreach>
		</c:foreach>
		<td> ${data[23][0]} </td>
		<td> ${data[23][1]} </td>
		<td> ${data[23][2]} </td>
		<td> ${data[23][3]} </td>
		<td> ${data[23][4]} </td>
		<td> ${data[23][5]} </td>
		<td> ${data[23][6]} </td>
		<td> ${data[23][7]} </td>
		<td> ${data[23][8]} </td>
		<td> ${data[23][9]} </td>
		<td> ${data[23][10]} </td>
		<td> ${data[23][11]} </td>
		<td> ${data[23][12]} </td>
		<td> ${data[23][13]} </td>
		<td> ${data[23][14]} </td>
		<td> ${data[23][15]} </td>
		<td> ${data[23][16]} </td>
		<td> ${data[23][17]} </td>
		<td> ${data[23][18]} </td>
		<td> ${data[23][19]} </td>
		<td> ${data[23][20]} </td>
		<td> <!-- ${sheetName}  --></td>
	</tr>
</table>
	
<table>
	<c:forEach var="pageIndex" begin="0" end="0">
		<tr><%
			int pageSize = 20;
	 		int pageCount = (40 + pageSize - 1) / pageSize; // 전체 페이지 수
		  	%>
  			<c:forEach var="data" items="${data }">
  				<!-- ${data } <br>-->
  			</c:forEach>
		</tr>
	</c:forEach>
</table>