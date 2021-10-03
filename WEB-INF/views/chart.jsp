<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript" src="resources/js/jquery-3.6.0.js"></script>
<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var arr = [];
		var payment2
		var reservation2
		var airLine2
		var feedback2
		$.ajax({
			url : "chartReading",
			async : false,
			success : function(chartList) {
				//alert(chartList)
				var arr = chartList
				//alert(arr)
				var payment2 = arr[0];
				var reservation2 = arr[1];
				var airLine2 = arr[2];
				var feedback2 = arr[3];
				//alert(payment2)
				payment = parseInt(payment2);
				reservation = parseInt(reservation2);
				airLine = parseInt(airLine2);
				feedback = parseInt(feedback2);
			},
			error : function() {
				alert('통신이 안됐던거임~')
			}
		})
		var options = {
			title : '1:1문의 비율'
		};
		var chart = new google.visualization.PieChart(document
				.getElementById('piechart'));

		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ], [ 'Payment', payment ],
				[ 'Reservation', reservation ], [ 'AirLine', airLine ],
				[ 'Feedback', feedback ], ]);
		chart.draw(data, options);
	}
</script>
</head>
<body>
	<div id="piechart" style="width: 700px; height: 700px;"></div>
</body>
</html>
