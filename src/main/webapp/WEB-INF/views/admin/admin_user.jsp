<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>admin user</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="/resources/js/jquery.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/admin_nav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_user.css">
</head>
<body>
<%@include file = "nav/admin_nav.jsp" %>
    <nav th:replace="admin/admin_nav :: navFragment"></nav>
    <section>
        <div class="item">
            <div class="item-caption">
                <div class="item-title">회원 기본 정보</div>
            </div>
            <div class="item-content">
                <table>
                    <colgroup>
                        <col width="15%"/>
                        <col width="85%"/>
                    </colgroup>
                  <%--   <tr>
                        <th>아이디</th>
                        <td th:text="${Member.loginId}">sejchae</td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td th:text="${Member.name}">채창완</td>
                    </tr>
                    <tr>
                        <th>생년월일</th>
                        <td th:text="${Member.birthday}">1994-04-06</td>
                    </tr>
                    <tr>
                        <th>성별</th>
                        <td th:text="${Member.sex}">남자</td>
                    </tr>
                    <tr>
                        <th>방문횟수</th>
                        <td th:text="${Member.visitCount}">11</td>
                    </tr>
                    <tr>
                        <th>주문횟수</th>
                        <td th:text="${Member.orderCount}">2</td>
                    </tr>
                    <tr>
                        <th>적립금</th>
<!--                        <td th:text="${Member.mileageList}">2000원</td>-->
                        <td>2000원</td>
                    </tr>
                    <tr>
                        <th>가입일</th>
                        <td th:text="${#temporals.format(Member.createdAt, 'yyyy-MM-dd')}">2021-04-12</td>
                    </tr>
                    <tr>
                        <th>이메일</th>
                        <td th:text="${Member.email}">changwani@gmail.com</td>
                    </tr>
                    <tr>
                        <th>휴대전화</th>
                        <td th:text="${#strings.replace(Member.phoneNumber, ',', '-')}">010-1234-5678</td>
                    </tr>
                    <tr>
                        <th>일반전화</th>
                        <td th:text="${#strings.replace(Member.homePhoneNumber, ',', '-')}">02-1234-5678</td>
                    </tr> --%>
                </table>
            </div>
        </div>
        <div class="bottom">
            <div class="bottombtn">
                <input type="button" value="뒤로가기" onclick="history.back()">
            </div>
        </div>
    </section>
    <script src="/resources/js/admin/admin_nav.js"></script>
</body>
</html>