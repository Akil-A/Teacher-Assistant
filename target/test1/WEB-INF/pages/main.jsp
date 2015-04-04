<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
    <title>Welcome to TeachAssist</title>
</head>
<body>
    <h1>Welcome to TeachAssist</h1>
    <ul>
        <li><a href="<c:url value="/student" />">Students</a></li>
        <li><a href="<c:url value="/class" />">Classes</a></li>
        <li><a href="<c:url value="/course" />">Courses</a></li>
    </ul>
    <p>Logged in as ${pageContext.request.userPrincipal.name} | <a href="javascript:doLogout()"> Logout</a></p>
    <form action="<c:url value="/j_spring_security_logout" />" method="post" id="logoutForm">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    <script>
        function doLogout() {
            document.getElementById("logoutForm").submit();
        }
    </script>
</body>
</html>