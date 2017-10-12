<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "org.dimigo.vo.UserVO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>MyBlog</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
<link rel="stylesheet" href="/WebClass/css/footer.css">
<style>
div.container {
  padding-top: 30px;
  padding-bottom: 20px;
}
</style>

<script>
function menu_over(e) {
	e.setAttribute("class", "nav-item active");
}
function menu_out(e) {
	e.setAttribute("class", "nav-item");
}
</script>
</head>
<body>

<%
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	String name = request.getParameter("name");
	String nickname = request.getParameter("nickname");
	%>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="/WebClass/myblog/myblog.jsp">MyBlog</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
  	<%@ include file="menu.jsp" %>
  	
    <%-- 세션이 없는 경우 --%>
    <%
    	UserVO user = (UserVO)session.getAttribute("user");
   		if(user == null){ 
    %>
    	<form id="signupForm" class="form-signin" action="/WebClass/bloglogin" method="post" style="display: flex;">
      <input type="email" name="id" id="id" class="form-control" placeholder="id" required autofocus>
      <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="pwd" required>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
    </form>
      <a class="nav-link" href="signin.html">SignIn</a>
    	<% } else if("baesh@naver.com".equals(user.getId())) {%>	
    <%-- 세션이 있는 경우 --%>
	    <ul class="navbar-nav flex-row ml-md-auto d-none d-md-flex">
	    <li class="nav-item dropdown">
	      <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="bd-versions" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    	<%=user.getName() + "님"%>
	      </a>
	      <div class="dropdown-menu dropdown-menu-right" aria-labelledby="bd-versions">
	      	<form action = "/WebClass/bloglogout" method="post">
	      	<button type="submit" class="dropdown-item">Sign out</button>
	      	</form>
	       	<div class="dropdown-divider"></div>
	        <button type="button" class="dropdown-item">Action1</button>
	        <button type="button" class="dropdown-item">Action2</button>
	      </div>
	    </li>
	    </ul>

	    <%}else{ %>
	    <form id="signupForm" class="form-signin" action="/WebClass/bloglogin" method="post"  style="display: flex;">
      <input type="email" name="id" id="id" class="form-control" placeholder="id" value = <%=user.getId() %> required autofocus>
      <input type="password" name="pwd" id="inputPassword" class="form-control" placeholder="pwd" value = <%=pwd %> required>
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
    </form>
      <a class="nav-link" href="/WebClass/myblog/signin.html">SignIn</a>
	    <% }%>
  </div>
</nav>
<div class = "container">
    <h1>BAESH</h1>
	<p>뭔가 할일없어보이는 수학충 배성현의 블로그입니다</p>
	
	 <img src="/WebClass/image/math2.jpg" alt="math" class="img-thumbnail">
	 <a href="sigong.html">click here</a>
	</div>

<%@ include file="footer.jsp" %>

<!-- Bootstrap js -->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
<%@ include file="modal.jsp" %>
<script>
	<% 
	if("error".equals((String)request.getAttribute("msg"))){ 
		System.out.println("Checked!!!!!");
	%>
		var myModal = $('#myModal');
		myModal.find('.modal-title').text('Login Error');
		myModal.find('.modal-body').text('로그인시 오류가 발생하였습니다.');
		myModal.modal();
	<% } %>
	
	
</script>
</body>
</html>