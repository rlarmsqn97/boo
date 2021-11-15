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
    <title>주문상세내역</title>
    <script src="https://kit.fontawesome.com/e6f78261b2.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/resources/css/admin/adminnav.css">
    <link rel="stylesheet" href="/resources/css/admin/admin_order.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <style>
  .orderInfo { border:5px solid #eee; padding:10px 20px; margin:20px 0;}
 .orderInfo span { font-size:20px; font-weight:bold; display:inline-block; width:90px; }
 
 .orderView li { margin-bottom:20px; padding-bottom:20px; border-bottom:1px solid #999; }
 .orderView li::after { content:""; display:block; clear:both; }
 
 .thumb { float:left; width:200px; }
 .thumb img { width:200px; height:200px; }
 .gdsInfo { float:right; width:calc(100% - 220px); line-height:2; }
 .gdsInfo span { font-size:20px; font-weight:bold; display:inline-block; width:100px; margin-right:10px; }
 
 div#container_box ul li { border:5px solid #eee; padding:10px 20px; margin-bottom:20px; }
 div#container_box .orderList span { font-size:20px; font-weight:bold; display:inline-block; width:90px; margin-right:10px; }
 .deliveryChange { text-align:right; }
.delivery1_btn,
.delivery2_btn { font-size:16px; background:#fff; border:1px solid #999; margin-left:10px; }
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
        <div class="order-box">
           <ul class="orderList">
           
				 <li>
				 <div>		
				 <c:forEach items="${orderView}" var="orderView" varStatus="status">
				 <c:if test="${status.first}">
				  <p><span>예약자</span>${orderView.userId}</p>
				  <p><span>렌터카회사명</span>${orderView.rentCar}</p>
				  <p><span>주문자 번호</span>${orderView.orderPhon}</p>
				  <p><span>가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.amount}" /> 원</p>
				  <p><span>상태</span>${orderView.delivery}</p>
									<div class="deliveryChange">
										<form role="form" method="post" class="deliveryForm">
											<input type="hidden" name="orderId"
												value="${orderView.orderId }" /> <input type="hidden"
												name="delivery" class="delivery" value="" />

											<button type="button" class="delivery1_btn">배송 중</button>
											<button type="button" class="delivery2_btn">배송 완료</button>

											<script>
												$(".delivery1_btn").click(
														function() {
															$(".delivery").val(
																	"배송 중");
															run();
														});

												$(".delivery2_btn").click(
														function() {
															$(".delivery").val(
																	"배송 완료");
															run();
														});

												function run() {
													$(".deliveryForm").submit();
												}
											</script>
										</form>
									</div>

								</c:if>
				  </c:forEach> 
				 </div>
				 </li>
				
				</ul>
				
				<ul class="orderView">
				 <c:forEach items="${orderView}" var="orderView">     
				 <li>
				  <div class="thumb">
				   <img src="${orderView.pdThumbImg}" />
				  </div>
				  <div class="gdsInfo">
				   <p>
				    <span>상품명</span>${orderView.pdName}<br />
				    <span>개당 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.pdPrice}" /> 원<br />
				    <span>구입 수량</span>${orderView.cartStock} 개<br />
				    <span>최종 가격</span><fmt:formatNumber pattern="###,###,###" value="${orderView.pdPrice * orderView.cartStock}" /> 원                  
				   </p>
				  </div>
				 </li>     
				 </c:forEach>
				</ul>
            <div class="paginate">
                <ul class="pagination justify-content-center">
                    <li class="page-item" th:classappend=" ? 'disabled'">
                        <a class="page-link" href="#" th:href="" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>

                    <li class="page-item" th:classappend="">
                        <a class="page-link" href="#" th:href="" th:text="">1</a></li>

                    <li class="page-item" th:classappend="">
                        <a class="page-link" href="#" th:href="">Next</a>
                    </li>
                </ul>
            </div>
         </div>
        </div>
    </section>
    <script src="/resources/js/admin/admin_nav.js"></script>
    <script src="/resources/js/admin/admin_order.js"></script>
</body>
</html>