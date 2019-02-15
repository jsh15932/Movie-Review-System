<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page language="javax.mail.Transport" %>
<%@ page language="javax.mail.Message" %>
<%@ page language="javax.mail.Address" %>
<%@ page language="javax.mail.internet.InternetAddress" %>
<%@ page language="javax.mail.internet.MimeMessage" %>
<%@ page language="javax.mail.Session" %>
<%@ page language="javax.mail.Authenticator" %>
<%@ page language="java.util.Properties" %>
<%@ page language="user.UserDAO" %>
<%@ page language="Util.SHA256" %>
<%@ page language="Util.Gmail" %>
<%@ page language="java.io.PrintWriter" %>
<%
	UserDAO userDAO = new UserDAO();
	String userID = null;
	if(session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	if(userID == null) {
		PrintWriter.script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인을 해주세요');");
		script.println("location.href = 'userLogin.jsp'");
		script.println("</script>");
		script.close();
		return;
	}

	boolean emailChecked = userDAO.getUserEmailChecked(userID);
	if(emailChecked == true) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 인증된 회원입니다.')");
		script.println("location.href = 'index.jsp'");
		script.println("</script>");
		script.close();
		return;
	}
	
	String host = "http://localhost:8080/Movie_Review_System";
	String from = "jsh1938@gmail.com";
	String to = userDAO.getUserEmail(userID);
	String subject = "커뮤니티 사용을 위한 이메일 인증 메일입니다.";
	String content = "다음 링크에 접속하여 이메일 인증을 진행하세요" + 
		"<a href='" + host + "emailCheckAction.jsp?code=" + new SHA256().getSHA256(to) + "'>이메일 인증하기</a>";
	
		Properties p = new Properties();
		p.put("mail.smtp.user", from);
		p.put("mail.smtp.host", "smtp.googleemail.com");
		p.put("mail.smtp.post", "465");
		p.put("mail.smtp.starttls.enable", "true");
		p.put("mail.smtp.auth", "true");
		p.put("mail.smtp.debug", "true");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		try {
			Authenticator auth = new Gmail();
			Session ses = Session.getInstance(p, auth);
			ses.setDebug(true);
			MimeMessage msg = new MimeMessage(ses);
			msg.setSubject(subject);
			Address formAddr = new InternetAddress(from);
			msg.setFrom(fromAddr);
			Address toAddr = new InternetAddress(to);
			msg.addRecipient(Message.RecipentType.TO, toAddr);
			msg.setContent(content, "text/html;charset=UTF8");
			Transport.send(msg);
		} catch (Exception e) {
			e.printStackTrace();
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('오류가 발생했습니다.')");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>영화 리뷰 웹 사이트</title>
	<!-- 부트스트랩 css 추가 -->
	<link rel="stylesheet" href="./css/bootstrap.min.css">
	<!-- 커스텀 css 추가 -->
	<link rel="stylesheet" href="./css/custom.css">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="index.jsp">영화 리뷰 웹 사이트</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar">
				<span class="navbar-toggler-icon"></span>
			</button>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active">
					<a class="nav-link" href="index.jsp">메인</a>
				</li>
					<a class="nav-link dropdown-toggle" id="dropdown" data-toggle="dropdown">회원 메뉴</a>
					<div class="dropdown-menu" aria-labelledby="dropdown">
						<a class="dropdown-item" href="userJoin.jsp">회원가입</a>
						<a class="dropdown-item" href="uesrLogin.jsp">로그인</a>
						<a class="dropdown-item" href="userLogout.jsp">로그아웃</a>
						<a class="dropdown-item" href="#">회원탈퇴</a>
					</div>	
				</ul>
				<form class="form-inline my-2 my-lg-0">
					<input class="form-control mr-sm-2" type="search" placeholder="내용을 입력하세요." aria-label="search">
					<button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
				</form>
		</div>
	</nav>
	<section class="container mt-3" style="max-width:560px;">
		<div class="alert alert-success mt-4" role="alert">
			이메일 주소 인증 메일이 전송되었습니다. 회원가입 시 입력했던 이메일에 들어가셔서 인증해주세요.
		</div>
    </section>
	<footer class="bg-dark mt-4 p-5 text-center" style="color:#FFFFFF;">
	Copyright &copy; 2019 장승훈 ALL RIGHTS RESERVED.
	</footer>
	<!-- jquery 자바스크립트 추가 -->
	<script src="./js/jquery.min.js"></script>
	<!-- popper 자바스크립트 추가 -->
	<script src="./js/popper.min.js"></script>
	<!-- bootstrap 자바스크립트 추가 -->
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>