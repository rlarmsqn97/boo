<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원상세</title>
    <script src="/resources/js/jquery.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/admin_userlist.css">
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav th:replace="admin/admin_nav :: navFragment"></nav>
<%@include file = "nav/admin_nav.jsp" %>
<section>
    <form class= "search-form" id="search-form" method="GET" th:action="@{/admin/userList}">
        <select name="searchCondition" class="search-mode search-item" form="search-form">         
            <option value="userName">이름</option>
            <option value="userPhon">번호</option>
<!--            <option value="phone">휴대전화</option>-->
<!--            <option value="visit">방문횟수</option>-->
<!--            <option value="order">주문횟수</option>-->
        </select>
        <input type="text" name="searchKeyword" class="search-input search-item">
        <input type="submit" class="search-submit search-item" value="검색">
    </form>
    <div class="user-box">
        <table class="user-table">
            <thead>
            <tr>
                <th>이름</th>
                <th>전화번호</th>
                <th>Email</th>
                <th>가입 날짜</th>
         		<th>총 구매금액</th>
            </tr>
            </thead>
            
            <c:forEach items="${userDetail }" var="userDetail" > 
            <tbody>            
            <tr>
                <td>${userDetail.userName}</td>
                <td >${userDetail.userPhon}</td>
                <td >${userDetail.userMail}</td>
                <td >${userDetail.regiDate }</td>
                <td>${userDetail.amount}</td>        
            </tr>  
            </tbody>
            </c:forEach>         
        </table>
        <div style="height: 100px">

        </div>
        <span>주문내역</span>
        <table class="user-table">
            <thead>
            <tr>
                <th scope="rowgroup">상품이미지</th>
                <th scope="rowgroup">상품명</th>
                <th scope="rowgroup">대여일</th>
                <th scope="rowgroup">반납일</th>            
                <th scope="rowgroup">개당가격</th>
                <th scope="rowgroup">구입수량</th>
                <th scope="rowgroup">최총가격</th>
                <th scope="rowgroup">상태</th>
                
            </tr>
            </thead>
            
            <c:forEach items="${userDetail }" var="userDetail"> 
            <tbody>            
            <tr>
                <td scope="row"><img src="${userDetail.pdThumbImg}"/></td>
                <td scope="row">${userDetail.pdName}</td>
                <td scope="row">${userDetail.startDate}</td>
                <td scope="row">${userDetail.endDate}</td>
                <td scope="row">${userDetail.pdPrice}</td>
                <td scope="row">${userDetail.cartStock}</td>
                <td scope="row">${userDetail.pdPrice * userDetail.cartStock}</td>
                <td scope="row">${userDetail.delivery}</td>           
            </tr>  
            </tbody>
            </c:forEach>         
        </table>
        
        

        <div class="bottombtn-box">
            <input type="button" value="전체선택" class="selectallbtn bottombtn" th:onclick="|checkall()|">
            <input type="button" value="선택삭제" class="bottom-deletebtn bottombtn" th:onclick="|deleteCheckedUsers()|">

        </div>
        <!-- 여기 수정 -->
        <div class="paginate">
            <ul class="pagination justify-content-center">
                <li >
                    <a>Previous</a>
                </li>

                <li>
                    <a ></a></li>

                <li>
                    <a>Next</a>
                </li>
            </ul>
        </div>
        <!-- 여기까지 -->
    </div>
</section>
<script src="/resources/js/admin/admin_nav.js"></script>
<script src="/resources/js/admin/admin_userlist.js"></script>

</body>
</html>