<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
								  <td>${list.title}</td>
								  <td>${list.regDate}</td>
								  <td>${list.writer}</td>
								  <td>${list.viewCnt}</td>
								 </tr>
								</c:forEach>
							</tbody>
						</table>
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