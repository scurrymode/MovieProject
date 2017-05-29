<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<%--
	페이지변경
	1) HTML
		<a> : GET방식 URL?
		<form> -> action : GET/POST
	2) Java
		sendRedirect() : GET
		forward() : GET
	3) JavaScript
		location.href="" : GET
		
		한글의 경우
		GET방식 server.xml <Connector URIEncoding="UTF-8""/>
		POST방식 받을때마다 setCharacterEncoding("utf-8")
		
		브라우저 : ASC (8bit)를 주로 씀
		Unicode(16bit)
 --%>
<body>
	<a href="output.jsp?name=홍길동">click</a>
</body>
</html>