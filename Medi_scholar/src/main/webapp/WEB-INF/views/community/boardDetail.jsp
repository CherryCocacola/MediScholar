<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>

   		<!-- 헤더 -->
    	<jsp:include page="../common/header.jsp" />
    	<script type="text/javascript" src=/resources/js/reply.js></script>
        
        <section class="content">
			
			<!-- 테스트 -->
            <div class="tit-con clear">
                <h2 class="f-l col-navy">Community</h2>
                <div class="f-r ma-t-5">
                    <a href="/">Home</a> > Community
                </div>
            </div>
			
            <div class="ma-t-15 clear">
                <button class="btn btn-1 f-r" onclick="location.href='/community/updatecomm?comm_postid=${cd.comm_postid}'">Update</button>
                <button class="btn btn-2 f-l" onclick="location.href='/community/list'">List</button>
            </div>
            
            <div class="con-list ma-t-5">
                <ul>
                    <li>
                        <div class="clear">
                            <div class="list-no"><strong>NOTICE</strong></div>
                            <div class="list-tit">${cd.title}</div>
                            <div class="list-writer">${cd.user_nm}</div>
                            <div class="list-etc">
                                <span>Comment : <strong>${rCount}</strong></span>
                                <span class="sep">|</span>
                                <span>Like : <strong>104</strong></span>
                                <span class="sep">|</span>
                                <span>Hit : <strong>12067</strong></span>
                                <span class="sep">|</span>
                                <span>Date : <strong><fmt:formatDate value="${cd.regdate}" pattern="yyyy-MM-dd HH:mm"/></strong></span>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="con-detail"> ${cd.memo}
                        </div>
                        <div class="a-c ma-t-10 ma-b-15">
                            <button class="btn btn-like">Like</button>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="ma-t-10 clear">
                <button class="btn btn-1 f-r" onclick="location.href='/community/updatecomm?comm_postid=${cd.comm_postid}'">Update</button>
                <button class="btn btn-2 f-r ma-r-5" onclick="location.href='/community/del?id=${cd.comm_postid}'">Delete</button>
                <button class="btn btn-2 f-l" onclick="location.href='/community/list'">List</button>
            </div>

  <div class="comm-list ma-t-20" id="replydiv">
    <div class="count">Comment: <strong></strong></div>
    <ul class="ma-t-5">
        <c:forEach var="rl" items="${rl}">
            <li>
            	<div style="display: flex;">
            	<c:if test="${rl.comm_redepth > 1}">
                <div>└─ &nbsp;</div>
                </c:if>
                <div class="comm-writer">${rl.comm_writernm}</div>
                <div class="comm-date">${rl.regdate}</div>
                <div class="comm-del">
                    <form id="replymodify">
                        <input type="hidden" class="renohidden" name="renoh" value="${rl.comm_reno}">
                        <input type="hidden" class="userhidden" name="useremailh" value="${user_email}">
                        <c:if test="${userNo eq rl.userno || userNo eq 1}">
                            <input type="button" value="Delete" onclick="deleteReply(${rl.comm_reno})">
                        </c:if>
                    </form>
                </div>
                <div class="comment">
                    <c:if test="${rl.comm_redepth > 1}">
                	${rl.comm_rememo}
                	</c:if>
                    <c:if test="${rl.comm_redepth == 1}">
                	<a href="javascript:toggleReplyInput(${rl.comm_reno})" style="color:blue;text-decoration: underline;">${rl.comm_rememo}</a>
                	</c:if>
                </div>

              </div>
              <div id="replyInput-${rl.comm_reno}" style="display: none;">
                  <textarea name="subreplyContent" id="subreplyContent" rows="2" cols="50"></textarea>
                  <input type="button" value="Reply" onclick="submitSubreply(${rl.comm_postid}, ${rl.comm_reno})">
              </div>
            </li>
        </c:forEach>
    </ul>
    <div class="comm-reg">
        <textarea placeholder="Comment here." id="replyContent" rows="4" cols="50"></textarea>
        <input type="hidden" class="postidhidden" name="postid" value="${postid}">
        <button class="btn" onclick="submitReply(${cd.postid})">Register</button>
    </div>
</div>
           
        </section>
        
    	<jsp:include page="../common/footer.jsp" />