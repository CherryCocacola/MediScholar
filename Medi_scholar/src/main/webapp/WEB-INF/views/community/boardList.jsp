<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 헤더 -->
<jsp:include page="../common/header.jsp" />

<section class="content">
	<div class="tit-con clear">
		<h2 class="f-l col-navy">Community</h2>
		<div class="f-r ma-t-5">
			<a href="/">Home</a> > Community
		</div>
	</div>

	<div class="list-search clear ma-t-15">
		<form action="/community/list" method="get">
			<div class="f-r">
				<div class="clear">
					<select class="dominimal f-l" name="field">
						<option ${(param.field=="title")?"selected" : ""} value="title">Title</option>
						<option ${(param.field=="user")?"selected" : ""} value="user">Writer</option>
					</select>
					<label for="SearchInput"></label>
					<input type="text" id="SearchInput" name="scomm" />
					<input type="button" value="Search" class="btn-con-search" />
				</div>
			</div>
		</form>

	<div class="f-l">Total : <strong>${totalCount}</strong> posts</div>
	</div>	
	<div class="con-list ma-t-5">
		<ul>
			<li>
				<c:forEach var="cl" items="${cl}">
					<div class="clear">
						<div class="list-tit nowrap">
							<a href="/community/detailcomm?comm_postid=${cl.comm_postid}">[${cl.comm_postid}] ${cl.title} / ${cl.jnlnm}</a>
						</div>
						<div class="list-writer">Written by ${cl.user_nm}</div>
						<div class="list-etc">
							<span>Comment : <strong>${cl.replyCount}</strong></span>
							<span class="sep">|</span>
							<span>Like : <strong>104</strong></span>
							<span class="sep">|</span>
							<span>Hit : <strong>50</strong></span>
							<span class="sep">|</span>
							<span>Date : <strong><fmt:formatDate value="${cl.regdate}" pattern="yyyy-MM-dd HH:mm" /></strong></span>
						</div>
					</div>
				</c:forEach>
			</li>
		</ul>
	</div>
	
	
	 <div class="ma-t-10 clear">
       <button class="btn btn-1 f-r" onclick="location.href='/community/writecomm'">Write</button>
     </div>

	<%-- 페이징 --%>
	<%-- 페이징에 필요한 변수 --%>
	<c:set var="pageVal" value="${empty param.page?1:param.page}"></c:set>
	<!--  param.page가 빈값이면 ?가 값이 있으면 page값  -->
	<c:set var="startNum" value="${pageVal-(pageVal-1)%5}"></c:set>
	<c:set var="lastNum" value="${fn:substringBefore(Math.ceil(totalCount/10),'.')}"></c:set>

	<%-- 화살표 뒤로 --%>
			<div class="paging ma-t-20">
				<ul class="pagination">
						<li>
							<c:choose>
								<c:when test="${startNum > 1}">
									<a href="/community/list?page=${startNum-1}&field=${param.field}&scomm=${param.scomm}" class="arrow"></a>
								</c:when>
								<c:otherwise>
									<a href="javascript:;" onclick="alert('첫 페이지입니다.')" class="arrow"></a>
								</c:otherwise>
							</c:choose>
						</li>

							<%-- 숫자 페이지 이동 --%>
						<c:forEach var="i" begin="0" end="4">
							<li><c:choose>
									<c:when test="${param.page==(startNum+i)}">
										<a href="#" class="active">${startNum+i}</a>
									</c:when>
									<c:otherwise>
										<a href="/community/list?page=${startNum+i}&field=${param.field}&scomm=${param.scomm}">${startNum+i}</a>
									</c:otherwise>
								</c:choose></li>
						</c:forEach>

						<%-- 화살표 앞으로 --%>
						<li>
							<c:choose>
							<c:when test="${startNum + 5 <= lastNum}">
								<a href="/community/list?page=${startNum +5}&field=${param.field}&scomm=${param.scomm}" class="arrow"></a>
							</c:when>
							<c:otherwise>
								<a href="javascript:;" onclick="alert('마지막 페이지입니다.')" class="arrow"></a>
							</c:otherwise>
						</c:choose>
					</li>
				</ul>
			</div>
	</section>

	<jsp:include page="../common/footer.jsp" />

