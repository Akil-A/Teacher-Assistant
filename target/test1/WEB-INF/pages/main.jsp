<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<html>
<head>
    <title>Welcome to TeachAssist</title>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/font-awesome.min.css" />" rel="stylesheet">
</head>
<body>
    <h1>Welcome to TeachAssist</h1>
    <ul id="adminmenu">
        <li><a href="<c:url value="/student" />"><i class="fa fa-user"></i><span>Students</span></a></li>
        <li><a href="<c:url value="/class" />"><i class="fa fa-users"></i><span>Classes</span></a></li>
        <li><a href="<c:url value="/course" />"><i class="fa fa-book"></i><span>Courses</span></a></li>
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