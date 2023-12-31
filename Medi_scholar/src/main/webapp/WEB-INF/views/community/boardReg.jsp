<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
    src="https://cdn.tiny.cloud/1/h3bmqqrdxte5eq59jam8z9ub9qy1n5medl7940uihpwms3ya/tinymce/5/tinymce.min.js"
    referrerpolicy="origin"></script>
<script type="text/javascript" src=/resources/js/write.js></script>

<!-- 헤더 -->
<jsp:include page="../common/header.jsp" />

<style>
    /* Custom CSS for TinyMCE if needed */
</style>

</head>

<body>

<section class="content">
    <div class="tit-con clear">
        <h2 class="f-l col-navy">Community</h2>
        <div class="f-r ma-t-5">
            <a href="/">Home</a> > Community
        </div>
    </div>

    <!-- TinyMCE Editor -->
    <form id="CommunityForm" method="post" action="writecomm">
		<input type="text" name="title" value="Title here" style="width: 100%;">
         <textarea id="hiddenTextarea" name="CommunityContent" style="display:none;"></textarea>
        <textarea id="textarea">Express your opinion</textarea>
         <input type="button" value="Submit" onclick="CommunityReply()">
    </form>
</section>

<script>
    tinymce.init({
        selector : '#textarea',
        height : 300,
        width: '100%'
    });
</script>
</body>

<jsp:include page="../common/footer.jsp" />

</html>
