<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html xmlns:th="http://www.thymeleaf.org" lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" th:content="${_csrf.token}"/>
    <meta name="_csrf_header" th:content="${_csrf.headerName}"/>
    <title>전체주문내역</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_order.css">
    
    <style>
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
    </style>

</head>
<body>
<%@ include file="nav/admin_nav.jsp" %>
    <nav th:replace="admin/admin_nav :: navFragment"></nav>
    <section>
        <form class= "search-form" id="search-form" method="get" action="#">
            <div class="form-group">
                <label class="form-label">주문일</label>
                <span>
                    <input type="date" name="firstdate" class="date">&nbsp;~ 
                    <input type="date" name="lastdate" class="date">
                </span>
            </div>
           
            <div class="form-group">
                <label class="form-label">검색어</label>
                <span>
                    <select name="smode">
                        <option value="buyer">주문일</option>
                        <option value="buyer">구매자</option>
                    </select>
                    <input type="text" name="sinput" class="search-input">
                </span>
            </div>
            <div class="search-submit-box">
                <input type="submit" class="search-submit" value="검색">
            </div>
        </form>
        
		<div id="container_box">
			<ul class="orderList">
				<c:forEach items="${orderList}" var="orderList">
					<li>
						<div>
							<p>
								<span>주문번호</span><a
									href="/admin/orderView?n=${orderList.orderId}">${orderList.orderId}</a>
							</p>
							<p>
								<span>예약자</span>${orderList.userId}</p>
							<p>
								<span>렌터카회사명</span>${orderList.rentCar}</p>
							<p>
								<span>주문자 번호</span>${orderList.orderPhon}</p>
							<p>
								<span>가격</span>
								<fmt:formatNumber pattern="###,###,###"
									value="${orderList.amount}" />
								원
							</p>
							<p>
								<span>상태</span>${orderList.delivery}</p>
							
						</div>
					</li>
				</c:forEach>
			</ul>
		</div>
    </section>
    <script src="/resources/js/admin/admin_nav.js"></script>
    <script src="/resources/js/admin/admin_order.js"></script>
</body>
</html>