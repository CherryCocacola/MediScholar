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
                            <select class="dominimal f-l">
                                <option value="">Select Journal</option>
                            </select>
                            <label for="SearchInput"></label>
                            <input type="text" id="SearchInput" name="sjournal" />
                        </div>
                        <div class="clear ma-t-5">
                            <span class="sp1">By Period</span>
                            <input type="radio" class="btn-check check-1" name="speriod" id="Search1Year" autocomplete="off" checked>
                            <label for="Search1Year">1 Year</label>
    
                            <input type="radio" class="btn-check" name="speriod" id="Search6Month" autocomplete="off">
                            <label for="Search6Month">6 Month</label>
    
                            <input type="radio" class="btn-check" name="speriod" id="Search3Month" autocomplete="off">
                            <label for="Search3Month">3 Month</label>
    
                            <input type="radio" class="btn-check" name="speriod" id="Search1Month" autocomplete="off">
                            <label for="Search1Month">1 Month</label>
    
                            <input type="radio" class="btn-check perd" name="speriod" id="SearchPeriod" autocomplete="off">
                            <label for="SearchPeriod">Period</label>

                            <!-- Period 선택시 disabled 사라지고 활성화 -->
                            <input type="date" name="" class="dateInput" disabled />
                            <span class="sp2">~</span>
                            <input type="date" name="" class="dateInput" disabled />
                        </div>
                    </div>
                    <input type="submit" value="Search" class="btn-con-search" />
                </form>
            </div>

            <div class="con-tbl">
                <div class="tbl-scr">
                    <table>
                    <thead>
                        <tr>
                            <th rowspan="2">No</th>
                            <th rowspan="2">ISSN / <br> EISSN</th>
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
		                <c:forEach var="jl" items="${jl}">
		                    <tr>
		                        <td>${jl.jnlno}</td>
		                        <td>${jl.issn} / <br> ${jl.eissn}</td>
		                        <td class="a-l"><a href="JournalDetail?id=">${jl.jnlnm}</a></td>
	                            <td>${jl.scie}</td>
	                            <td>${jl.ssci}</td>
	                            <td>${jl.esci}</td>
	                            <td>${jl.jcr}</td>
	                            <td>${jl.jci}</td>
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
										<a href="/pubmed/journal?page=${startNum-1}&field=${param.field}&sjournal=${param.sjournal}"
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
											<a
												href="/pubmed/journal?page=${startNum+i}&field=${param.field}&sjournal=${param.sjournal}">${startNum+i}</a>
										</c:otherwise>
									</c:choose></li>
							</c:forEach>

							<%-- 화살표 앞으로 --%>
							<li>
								<c:choose>
									<c:when test="${startNum + 5 <= lastNum}">
										<a href="/pubmed/journal?page=${startNum +5}&field=${param.field}&sjournal=${param.sjournal}"
											class="arrow"> </a>
									</c:when>
									<c:otherwise>
										<a href="javascript:;" onclick="alert('마지막 페이지입니다.')"
											class="arrow"></a>
									</c:otherwise>
								</c:choose>
							</li>
					</ul>
				</div>
			</div>
        </section>
        
    	<jsp:include page="../common/footer.jsp" />