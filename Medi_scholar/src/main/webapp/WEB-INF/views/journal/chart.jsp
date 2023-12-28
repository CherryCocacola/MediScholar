<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/range.css" />
 	
    <title>버블 차트 테스트</title>
    <!-- d3.js 라이브러리 -->
    <script src="https://d3js.org/d3.v6.min.js"></script>
</head>
<body>
    <div id="bubbleChart"></div>
    <label for="monthSlider">Month :</label>
    <input id="monthSlider" class="rs-range" type="range" min="1" max="12" value="1" onchange="fetchChartData(this.value)" >
	<span id="selectedMonth" class="rs-label" >1</span>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
</body>
</html>
