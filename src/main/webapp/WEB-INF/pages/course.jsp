<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Courses</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
    <h3>Courses</h3>
    <form:form method="post" action="course/add" commandName="course">
        <form:label path="courseName">Course name:</form:label><br>
        <form:input path="courseName"/><br><br>

        <form:label path="courseCode">Course code:</form:label><br>
        <form:input path="courseCode"/><br><br>

        <input type="submit" id="addCourse" value="Add Course"/>
        <span id="error" style="color:red;display:none;">Please fill all fields.</span>
    </form:form>

    <script>
        var regex = /^[a-zA-Z0-9]+$/;
        $("#addCourse").click(function(event){
            var courseCode = $("#courseCode").val(),
                    courseName = $("#courseName").val();
            if (!regex.test(courseCode) || !regex.test(courseName)){
                $("#error").show();
                event.preventDefault();
            }
        });
    </script>

    <c:if test="${!empty courses}">
        <h3>Courses</h3>
        <table border="1" cellspacing="0" cellpadding="2" width="400" style="text-align: center">
            <thead>
            <tr>
                <th>Name</th>
                <th>Code</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${courses}" var="course">
                <tr>
                    <td>${course.courseName}</td>
                    <td>${course.courseCode}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <p><a href="<c:url value="/main" />">Back to main</a></p>
</body>
</html>
