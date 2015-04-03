<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <style>
        div.code{
            background-color:#eee;
            border:1px solid #99cc99;
            display:inline-block;
            padding:10px;
        }
        code{
            background-color:#f2f2f2;
            border:1px solid #99cc99;
            padding: 3px;
            font-weight: bold;
        }
        pre{
            margin:0;
        }
        pre b{
            border-bottom: 1px solid black;
        }
    </style>
</head>
<body>
    <h1>Hello!</h1>
	<h3>This is a module of our project. For this module we have only implemented the admin section.</h3>
    <p>To setup a database for this demo, please run the following script on your MySQL server:</p>
    <div class="code"><pre>use <b>MY_SCHEMA</b>;

CREATE TABLE ta_users (
  username VARCHAR(45) NOT NULL ,
  password VARCHAR(45) NOT NULL ,
  enabled TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (username));

CREATE TABLE ta_user_roles (
  user_role_id INT(11) NOT NULL AUTO_INCREMENT,
  username VARCHAR(45) NOT NULL,
  ROLE VARCHAR(45) NOT NULL,
  PRIMARY KEY (user_role_id),
  UNIQUE KEY uni_username_role (ROLE,username),
  KEY fk_username_idx (username),
  CONSTRAINT fk_ta_username FOREIGN KEY (username)
    REFERENCES ta_users (username));

INSERT INTO ta_users(username,password,enabled)
  VALUES ('admin','leet', TRUE);

INSERT INTO ta_user_roles (username, ROLE)
  VALUES ('admin', 'ROLE_ADMIN');</pre></div>

    <p>Then open <code>spring-database.xml</code> and change these three properties to match your settings:</p>
    <div class="code"><pre>&lt;property name="url" value="jdbc:mysql://localhost:3306/<b>MY_SCHEMA</b>" /&gt;
&lt;property name="username" value="<b>USER</b>" /&gt;
&lt;property name="password" value="<b>PASSWORD</b>" /&gt;</pre></div>
    <p>Then, open <code>persistence.xml</code> and change these three in the same way:</p>
    <div class="code"><pre>&lt;property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/<b>MY_SCHEMA</b>" /&gt;
&lt;property name="hibernate.connection.username" value="<b>USER</b>" /&gt;
&lt;property name="hibernate.connection.password" value="<b>PASSWORD</b>" /&gt;</pre></div>
    <p>Please make sure your user has the rights to create tables. You may need to re-deploy project after making these changes.</p>
    <p>Finally use 'admin' as username and 'leet' as password to login. <b><a href="<c:url value="/login" />">Click here to login</a></b></p>

    <hr>

    <p>We have used these tutorials to make this application:</p>
    <ul>
        <li><a href="https://confluence.jetbrains.com/display/IntelliJIDEA/Getting+Started+with+Spring+MVC,+Hibernate+and+JSON">Getting Started with Spring MVC, Hibernate and JSON</a></li>
        <li><a href="http://www.mkyong.com/spring-security/spring-security-form-login-using-database/">Spring Security Form Login Using Database</a></li>
        <li><a href="http://viralpatel.net/blogs/hibernate-many-to-many-annotation-mapping-tutorial/">Hibernate Many To Many Annotation Mapping Tutorial</a></li>
    </ul>
</body>
</html>