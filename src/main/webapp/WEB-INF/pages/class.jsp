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
    <script src="<c:url value="/resources/jquery.color-2.1.2.min.js" />"></script>
    <link href="<c:url value="/resources/style.css" />" rel="stylesheet">
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
        <form:form method="post" action="class/saveAll">
            <h3>Assign courses to classes</h3>
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
                        <label><input class="toggleCourse" type="checkbox" data-class="${class.classID}" value="${course.courseID}">${course.courseName}</label>
                    </c:forEach>
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
            <p><input type="submit" id="saveAll" value="Save courses in classes" disabled/> <small>This feature is not finished :(</small></p>
        </form:form>
    </c:if>

    <p><a href="<c:url value="/main" />">Back to main</a></p>

    <script>
        $("input.toggleCourse").change(function(e){
            e.preventDefault();

            var $this = $(this);
            var classID = $this.data("class");
            var courseID = $this.val();
            var d = {classID: classID, courseID: courseID};
            if ($this.prop("checked")){
                $.post("<c:url value="/class/removeCourse" />", d).done(function(){
                    $this.prop("checked", false);
                }).fail(function(){
                    alert("Could not remove this course");
                });
            }
            else {
                $.post("<c:url value="/class/addCourse" />", d).done(function(){
                    $this.prop("checked", false);
                }).fail(function(){
                    alert("Could not add this course");
                });
            }
        });
    </script>
</body>
</html>
