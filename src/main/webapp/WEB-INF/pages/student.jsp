<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page session="true"%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>Students</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
</head>

<body>
    <h3>Students</h3>
    <form:form method="post" action="student/add" commandName="user">
        <form:label path="studentId">Student id:</form:label><br>
        <form:input path="studentId"/><br><br>

        <form:label path="firstName">First Name:</form:label><br>
        <form:input path="firstName"/><br><br>

        <form:label path="lastName">Last Name:</form:label><br>
        <form:input path="lastName"/><br><br>

        <form:label path="className">Assign to class:</form:label><br>
        <form:select path="className">
            <form:option value="NONE" label="--- Select ---"/>
            <form:options items="${classList}" />
        </form:select> -or- <input type="text" id="newClass" name="newClass" placeholder="new class"><br><br>

        <input type="submit" id="addStudent" value="Add Student"/>
        <span id="error" style="color:red;display:none;">Please fill all fields.</span>
    </form:form>

    <script>
        var regex_num = /^[0-9]+$/,
                regex = /^[\w\s\-]+$/;
        $("#addStudent").click(function(event){
            var studentID = $("#studentId").val(),
                    firstName = $("#firstName").val(),
                    lastName = $("#lastName").val(),
                    className = $("#className option:selected").val(),
                    newClass = $("#newClass").val();
            if (!regex_num.test(studentID) || !regex.test(firstName) || !regex.test(lastName) || (className == "NONE" && !regex.test(newClass))){
                $("#error").show();
                event.preventDefault();
            }
        });
    </script>

    <c:if test="${!empty users}">
        <h3>Students</h3>
        <table border="1" cellspacing="0" cellpadding="2" width="400" style="text-align: center">
            <thead>
            <tr>
                <th>Stud.id.</th>
                <th>Name</th>
                <th>Class</th>
                <!--<th>&nbsp;</th>-->
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td>${user.studentId}</td>
                    <td>${user.firstName} ${user.lastName}</td>
                    <td>${user.className}</td>
                    <!--td>
                        <form action="student/delete/${user.id}" method="post"><input type="submit" value="Delete"/></form>
                    </td-->
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </c:if>

    <p><a href="<c:url value="/main" />">Back to main</a></p>
</body>
</html>