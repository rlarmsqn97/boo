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
           
            <tr>
             <c:forEach items="${userList }" var="userList">
              <td><input type="checkbox" class="checkbox-select"></td>
              <td>${userList.userName}</td>
              <td>${userList.userPhon}</td>
              <td>${userList.userMail}</td>
			  <td>${userList.regiDate }</td> 
              <!-- <td><input type="button" value="보기" class="userdetailbtn table-btn"></td>
              <td><input type="button" value="삭제" class="deletebtn table-btn"></td> -->
            </c:forEach> 
            </tr> 
            </tbody>
        </table>

        <div class="bottombtn-box">
            <input type="button" value="전체선택" class="selectallbtn bottombtn" th:onclick="|checkall()|">
            <input type="button" value="선택삭제" class="bottom-deletebtn bottombtn" th:onclick="|deleteCheckedUsers()|">

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
</section>
<script src="/resources/js/admin/admin_nav.js"></script>
<script src="/resources/js/admin/admin_userlist.js"></script>

</body>
</html>