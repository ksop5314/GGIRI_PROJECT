<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="tmp" items="${list }">
	<div class="chat_list_box${tmp.room } chat_list_box">
		<div type="button" class="chat_list" room="${tmp.room }" other_nick="${tmp.otherNick }">
			<div class="chat_people">
				<div class="chat_img">
					<a href="/root/ggiriMessage/otherProfile?otherNick=${tmp.otherNick }">
						아이디주인
					</a>
				</div>
				<div class="chat_ib">
					<h5>${tmp.otherNick }<span class="chat_date">${tmp.sendTime }</span></h5>
					<div class="row">
						<div class="col-10">
							<p>${tmp.content }</p>
						</div>
						<c:if test="${tmp.unread > 0 }">
							<div class="col-2 unread${tmp.room }">
								<span class="badge bg-danger">${tmp.unread }</span>
							</div>
						</c:if>
					</div>
				</div>
			</div>
		</div>
	</div>
</c:forEach>
