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
    const width = 800;
    const height = 600;
    const bubble = d3.pack().size([width, height]).padding(5);

    // SVG 요소를 초기화하고 새로운 차트를 그리기 전에 이전 차트를 제거
    const chartContainer = d3.select("#bubbleChart");
    chartContainer.selectAll("svg").remove();

    const svg = chartContainer.append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("class", "bubble");

    const nodes = d3.hierarchy({children: data}).sum(d => d.count);

    const node = svg.selectAll(".node")
        .data(bubble(nodes).leaves())
        .enter()
        .append("g")
        .attr("class", "node")
        .attr("transform", d => `translate(${d.x},${d.y})`);

    node.append("circle")
        .attr("r", d => d.r)
        .attr("fill", d => colorScale(d.data.month));

    node.append("text")
        .attr("dy", ".3em")
        .style("text-anchor", "middle")
        .text(d => d.data.keyword);
}

function colorScale(month) {
    // 월별 색상 지정
    const colors = {
        "10": "#ff9999",
        "11": "#66b3ff",
        "12": "#66b3ff",
        // ... 다른 월에 대한 색상
    };
    return colors[month] || "#ffffff";
}

// 초기 데이터 로드
fetchChartData(document.getElementById('monthSlider').value);
