<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

    <%
    
    String id =(String)session.getAttribute("fId");
/* 초기버전 랜덤뽑기
ArrayList<Integer> couponNumber = new ArrayList<Integer>();

// 1~30 까지 번호생성해서 변수 couponNumber에 담음
for (int i = 1; i <= 30; i++) {
	couponNumber.add(i);
}
// couponNumber 순서 섞기
Collections.shuffle(couponNumber);

// 순서가 섞여있는 couponNumber를 9개 추출해서 coupon배열에 담기
int[] coupon9 = new int[9];
int[] coupon3 = new int[3];

for (int i = 0; i < 9; i++) {
	// System.out.println((i+1) + ": " + couponNumber.get(i));
	coupon9[i] = couponNumber.get(i);
	System.out.println(coupon9[i]);
	if (coupon9[i] == 1) {
		coupon3[0] = i + 1; 
	} else if (coupon9[i] == 11) {
		coupon3[1] = i + 1; 
	} else if (coupon9[i] == 21) {
		coupon3[2] = i + 1; 
	} else {
	}
}
// System.out.println(coupon[0]+ "@@@");

 System.out.println(coupon3[0]);
 System.out.println(coupon3[1]);
 System.out.println(coupon3[2]);

 
 
String result = "할인쿠폰이 당첨되지 않았습니다." ;
if( coupon3[0] >= 1 && coupon3[1] >= 1 && coupon3[2] >= 1) {
	result = "당첨되었습니다.";
	System.out.println(result);
	System.out.println("==============");
} else {
	System.out.println(result);
	System.out.println("==============");
}
*/

/* ----실패한 코드------
int a = Arrays.binarySearch(coupon3, 1);
int b = Arrays.binarySearch(coupon3, 11);
int c = Arrays.binarySearch(coupon3, 21);
System.out.println(a + "@@@@");
System.out.println(b + "@@@@");
System.out.println(c + "@@@@");
*/


// ----완료된 코드------
ArrayList<Integer> couponNumber = new ArrayList<Integer>();
ArrayList<Integer> couponNumber2 = new ArrayList<Integer>();
// 1~20 까지 번호생성해서 변수 couponNumber에 담음
for (int i = 1; i <= 20; i++) {
	couponNumber.add(i);
	couponNumber2.add(i);
}
// couponNumber 순서 섞기
Collections.shuffle(couponNumber);
Collections.shuffle(couponNumber2);

// 순서가 섞여있는 couponNumber를 9개 추출해서 coupon배열에 담기
int[] coupon9 = new int[9];
int[] coupon3 = new int[3];
int[] correct = new int[3];
for (int i = 0; i < 3; i++) {
	coupon3[i] = couponNumber2.get(i);
	System.out.print("**" + coupon3[i] + ", ");
}

for (int i = 0; i < 9; i++) {
	// System.out.println((i+1) + ": " + couponNumber.get(i));
	coupon9[i] = couponNumber.get(i);
	System.out.print("@@" + coupon9[i] + ", ");
	if (coupon9[i] == coupon3[0]) {
		correct[0] = i + 1; 
	} else if (coupon9[i] == coupon3[1]) {
		correct[1] = i + 1; 
	} else if (coupon9[i] == coupon3[2]) {
		correct[2] = i + 1; 
	} else {
	}
}

 System.out.println(correct[0]);
 System.out.println(correct[1]);
 System.out.println(correct[2]);

int coupon = 0;
String result = "할인쿠폰이 당첨되지 않았습니다." ;
if( correct[0] >= 1 && correct[1] >= 1 && correct[2] >= 1) {
	result = "당첨되었습니다.";
	System.out.println(result);
	System.out.println("==============");
	coupon = 1;
	
} else {
	System.out.println(result);
	System.out.println("==============");
}


%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/coupon.css">
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">

<%--
// 버튼 클릭이벤트(숫자 확인)	
$(document).ready(function() {
	$('#coupon').click(function() {
// 랜덤생성된 9개의 숫자를 화면(coupon9 tag)에 표시, 당첨여부확인 후 버튼 숨김		
		var coupon = [<%= coupon9[0] %>,<%= coupon9[1] %>, <%= coupon9[2] %>, 
			<%= coupon9[3] %>, <%= coupon9[4] %>, <%= coupon9[5] %>, <%= coupon9[6] %>,
			<%= coupon9[7] %>, <%= coupon9[8] %>]
			$('#coupon').hide();
	$('#coupon9').html(coupon.toString())
// 랜덤생성된 3개의 숫자를 화면(coupon3 tag)에 표시	
		var coupon1 = [<%= coupon3[0] %>,<%= coupon3[1] %>, <%= coupon3[2] %>]
	$('#coupon3').html(coupon1.toString())
// 일치여부를 화면(couponW tag)에 표시		
		var correct = "<%=result %>"
			$('#couponW').html(correct)	
	})
})
--%>

$(document).ready(function() {
	$('#coupon').click(function() {
		// 랜덤생성된 9개의 숫자를 화면(coupon9 tag)에 표시, 당첨여부확인 후 버튼 숨김		
		var coupon = [<%= coupon9[0] %>,<%= coupon9[1] %>, <%= coupon9[2] %>, 
			<%= coupon9[3] %>, <%= coupon9[4] %>, <%= coupon9[5] %>, <%= coupon9[6] %>,
			<%= coupon9[7] %>, <%= coupon9[8] %>]
			$('#coupon').hide();
	$('#coupon9').html(coupon.toString())
// 랜덤생성된 3개의 숫자를 화면(coupon3 tag)에 표시	
		var coupon1 = [<%= coupon3[0] %>,<%= coupon3[1] %>, <%= coupon3[2] %>]
	$('#coupon3').html(coupon1.toString())
// 일치여부를 화면(couponW tag)에 표시		
		var correct = "<%=result %>"
			$('#couponW').html(correct)	
		
	$.ajax({
		url : "coupon.do",
			data : {
					id : '<%= id %>',
					coupon : '1'
				},
				success : function(result) {
				
				}, // success
				error : function() {
					//alert('실패!')
				}// error
			}) // ajax
		}) // b3 end
	}) // $ end



// 태그가 들어간 toString 
</script>
</head>
<body>
<h1>9개의 숫자중에 3개가 일치할 시 할인쿠폰 지급</h1>
<hr>
<h3>임의의 9개 숫자</h3>
<span id="coupon9"> </span><br>
<hr>
<h3>선택된 3개의 숫자</h3>
<span id="coupon3" ></span><br>
<hr>
<br>
<span id="couponW" > </span><br>
<br>
<br>
<button id= "coupon" >클릭하시오</button>
</body>
</html>