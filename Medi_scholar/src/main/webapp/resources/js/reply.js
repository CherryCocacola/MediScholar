function submitReply(comm_postid) {
    const replyContent = document.getElementById('replyContent').value;
    //const comm_postid = document.querySelector('.postidhidden').value;

    fetch('/community/reply', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json', // 변경된 헤더
        },
        body: JSON.stringify({
			comm_postid : comm_postid,
			replyContent : replyContent
		})
    })
        .then(response => response.json())
        .then(data => {
            console.log('Success:', data);
            refresh();
        })
        .catch((error) => {
            console.error('Error:', error);
        });
}

//댓글삭제
function deleteReply(comm_reno) {
	fetch(`/community/delreply?comm_reno=${comm_reno}`, {
		method: 'DELETE',
		headers: {
			'Content-Type': 'application/json',
		}
	})
		.then(response => response.json())
		.then(data => {
			console.log('Delete Success:', data);
			refresh();
		})
		.catch((error) => {
			console.error('Delete Error:', error);
		});
}

function submitSubreply(postid, reno) {
    const subreplyContent = document.querySelector(`#replyInput-${reno} textarea[name='subreplyContent']`).value;

    fetch('/community/subreply', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify({
            comm_postid: postid,
            subreplyContent: subreplyContent,
            reno: reno
        })
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Network response was not ok: ' + response.statusText);
        }
        return response.json();
    })
    .then(data => {
        console.log('Sub Reply Success:', data);
        refresh();
    })
    .catch(error => {
        console.error('Sub Reply Error:', error);
    });
}


function toggleReplyInput(reno) {
    var replyInput = document.getElementById('replyInput-' + reno);
    if(replyInput.style.display === 'none') {
        replyInput.style.display = 'table-row';
    } else {
        replyInput.style.display = 'none';
    }
}


function refresh() {
    fetch(window.location.href, { method: 'GET' })
        .then(response => response.text())
        .then(html => {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, 'text/html');
            const newContent = doc.getElementById('replydiv').innerHTML;
            document.getElementById('replydiv').innerHTML = newContent;
        })
        .catch(error => console.error('Error refreshing:', error));
}