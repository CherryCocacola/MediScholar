//d3.js 라이브러리 사용
//처음 페이지 접속 시 해당 달에 맞는 데이터로 버블 만들어서 보여줘야 함
//월별 데이터 조회 시 그에 맞는 버블 형성해야 함

function createBubbleChart() {
    const width = 928;
    const height = width;
    const margin = 1;
    const format = d3.format(",d");
    const color = d3.scaleOrdinal(d3.schemeTableau10);
    const pack = d3.pack()
        .size([width - margin * 2, height - margin * 2])
        .padding(3);

    const root = pack(d3.hierarchy({children: data})
        //.sum(d => d.value));
        .sum(d => 200));

    const svg = d3.select("#chart").append("svg")
        .attr("width", width)
        .attr("height", height)
        .attr("viewBox", [-margin, -margin, width, height])
        .attr("style", "max-width: 100%; height: auto; font: 10px sans-serif;")
        .attr("text-anchor", "middle");

    const node = svg.append("g")
        .selectAll("g")
        .data(root.leaves())
        .join("g")
            .attr("transform", d => `translate(${d.x},${d.y})`);

    node.append("title")
        .text(d => `${d.data.id}\n${format(d.value)}`);

    node.append("circle")
        .attr("fill-opacity", 0.7)
        .attr("fill", d => color(d.data.id))
        //.attr("r", d => d.r);
        .attr("r", d => 80);

    const text = node.append("text")
        .attr("clip-path", d => `circle(${d.r})`);

    text.selectAll("tspan")
        .data(d => [d.data.id])
        .join("tspan")
            .attr("x", 0)
            .attr("y", "0.7em")
            .text(d => d);

    return svg.node();
}

const data = {
  children: [
    { id: "bubble1", value: 500 },
    { id: "bubble2", value: 300 },
    { id: "bubble3", value: 200 },
    // 추가 버블...
  ]
};

createBubbleChart(data);

