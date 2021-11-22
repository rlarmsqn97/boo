<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원목록</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/admin_userlist.css">
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    
    <!-- 모달 -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@include file = "nav/admin_nav.jsp" %>
<section>
    <form class= "search-form" id="search-form" method="GET" th:action="@{/admin/userList}">
        <select name="searchCondition" class="search-mode search-item" form="search-form">
            <option value="userid">아이디</option>
            <option value="username">이름</option>
<!--            <option value="phone">휴대전화</option>-->
<!--            <option value="visit">방문횟수</option>-->
<!--            <option value="order">주문횟수</option>-->
        </select>
        <input type="text" name="searchKeyword" class="search-input search-item">
        <input type="submit" class="search-submit search-item" value="검색">
    </form>
    <div class="user-box">
        <div class="num-searched-box">
            총 <b class="num-searched"><%-- <span th:text="${memberList.totalElements}"> --%></b> 명의 회원이 검색되었습니다
        </div>
        <table class="user-table">
            <thead>
            <tr>
                <th><input type="checkbox" class="checkbox-selectall"></th>
                <th>이름</th>
                <th>전화번호</th>
                <th>Email</th>
                <th>가입 날짜</th>
                <th>총 구매금액</th>
                
            </tr>
            </thead>
            
            <tbody>
            
           	<c:forEach items="${userList }" var="userList">
            <tr>
              <td><input type="checkbox" class="checkbox-select"></td>
              <td data-toggle="modal" data-target="#myModal">${userList.userName}</td>
              <td>${userList.userPhon}</td>
              <td>${userList.userMail}</td>
			  <td>${userList.regiDate }</td> 
			  <td>${userList.amount }</td> 
              <!-- <td><input type="button" value="보기" class="userdetailbtn table-btn"></td>
              <td><input type="button" value="삭제" class="deletebtn table-btn"></td> -->          
            </tr> 
             </c:forEach>
            </tbody>
        </table>

        <div class="bottombtn-box">
            <input type="button" value="전체선택" class="selectallbtn bottombtn" th:onclick="|checkall()|">
            <input type="button" value="선택삭제" class="bottom-deletebtn bottombtn" th:onclick="|deleteCheckedUsers()|">

        </div>
        
        <div class="col-sm-4">
							<div class="d-flex">
								<div class="ml-auto">
									<button class="btn btn-primary" data-toggle="modal" data-target="#AdminSignUp">회원등록</button>
									<input type="button" class="btn btn-primary" value="선택삭제" onclick="deleteValue();">
								</div>
							</div>
						</div>
						
						
        <!-- 여기 수정 -->
        <div class="paginate">
            <ul class="pagination justify-content-center">
               <%--  <li class="page-item" th:classappend="${1 == memberList.pageable.pageNumber + 1} ? 'disabled'">
                    <a class="page-link" href="#" th:href="@{/admin/userList(page=${memberList.pageable.pageNumber - 1},searchCondition=${searchCondition},searchKeyword=${searchKeyword})}" tabindex="-1" aria-disabled="true">Previous</a>
                </li>

                <li class="page-item" th:classappend="${i == memberList.pageable.pageNumber + 1} ? 'disabled'" th:each="i : ${#numbers.sequence(startPage, endPage)}">
                    <a class="page-link" href="#" th:href="@{/admin/userList(page=${i - 1},searchCondition=${searchCondition},searchKeyword=${searchKeyword})}" th:text="${i}">1</a></li>

                <li class="page-item" th:classappend="${memberList.totalPages == memberList.pageable.pageNumber + 1} ? 'disabled'">
                    <a class="page-link" href="#" th:href="@{/admin/userList(page=${memberList.pageable.pageNumber + 1},searchCondition=${searchCondition},searchKeyword=${searchKeyword})}">Next</a>
                </li> --%>
            </ul>
        </div>
        <!-- 여기까지 -->
    </div>
 <!-- 회원 등록 -->
	<div class="modal fade" id="AdminSignUp" tabindex="-1" role="dialog" aria-labelledby="memberModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-title text-center">
						<h4>회원 등록</h4>
						<hr>
					</div>
					<div class="d-flex flex-column">
						<form name="form" id="form" action="AdminSignUp" method="POST">
							<!-- 아이디 & 비밀번호 -->
							<div class="form-group row">
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">아이디</span>
										</div>
										<input type="text" name="UserID" id="account" class="form-control" required>
									</div>
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">비밀번호</span>
										</div>
										<input type="password" name="Password" id="password" class="form-control">
									</div>
								</div>
							</div>
							<!-- 이름 & 마일리지 -->
							<div class="form-group row">
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">이름</span>
										</div>
										<input type="text" id="Name" name="Name" class="form-control" required>
									</div>
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">마일리지</span>
										</div>
										<input type="text" name="Mileage" id="Mileage" class="form-control" required>
									</div>
								</div>
							</div>
							<!-- 권한 & 성별 -->
							<div class="form-group row">
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text" id="Grade">권한</span>
										</div>
										<select class="form-control">
											<option value="일반">일반</option>
											<option value="VIP">VIP</option>
											<option value="블랙">블랙</option>
											<option value="관리자">관리자</option>
										</select>
									</div>
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">성별</span>
										</div>
										<select class="form-control" id="Sex">
											<option value="1" >남성</option>
											<option value="0" >여성</option>
										</select>
									</div>
								</div>
							</div>
							<!-- 이메일 & 휴대전화 -->
							<div class="form-group row">
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">이메일</span>
										</div>
										<input type="email" name="Email" id="Email" class="form-control" required>
									</div>
								</div>
								<div class="col-xs-6 col-md-6">
									<div class="input-group my-2 mb-1">
										<div class="input-group-prepend">
											<span class="input-group-text">휴대전화</span>
										</div>
										<input type="tel" name="Phone" id="Phone" class="form-control" required>
									</div>
								</div>
							</div>
							<!-- 특이사항 -->
							<div class="form-group">
								<div class="input-group my-2 mb-1">
									<div class="input-group-prepend">
										<span class="input-group-text">특이사항</span>
									</div>
									<textarea rows="5" cols="25" name="comment" id="comment" class="form-control"></textarea>
								</div>
							</div>
							
							<button type="submit" class="btn btn-primary btn-block btn-round" onclick="adminsubmit()">회원등록</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script src="/resources/js/admin/admin_nav.js"></script>
<script src="/resources/js/admin/admin_userlist.js"></script>

</body>
</html>