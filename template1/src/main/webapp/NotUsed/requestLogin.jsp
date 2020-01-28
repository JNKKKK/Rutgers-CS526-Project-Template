<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String name = request.getParameter("name");
	String password = request.getParameter("password");
	String remember = request.getParameter("remember");
	if(password == null || password.isEmpty() || name == null || name.isEmpty()){
		response.sendRedirect(request.getContextPath() + "/loginFault.jsp");
	} else {
		response.sendRedirect("requestLogin");
	}
%>