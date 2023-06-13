
package com.ggiri.root.message.serviceCon;

import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet
public class MessageServiceCon extends HttpServlet {

	public void service(HttpServletRequest request, HttpServletResponse response) {
		
		request.setCharacterEncoding("utf-8");
		
		String sendName = request.getParameter("sendName");
		String receive = request.getParameter("receive");
		String message = request.getParameter("message");
		
		System.out.println(sendName);
		System.out.println(receive);
		System.out.println(message);
		
	}
	
	
}
