<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   		<!-- 헤더 -->
    	<jsp:include page="../common/header.jsp" />
    	<script type="text/javascript" src=/resources/js/impact.js></script>
    	
        <section class="content">

            <div class="tit-con clear">
                <h2 class="f-l col-navy">Journal</h2>
                <div class="f-r ma-t-5">
                    <a href="/">Home</a> >
                    <a href="/Journal">Journal List</a> > Journal Deatil</a>
                </div>
            </div>

            <div class="con-tbl ma-t-15">
                <div class="tbl-scr">
                    <table class="tbl-1">
                    <tr>
                        <th>Journal</th>
                        <td colspan="3">${detail.jnlnm}</td>
                    </tr>
                    <tr>
                        <th>Journal URL</th>
                        <td><a href="${detail.url}">${detail.url}</a></td>
                    </tr>
                    <tr>
                        <th>Journal Country</th>
                        <td>${detail.country}</td>
                        <th>Journal Language</th>
                        <td>${detail.lan}</td>
                    </tr>
                    <tr>
                        <th>ISSN</th>
                        <td>${detail.issn}</td>
                        <th>EISSN</th>
                        <td>${detail.eissn}</td>
                    </tr>
                    <tr>
                        <th colspan="4">등재정보</th>
                    </tr>
                    </table>
                </div>

			<div id="jnldetaildiv">
			    <div class="con-search clear">
			        <select id="yearSelect" name="field" style="display:none;" onchange="updateJournalData()">
			            <option value="2021">2021</option>
			            <option value="2022">2022</option>
			        </select>
			
			        <button type="button" onclick="selectYear('2021')">2021</button>
			        <button type="button" onclick="selectYear('2022')">2022</button>
			    </div>
			</div>
			<div id="impactTable">
				<div class="tbl-scr">
                    <table class="ma-t-10">
                    <thead>
                        <tr>
                            <th colspan="3">JSR</th>
                            <th rowspan="2">Journal<br />Impact Index</th>
                            <th rowspan="2">Article</th>
                        </tr>
                        <tr>
                            <th>SCIE</th>
                            <th>SSCI</th>
                            <th>ESCI</th>
                        </tr>
                    </thead>
                    <tbody>
						<tr>
							<td>${impact.scie}</td>
							<td>${impact.ssci}</td>
							<td>${impact.esci}</td>
							<td>${impact.jci}/${impact.jcr}</td>
							<td>article count</td>
						</tr>
                    </tbody>
                    </table>
                </div>
			</div>	
                
            </div>
        </section>
        
    	<jsp:include page="../common/footer.jsp" />