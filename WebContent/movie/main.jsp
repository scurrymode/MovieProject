<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.movie.*, java.util.*" %>
<jsp:useBean id="mgr" class="com.sist.movie.MovieManager"/>

<%
	//������ �б�
	List<MovieVO> list = mgr.movieMainData();
%>

<%-- 
	1)JSP(JavaServer Page)
		- ������<%@ %>
			1. page : jsp�� ���� ����
					1)contentType : text/html, text/xml ����� ��ɷ� ��ȯ����
					2)import : �ڹٶ��̺귯�� �б�
					3)errorPage : ���� �߻��� ������ ������ ����
						- 404 : ������ ���� ���
						- 500 : �ҽ������� ����
						- 401 : ���� ���޾�����,
						- 415 : ��ȯ �ڵ� => EUC-KR�� ECU-KR�� �߸�ġ�� ���
						- 200 : �������
			2. taglib : �ڹٹ���(���)�� �±������� ����
					core : ���, URL����
						<c:forEach>, <c:if>, <c:redirect>
					format
						<fmt:frmatDate> SimpleDateFormat�� �±���������
					sql : DAO���ϱ� ���� �Ⱦ�
					xml : JAXP(xml �Ľ�), JAXB(�ڡڡڡڡ�)xml ���ε�
					fn : function(String, List)
			3. include : �ٸ� ������ �߰���Ŵ
				1. <%@ include %> : ������ ������ ������(�������ϱ����� �������⿡ �ڹ� �ҽ��� ��������.) ���� ���� ���� ������
				2. <jsp:include> : ������ ������ ������(�������� ���εǰ�, �� ����� html�� �������� ��) ������ ���Ƶ� ������
				
		- ��ũ��Ʈ
			1. <%  %> ��ũ��Ʈ��(�Ϲ� �ڹ�)
			2. <%! %> ����
			3. <%= %> ǥ����(������ ���)
			
		- jsp �׼��±�
			<jsp:useBean id="mem" class="member"> -->�ڹٿ���  Member mem = new Member();
			<jsp:setProperty><jsp:getProperty>
			<jsp: include>
			<jsp:forward> : jsp �帧�� ����
		
		- ���尴ü(9��)
			request : HttpServletRequest    http://localhost:8080/MovieProject/movie/main.jsp
													��������	�����ּ�	��Ʈ	ContextPath
																					---------------------------�̰� URI
													 -------------------------------------------------�̰� URL																						
													�������� getServerInfo(); getPort();
													Ŭ���̾�Ʈ���� getRequestURI(); getRequestURL(); getContextPath(); getRemoteAddress();
													��û���� String getParameter(); String[] getParameterValues();
													�߰����� setAttribute() getAttribute()													
			response : HttpServletResponse
			session : HttpSession
			out : JspWriter
			application : ServletContext
			exception : Exception
			config : ServletConfig
			page : Object
			pageContext : PageContext
 			
--%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="table.css">

</head>

<body>
	<center>
		<table id="table_content" width=800>
		<tr>
			<%
				for(MovieVO vo:list){
			%>
				<td>
					<a href="detail.jsp?midx=<%=vo.getLink()%>">
					<img src="<%=vo.getPoster()%>" width=200 height=240>
					</a>
				</td>
			<%		
				}
			%>
		</tr>
		<tr>
			<%
				for(MovieVO vo:list){
			%>
				<td>
					<%=vo.getGrade()%>
				</td>
			<%		
				}
			%>
		</tr>
		</table>
	</center>

</body>
</html>