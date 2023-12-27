<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

   		<!-- 헤더 -->
    	<jsp:include page="../common/header.jsp" />
    	
        <section class="content">

            <div class="tit-con clear">
                <h2 class="f-l col-navy">Journal List</h2>
                <div class="f-r ma-t-5">
                    <a href="/">Home</a> > Journal List
                </div>
            </div>

			<div class="con-search clear">
				<form action="" method="get">
					<div class="con-search-form">
						<div class="clear">
							<select class="dominimal f-l" name="field">
								<option ${param.field eq "title" ? "selected" : ""} value="title">Select Journal</option>
								<option ${param.field eq "issn" ? "selected" : ""} value="issn">Select ISSN</option>
							</select> <label for="SearchInput"></label>
							<input type="text" id="SearchInput" name="sjournal" />
						</div>
					</div>
					<input type="submit" name="" value="Search" class="btn-con-search" />
				</form>
			</div>

			
            <div class="con-tbl">
	            <div class="f-l">
				Total : <strong>${count}</strong>
				</div>
                <div class="tbl-scr">
                    <table>
                    <thead>
                        <tr>
                            <th rowspan="2">No</th>
                            <th rowspan="2" colspan="2">ISSN / EISSN</th>
                            <th rowspan="2">Journal</th>
                            <th colspan="3">JSR</th>
                            <th rowspan="2" colspan="2">Journal Impact Index</th>
                            <th rowspan="2">Article</th>
                        </tr>
                        <tr>
                            <th>SCIE</th>
                            <th>SSCI</th>
                            <th>ESCI</th>
                        </tr>
                    </thead>
                     <tbody>
		                <c:forEach var="journal" items="${journal}">
		                    <tr>
		                        <td>${journal.jnlno}</td>
		                        <td>${journal.issn}</td>
		                        <td>${journal.eissn}</td>
		                        <td class="a-l"><a href="journaldetail?id=${journal.jnlid}">${journal.jnlnm}</a></td>
	                            <td>${journal.scie}</td>
	                            <td>${journal.ssci}</td>
	                            <td>${journal.esci}</td>
	                            <td>${journal.jcr}</td>
	                            <td>${journal.jci}</td>
	                            <td><a href="#">3,001</a></td>
		                    </tr>
		                </c:forEach>
		            </tbody>
                    </table>
                </div>

				<%-- 페이징 --%>
				<%-- 페이징에 필요한 변수 --%>
				<c:set var="pageVal" value="${empty param.page?1:param.page}"></c:set>
				<!--  param.page가 빈값이면 ?가 값이 있으면 page값  -->
				<c:set var="startNum" value="${pageVal-(pageVal-1)%5}"></c:set>
				<c:set var="lastNum"
					value="${fn:substringBefore(Math.ceil(count/10),'.')}"></c:set>

				<%-- 화살표 뒤로 --%>
				<div class="paging ma-t-20">
					<ul class="pagination">
							<li>
								<c:choose>
									<c:when test="${startNum > 1}">
										<a href="/journal/journallist?page=${startNum-1}&field=${param.field}&sjournal=${param.sjournal}"
											class="arrow"> </a>
									</c:when>
									<c:otherwise>
										<a href="javascript:;" onclick="alert('첫 페이지입니다.')"
											class="arrow"></a>
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
											<a href="/journal/journallist?page=${startNum+i}&field=${param.field}&sjournal=${param.sjournal}">${startNum+i}</a>
										</c:otherwise>
									</c:choose></li>
							</c:forEach>

							<%-- 화살표 앞으로 --%>
							<li>
							<c:choose>
								<c:when test="${startNum + 5 <= lastNum}">
									<a href="/journal/journallist?page=${startNum +5}&field=${param.field}&sjournal=${param.sjournal}" class="arrow"> </a>
								</c:when>
								<c:otherwise>
									<a href="javascript:;" onclick="alert('마지막 페이지입니다.')" class="arrow"></a>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
			</div>
        </section>
        
    	<jsp:include page="../common/footer.jsp" />