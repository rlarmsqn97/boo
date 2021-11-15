<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<head>
 	<meta charset="utf-8">
    <title>예약하기</title>
    <meta name="viewport" content="width=device-width">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
  
     <link rel="stylesheet" href="/resources/css/cart.css">
         <%@ include file="../include/mainmenu.jsp" %>
         	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
     </head>
     
<body>
   

    <!-- Start Banner Hero -->
    <div id="work_banner" class="banner-wrapper bg-light w-100 py-5"style="height:500px">
        <div class="banner-vertical-center-work container text-light d-flex justify-content-center align-items-center py-5 p-0">
            <div class="banner-content col-lg-8 col-12 m-lg-auto text-center">
                <h1 class="banner-heading h2 display-3 pb-5 semi-bold-600 typo-space-line-center">예약하기</h1>
                <h3 class="h4 pb-2 regular-400">Elit, sed do eiusmod tempor incididunt</h3>
                <p class="banner-body pb-2 light-300">
                    Vector illustration <a class="text-white" href="http://freepik.com/" target="_blank">Freepik</a>.
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit,
                    sed do eiusmod tempor incididunt ut labore et dolore magna
                    aliqua. Quis ipsum suspendisse ultrices gravida. Risus
                    commodo viverra maecenas accumsan lacus.
                </p>
                <button type="submit" class="btn rounded-pill btn-outline-light px-4 me-4 light-300">Learn More</button>
                <button type="submit" class="btn rounded-pill btn-secondary text-light px-4 light-300">Contact Us</button>
            </div>
        </div>
    </div>
    <!-- End Banner Hero -->

    <!-- Start Our Work -->
     <section>
        <div class="section_caption">
            ORDER
        </div>
        <div class="section_content">
            <form action="#" th:action="@{/main/payment_ok}" method="post" onsubmit="return sendit()">

                <div class="benefit_info">
                    <div class="benefit_info_caption">
                        혜택정보
                    </div>
                    <div class="benefit_info_desc">
                        <div class="benefit_info_desc_item"><b th:text="">홍길동</b> 님은 <b sec:authorize="hasRole('ROLE_ADMIN')">[관리자]</b><b sec:authorize="hasRole('ROLE_MEMBER')">[일반회원]</b> 이십니다</div>
                        <div class="benefit_info_mileage benefit_info_desc_item">
                            가용적립금: <b th:text="">2,000</b>원
                            <input type="hidden" class="canuse" value="2000" th:value=""> <!--서버로부터 넘어온 데이터-->
                        </div>
                    </div>
                </div>
                
                <div class="about_order">
                    <i class="fas fa-exclamation"></i> 상품의 옵션 및 수량 변경은 상품상세 또는 장바구니에서 가능합니다.
                </div>
                
                <div class="orderlist">
                    <div class="orderlist_caption">국내배송상품 주문내역</div>
                    <div class="orderlist_content">
                        <table> <!-- 타임리프로 값 넣어주기-->
                            <colgroup>
                                <col width="27px">
                                <col width="92px">
                                <col width="auto">
                                <col width="98px">
                                <col width="75px">
                                <col width="98px">
                                <col width="98px">
                                <col width="85px">
                                <col width="98px">
                            </colgroup>
                            <thead>
                                <tr>
                                    <td><input type="checkbox" class="check_all"></td>
                                    <td>이미지</td>
                                    <td>상품정보</td>
                                    <td>판매가</td>
                                    <td>수량</td>
                                    <td>적립금</td>
                                    <td>배송구분</td>
                                    <td>배송비</td>
                                    <td>합계</td>
                                </tr>
                            </thead>
                            <tbody> 
                                <tr th:each=>
                                    <td><input type="checkbox" class="check"></td>
                                    <td><img src="img/basket/basket1.JPG" th:src=""></td>
                                    <td>
                                        <div th:text=""></div>
                                        <div th:text="'[옵션:'++']'">[옵션: 그레이]</div>
                                    </td>
                                    <td><b th:text=""></b></td>
                                    <td th:text="">
                                        7
                                    </td>
                                    <td><span class="order_mileage">390</span>원</td> <!--js 계산. 한 아이템에 대한 총 예상 적립 마일리지-->
                                    <td>기본배송</td>
                                    <td>배송비</td>
                                    <td>
                                        ₩<span class="order_price"></span> <!--js 계산. 한 아이템에 대한 총 가격-->
                                    </td>
                                  
                                </tr>
                                
                            </tbody>
                        </table>
                        <div class="bottombtn_box">
                            선택상품을 &nbsp;
                            <button type="button" class="deletebtn bottombtn"><i class="fas fa-times"></i> &nbsp;삭제하기</button>                
                        </div>
                    </div>
                </div>
                <div id="orderform">
                    <!-- 전송 데이터 모음-->
                    <input type='hidden' name="total_price">
                    <input type='hidden' name="tobepaid_price">
                    <input type='hidden' name="orderiteminfo"> <!-- value에 상품idx, color, quantity가 Json형식으로 들어감-->
                    <!-- 전송 데이터 모음-->
                                 
                    <div class="delivery_info_caption">
                        <div class="delivery_info_caption_left">배송 정보</div>
                        <div class="delivery_info_caption_right"><span>＊</span> 필수입력사항</div>
                    </div>
                    <table class="delivery_info_table">
                        <colgroup>
                            <col width="120px"/>
                            <col width="auto"/>
                        </colgroup>
                        <tr>
                            <th>배송지 선택</th>
                            
                        </tr>
                        <tr>
                            <th><label for="address_recipient">받으시는 분<span>＊</span></label></th>
                            <td><input type="text" name="address_recipient" id="address_recipient"></td>
                        </tr>
                        <tr>
                            <!-- vertical align을 맞추기위해 th와 td를 같은 class로 지정-->
                            <th class="adjust_height"><label for="sample6_postcode">주소<span>＊</span></label></th>
                            <td class="adjust_height">
                                <input type="text" id="sample6_postcode" name="zipcode" placeholder="우편번호">
                                <button type="button" onclick="sample6_execDaumPostcode()" id="postbtn"><span>우편번호</span><i class="fas fa-chevron-right"></i></button><br>
                                <input type="text" id="sample6_address" name="city" placeholder="주소" class="address_margin"> 기본주소<br>
                                <input type="text" id="sample6_detailAddress" name="street" placeholder="상세주소" class="address_margin"> 나머지주소
                            </td>
                        </tr>
                        <tr>
                            <th><label for="address_home_number">일반전화<span>＊</span></label></th>
                            <td>
                                <select name="addressHomePhoneNumber[]" id="address_home_number" class="address_home_number">
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>
                                    <option value="033">033</option>
                                    <option value="041">041</option>
                                    <option value="042">042</option>
                                    <option value="043">043</option>
                                    <option value="044">044</option>
                                    <option value="051">051</option>
                                    <option value="052">052</option>
                                    <option value="053">053</option>
                                    <option value="054">054</option>
                                    <option value="055">055</option>
                                </select>
                                -
                                <input type="text" name="addressHomePhoneNumber[]" class="address_home_number">
                                -
                                <input type="text" name="addressHomePhoneNumber[]" class="address_home_number">
                            </td>
                        </tr>
                        <tr>
                            <th><label for="address_phone_number">휴대전화<span>＊</span></label></th>
                            <td>
                                <select name="addressPhoneNumber[]" id="address_phone_number" class="address_phone_number">
                                    <option value="010">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                </select>
                                -
                                <input type="text" name="addressPhoneNumber[]" class="address_phone_number">
                                -
                                <input type="text" name="addressPhoneNumber[]" class="address_phone_number">
                            </td>
                        </tr>
                    </table>
                    
                    <div class="payment_caption">
                        결제 예정 금액
                    </div>
                    <table class="payment_table">
                        <tr>
                            <th>총 주문 금액</th>
                            <th>총 할인 금액</th>
                            <th>결제 예정 금액</th>
                        </tr>
                        <tr>
                            <td>₩<span id="total"></span></td>
                            <td>- ₩<span id="discounted">0</span></td>
                            <td>= ₩<span id="tobepaid"></span></td>
                        </tr>
                    </table>
                   
                    <div class="payment_submit">
                        <input type="submit" value="결제하기">
                    </div>
                </div>
            </form>           
        </div>
    </section>
   <!-- Start Footer -->
 	<footer class="bg-secondary pt-4" style="bottom: 0; width: 100%">
        <div class="container">
            <div class="row py-4">

              
                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300">회사소개</h2>
                                
                </div>

                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300">개인정보취급방침</h2>
                    
                </div>

                <div class="col-lg-3 col-md-4 my-sm-0 mt-4">
                    <h2 class="h4 pb-lg-3 text-light light-300">이용약관</h2>
                   
                </div>
  
            </div>
        </div>

    </footer>
    <!-- End Footer -->
   


    <!-- Bootstrap -->
    <script src="/resources/js/bootstrap.bundle.min.js"></script>
    <!-- Lightbox -->
    <script src="/resources/js/fslightbox.js"></script>
    <script>
        fsLightboxInstances['gallery'].props.loadOnlyCurrentSource = true;
    </script>
    <!-- Load jQuery require for isotope -->
    <script src="/resources/js/jquery.min.js"></script>
    <!-- Isotope -->
    <script src="/resources/js/isotope.pkgd.js"></script>
    <!-- Page Script -->
 <!--    <script>
        $(window).load(function() {
            // init Isotope
            var $projects = $('.projects').isotope({
                itemSelector: '.project',
                layoutMode: 'fitRows'
            });
            $(".filter-btn").click(function() {
                var data_filter = $(this).attr("data-filter");
                $projects.isotope({
                    filter: data_filter
                });
                $(".filter-btn").removeClass("active");
                $(".filter-btn").removeClass("shadow");
                $(this).addClass("active");
                $(this).addClass("shadow");
                return false;
            });
        });
    </script> -->
    
    <script>
	$("#allCheck").click(function(){
	 var chk = $("#allCheck").prop("checked");
	 if(chk) {
	  $(".chBox").prop("checked", true);
	  Sum();
	 } else {
	  $(".chBox").prop("checked", false);
	  Sum();
	 }
	});
	</script>
	<script>
	 $(".chBox").click(function(){
	  $("#allCheck").prop("checked", false);
	 });
	 
	</script>
	
	<script>
	 $(".selectDelete_btn").click(function(){
	  var confirm_val = confirm("정말 삭제하시겠습니까?");
	  
	  if(confirm_val) {
	   var checkArr = new Array();
	   
	   $("input[class='chBox']:checked").each(function(){
	    checkArr.push($(this).attr("data-cartNum"));
	   });
	    
	   $.ajax({
	    url : "/shop/deleteCart",
	    type : "post",
	    data : { chbox : checkArr },
	    success : function(result){
	     if(result == 1) {
	     location.href = "/shop/cart";
	     } else {
	    	 alert("삭제 실패");
	     }
	    }
	   });
	  } 
	 });
	</script>
	
	 <!-- 금액 총 합계  -->
        <script>
            function Sum() {
                var str = "";
                var sum = 0;
                var count = $(".chBox").length;
                for (var i = 0; i < count; i++) {
                    if ($(".chBox")[i].checked == true) {
                        sum += parseInt($(".chBox")[i].value);
                    }
                }
                $("#total_sum").html(sum + " 원");
                $("#amount").val(sum);
            }
        </script>
 
    <!-- Templatemo -->
    <script src="/resources/js/templatemo.js"></script>
    <!-- Custom -->
    <script src="/resources/js/custom.js"></script>
    <script src="/resources/js/cart.js"></script>  
</body>
</html>