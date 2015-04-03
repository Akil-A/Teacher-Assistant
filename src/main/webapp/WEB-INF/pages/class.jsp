<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Classes</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
</head>
<body>
    <h3>Classes</h3>
    <form:form method="post" action="class/add" commandName="class">
        <form:label path="className">Class name:</form:label><br>
        <form:input path="className"/><br><br>

        <input type="submit" id="addClass" value="Add Class"/>
        <span id="error" style="color:red;display:none;">Please fill all fields.</span>
    </form:form>

    <script>
        var regex = /^[a-zA-Z0-9]+$/;
        $("#addClass").click(function(event){
            var className = $("#className").val();
            if (!regex.test(className)){
                $("#error").show();
                event.preventDefault();
            }
        });
    </script>

    <c:if test="${!empty classes}">
        <form:form method="post" action="class/saveCourses">
            <h3>Classes</h3>
            <table border="1" cellspacing="0" cellpadding="2" width="500" style="text-align: center">
                <thead>
                <tr>
                    <th>Class name</th>
                    <th>Class has course</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${classes}" var="class">
                <tr>
                    <td>${class.className}</td>
                    <td>
                    <c:forEach items="${courses}" var="course">
                        <label><input type="checkbox" data-class="${class.classID}" value="${course.courseID}">${course.courseName}</label>
                    </c:forEach>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <p><input type="submit" id="saveCourses" value="Save Courses"/></p>
        </form:form>
    </c:if>

    <p><a href="<c:url value="/main" />">Back to main</a></p>
</body>
</html>
