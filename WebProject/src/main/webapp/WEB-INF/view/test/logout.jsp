<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	
	<button id="logout">카카오로그아웃</button>
	
	<script type="text/javascript">
		const logout = document.getElementById('logout');
		logout.addEventListener('click', () => {
			location.href='https://kauth.kakao.com/oauth/logout?client_id=d7a60e4c5295cff647529128c70b7348&logout_redirect_uri=http://localhost:8090/login';
		})
		
	</script>
</body>
</html>