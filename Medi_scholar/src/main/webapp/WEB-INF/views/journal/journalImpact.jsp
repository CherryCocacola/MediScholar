<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 헤더 -->
<script type="text/javascript" src=/resources/js/impact.js></script>

<section class="content">
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
</section>