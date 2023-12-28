// sort로 데이터를 내림차순 정렬 (기본 오름차순. b-a 시 내림차순)
// 정렬한 키워드 데이터의 색상을 forEach문으로 정한다 
function assignColors(data) {
    const sortedData = data.sort((a, b) => b.count - a.count);
    const colors = ["#E4CFE3",  "#CEDBED",  "#D4ECF0", "#DCFFDC", "#FDCAD6", "#FEDAD9"];
    
    //상위 6개 키워드는 colors에 지정한 색상을 적용
    //그 아래는 회색으로 통일
    sortedData.forEach((item, index) => {
    	if(index<6) {
    		item.color = item.color = colors[index];
    	}else {
    		item.color = "#EBEBEA";
    	}
    });
    return sortedData;
}    

function fetchChartData(selectedMonth) {
    document.getElementById('selectedMonth').textContent = selectedMonth;

    fetch('/journal/data', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({ month: selectedMonth })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok');
        }
        return response.json();
    })
    .then(data => {
        drawBubbleChart(data);
    })
    .catch(error => {
        console.error('Error fetching data: ', error);
    });
}

function drawBubbleChart(data) {
	const sortedData = assignColors(data);

    const width = 500;
    const height = 600;
    const bubble = d3.pack().size([width, height]).padding(5);
    
     //'count' 값의 범위를 결정
    const maxCount = d3.max(data, d => d.count);
    const minCount = d3.min(data, d => d.count);

    // SVG 요소를 초기화하고 새로운 차트를 그리기 전에 이전 차트를 제거
    const chartContainer = d3.select("#bubbleChart");
    chartContainer.selectAll("svg").remove();

    const svg = chartContainer.append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("class", "bubble")

    const nodes = d3.hierarchy({children: data}).sum(d => d.count);
	
    const node = svg.selectAll(".node")
        .data(bubble(nodes).leaves())
        .enter()
        .append("g")
        .attr("class", "node")
        .attr("transform", d => `translate(${d.x},${d.y})`)
        
        //버블 클릭 시 키워드명을 특정 div에 출력
        .on("click", function(event, d) {
        	document.getElementById("chartKeyword").textContent = d.data.keyword;
        });

    node.append("circle")
        .attr("r", d => d.r)
        .attr("fill", d => colorScale(d.data.keyword, sortedData));

	//키워드명 출력
    node.append("text")
        .attr("dy", ".3em")
        .style("text-anchor", "middle")
        .text(d => d.data.keyword);
}

function colorScale(keyword, sortedData) {
	const itemData = sortedData.find(item => item.keyword === keyword);
	//itemData가 true면 color 리턴, false면 흰색 리턴
	//=정렬된 데이터가 키워드와 이름이 같으면 색상 속성을, 그 외에는 흰색을 리턴한다
    return itemData ? itemData.color : '#ffffff';
}

// 초기 데이터 로드
fetchChartData(document.getElementById('monthSlider').value);
