<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="tmp" items="${clist }">
		<c:choose>
			<c:when test="${loginUser ne tmp.sendNick}">
				<div class="incoming_msg">
					<div class="incoming_msg_img">
						<a href="/root/ggiriMessage/otherProfile?otherNick=${tmp.sendNick }">
							보낸사람
						</a>
					</div>
					<div class="received_msg">
						<div class="received_withd_msg">
							<p>${tmp.content }</p>
							<span class="time_date">${tmp.sendTime }</span>
						</div>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<div class="outgoing_msg">
					<div class="sent_msg">
						<p>${tmp.content }</p>
						<span class="time_date">${tmp.sendTime }</span>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
</c:forEach>
