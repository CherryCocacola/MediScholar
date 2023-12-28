function updateChartIndex() {
    const selectedIndex = document.getElementById('indexSelect').value;

    fetch(`/journal/chart`, {
        headers: {
            'X-Requested-With': 'XMLHttpRequest'  // ajax 요청
        }
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('chartSearch').innerHTML = data;
    })
    .catch(error => console.error('Error:', error));
}

function selectIndex() {
	document.getElementById('indexSelect').value = data;
	updateChartIndex();
}