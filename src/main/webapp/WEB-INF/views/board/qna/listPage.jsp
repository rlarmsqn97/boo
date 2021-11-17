<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>QnA 목록</title>
    <%@ include file="../../include/mainmenu.jsp" %>
</head>
<body>
	<div class="container" style="padding : 150px;">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<table>
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성일</th>
									<th>작성자</th>
									<th>조회수</th>
								</tr>
							</thead>
					
							<tbody>
								<c:forEach items="${list}" var="list">
								 <tr>
								  <td>${list.bno}</td>
								  <td><a href="/board/qna/view?bno=${list.bno}">${list.title}</a></td>
								  <td><fmt:formatDate value="${list.regDate}" pattern="yyyy년-MM월-dd일" /></td>
								  <td>${list.writer}</td>
								  <td>${list.viewCnt}</td>
								 </tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div>
							<c:if test="${page.prev }">
								<span>[ <a href="/board/qna/listPage?num=${page.startPageNum -1 }">이전</a> ]</span>			
							</c:if>
							
							<c:forEach begin="${page.startPageNum }" end="${page.endPageNum }" var="num">
								<span>
									<c:if test="${select != num }">
										<a href="/board/qna/listPage?num=${num }">${num }</a>
									</c:if>
									
									<c:if test="${select == num }">
										<b>${num }</b>
									</c:if>
								</span>
							</c:forEach>
							
							<c:if test="${page.next }">
								<span>[ <a href="/board/qna/listPage?num=${page.endPageNum + 1}">다음</a> ]</span>
							</c:if>						
						</div>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="button" onclick="location.href='/board/qna/write'">글쓰기</button>	
						</div>
					</div>
				</div>
			</div>
		</div>
	
		<%@ include file="../../include/footer.jsp" %>
</body>
</html>