<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="PASSWORD CHECK" />
<%@ include file="../common/head.jspf"%>
<hr />
<section class="mt-8 text-xl">
	<div class="container mx-auto px-3">
		<div class="table-box-type-1">
			<form action="doCheckPw" method="POST">
			<input type="hidden" name="replaceUri" value="${param.replaceUri }" />
				<table border="1">
					<colgroup>
						<col width="200" />
					</colgroup>

					<tbody>
						<tr>
							<td>아이디</td>
							<td>${rq.loginedMember.loginId }</td>
						</tr>
						<tr>
							<td>비밀번호</td>
							<td>
								<input class="input input-bordered w-full max-w-xs" type="text" autocomplete="off"
									placeholder="비밀번호를 입력해 주세요." name="loginPw" required/>
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="submit">확인</button>
							</td>
						</tr>
					</tbody>
				</table>
			</form>
		</div>
		<div>
			<button class="btn-text-link btn btn-active btn-ghost" type="button" onclick="history.back();">뒤로가기</button>
		</div>
	</div>
</section>
<%@ include file="../common/foot.jspf"%>