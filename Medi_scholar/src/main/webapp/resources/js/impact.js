function updateJournalData() {
    const selectedYear = document.getElementById('yearSelect').value;
    const journalId = new URLSearchParams(window.location.search).get('id');

    fetch(`/journal/journaldetail?id=${journalId}&year=${selectedYear}`, {
        headers: {
            'X-Requested-With': 'XMLHttpRequest'  // ajax 요청
        }
    })
    .then(response => response.text())
    .then(data => {
        document.getElementById('impactTable').innerHTML = data;
    })
    .catch(error => console.error('Error:', error));
}

function selectYear(year) {
    // select 값 설정
	document.getElementById('yearSelect').value = year;
	updateJournalData();
}