<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
    <title>Login Page</title>
    <style>
    .error {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid #ebccd1;
        border-radius: 4px;
        color: #a94442;
        background-color: #f2dede;
    }
    .msg {
        padding: 15px;
        margin-bottom: 20px;
        border: 1px solid #bce8f1;
        border-radius: 4px;
        color: #31708f;
        background-color: #d9edf7;
    }
    #login-box {
        width: 300px;
        padding: 20px;
        margin: 100px auto;
        background: white;
        border-radius: 2px;
        border: 1px solid black;
    }
    </style>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
</head>
<body onload='document.loginForm.username.focus();'>
	<h1 align="center">Admin Page - Please Login</h1>
	<div id="login-box">
		<h3>Spring Security Login Form</h3>

		<c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<form name="loginForm" action="<c:url value="/j_spring_security_check" />" method="POST">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			<table>
				<tr>
					<td>User:</td>
					<td><input type="text" name="username"></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td colspan='2'><input name="submit" type="submit" value="submit" /></td>
				</tr>
			</table>

			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		</form>
	</div>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
    <sec:authorize access="hasRole('ROLE_ADMIN')">
        <script>window.location.href="<c:url value="/main" />";</script>
    </sec:authorize>
    </c:if>
</body>
</html>