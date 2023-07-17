<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
<h1>index</h1>
<c:forEach items="${ex}" var="item">
	<div>${item.employee_id}</div>
	<div>${item.first_name}</div>
	<div>${item.last_name}</div>
</c:forEach>
</body>
</html>