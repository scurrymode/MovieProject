<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.sist.movie.*, java.util.*" %>
<jsp:useBean id="mgr" class="com.sist.movie.MovieManager"/>

<%
	//데이터 읽기
	List<MovieVO> list = mgr.movieMainData();
%>

<%-- 
	1)JSP(JavaServer Page)
		- 지시자<%@ %>
			1. page : jsp에 대한 정보
					1)contentType : text/html, text/xml 실행시 어떤걸로 변환할지
					2)import : 자바라이브러리 읽기
					3)errorPage : 에러 발생시 보여줄 페이지 설정
						- 404 : 파일이 없는 경우
						- 500 : 소스번역에 에러
						- 401 : 인증 못받았을때,
						- 415 : 변환 코드 => EUC-KR을 ECU-KR로 잘못치는 경우
						- 200 : 정상수행
			2. taglib : 자바문법(제어문)을 태그형으로 제작
					core : 제어문, URL관련
						<c:forEach>, <c:if>, <c:redirect>
					format
						<fmt:frmatDate> SimpleDateFormat을 태그형식으로
					sql : DAO쓰니깐 많이 안씀
					xml : JAXP(xml 파싱), JAXB(★★★★★)xml 바인딩
					fn : function(String, List)
			3. include : 다른 파일을 추가시킴
				1. <%@ include %> : 고정된 파일을 넣을때(컴파일하기전에 합쳐지기에 자바 소스가 합쳐진다.) 같은 변수 쓰면 에러남
				2. <jsp:include> : 동적인 파일을 넣을때(컴파일이 따로되고, 그 결과인 html이 합쳐지는 것) 변수가 같아도 괜찮음
				
		- 스크립트
			1. <%  %> 스크립트릿(일반 자바)
			2. <%! %> 선언문
			3. <%= %> 표현문(브라우저 출력)
			
		- jsp 액션태그
			<jsp:useBean id="mem" class="member"> -->자바에서  Member mem = new Member();
			<jsp:setProperty><jsp:getProperty>
			<jsp: include>
			<jsp:forward> : jsp 흐름과 관련
		
		- 내장객체(9개)
			request : HttpServletRequest    http://localhost:8080/MovieProject/movie/main.jsp
													프로토콜	서버주소	포트	ContextPath
																					---------------------------이게 URI
													 -------------------------------------------------이게 URL																						
													서버정보 getServerInfo(); getPort();
													클라이언트정보 getRequestURI(); getRequestURL(); getContextPath(); getRemoteAddress();
													요청정보 String getParameter(); String[] getParameterValues();
													추가정보 setAttribute() getAttribute()													
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