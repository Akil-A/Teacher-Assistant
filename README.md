# Teacher-Assistant

This is a module of our project. For this module we have only implemented the admin section.

We have used Spring MVC as a base framework, Hibernate to handle database entities and Spring Security for authentication.

**Server requirements**

 * Glassfish 4
 * JDK 1.8
 * MySQL 5.6

**Setup**

#### 1. Run [setup-database.sql](setup-database.sql) on your MySQL server

#### 2. Download [test1.war](target/test1.war)
* save to `glassfish\bin\test1.war`

#### 3. Start glassfish:
* run `glassfish\bin\asadmin` from command-line
* run `asadmin> start-domain domain1`

#### 4. Deploy Teacher-Assistant
* run `asadmin> deploy test1.war`

#### 5. Edit properties in **spring-database.xml**:

* full path `glassfish\domains\domain1\applications\test1\WEB-INF\spring-database.xml`
 
.

    <property name="url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="username" value="USER" />
    <property name="password" value="PASSWORD" />
    
And **persistence.xml**

    <property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="hibernate.connection.username" value="USER" />
    <property name="hibernate.connection.password" value="PASSWORD" />



#### 6. Open `localhost:8080/test1` in browser and login with username '**admin**' and password '**leet**'

## Created by

* [s198734 Ali El Hatri](mailto:s198734@stud.hioa.no)
* [s181142 Akil Asghar](mailto:s181142@stud.hioa.no)
* [s181322 Joakim Magnussen](mailto:s181322@stud.hioa.no) [@2](mailto:joakim-m@outlook.com)

Since we all check our mails at different time of day, please e-mail all three if there is a problem with the app.

This application was made possible with these tutorials

* [Getting Started with Spring MVC, Hibernate and JSON](https://confluence.jetbrains.com/display/IntelliJIDEA/Getting+Started+with+Spring+MVC,+Hibernate+and+JSON)
* [Spring Security Form Login Using Database](http://www.mkyong.com/spring-security/spring-security-form-login-using-database/)
* [Hibernate Many To Many Annotation Mapping Tutorial](http://viralpatel.net/blogs/hibernate-many-to-many-annotation-mapping-tutorial/)
