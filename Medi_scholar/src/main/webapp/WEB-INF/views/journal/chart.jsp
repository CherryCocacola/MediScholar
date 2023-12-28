<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <meta charset="UTF-8">
    <title>버블 차트 테스트</title>
    <!-- d3.js 라이브러리 -->
    <script src="https://d3js.org/d3.v6.min.js"></script>
	<link rel="stylesheet" type="text/css" href="../resources/css/range.css" />
	<link rel="stylesheet" type="text/css" href="../resources/css/content.css" />
    <!-- 헤더 -->
	<jsp:include page="../common/header.jsp" />


	<section class="content">
		<div class="chart-container">
		    <div id="bubbleChart" class="chart1"></div>
		    
		    <div class="chart2">
		    <div id="chartKeyword" class="keywordFont">
		    	Your keyword :
		   	</div>
		   	
			<div id="chartSearch" >
				<div class="con-list">
					<select id="indexSelect" name="field" onchange="updateChartIndex()" style="display: none;">
						<option value="impact">Impact</option>
						<option value="recent">Recent</option>
					</select>
					<button type="button" onclick="selectIndex()" class="btn-chart">Impact</button>
					<button type="button" onclick="selectIndex()" class="btn-chart">Recent</button>
		    	</div>
		    </div>
		   </div> 
		</div>
		
		 <label for="monthSlider"></label>	<!-- 현재 month가 기본 value값이 되도록 할 것-->
		    <input type="range" class="rs-range" id="monthSlider" min="1" max="12" value="1" onchange="fetchChartData(this.value)">
		    <span id="selectedMonth" class="rs-label">1</span>
		 <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
		
	</section>
</html>

	<jsp:include page="../common/footer.jsp" />