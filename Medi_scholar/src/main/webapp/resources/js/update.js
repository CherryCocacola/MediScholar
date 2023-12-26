    function CommunityUpdate() {
        // 에디터 내용을 content에 담는다
        var content = tinymce.get('textarea').getContent();
        // 글 제목을 가져온다
        var title = $("input[name='title']").val();

        // 담은 내용을 hidden 처리된 textarea에 넣고
        $("textarea#hiddenTextarea").val(content);
        // 제목을 form에 추가
        $("input[name='title']").val(title);

        // fetch를 사용하여 서버로 데이터를 전송
        fetch('updatecomm', {
            method: 'POST',
            body: new FormData(document.getElementById('CommunityUpdateForm')),
        })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.json(); // 또는 response.text(), response.blob() 등으로 사용 가능
        })
        .then(data => {
            // 성공적으로 서버에서 응답을 받았을 때 수행할 동작
            console.log(data); // 응답을 콘솔에 출력 (optional)
        })
        .catch(error => {
            // 서버와 통신 중 에러가 발생했을 때 수행할 동작
            console.error('There was a problem with the fetch operation:', error);
        });
    }
