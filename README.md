## Teacher-Assistant

##### This is a module of our project. For this module we have only implemented the admin section.

#### Server requirements

 * Glassfish 4
 * JDK 1.8
 * MySQL 5.6

#### Setup

Please run [setup-database.sql](setup-database.sql)

Then edit properties in **spring-database.xml**:

    <property name="url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="username" value="USER" />
    <property name="password" value="PASSWORD" />
    
And **persistence.xml**

    <property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="hibernate.connection.username" value="USER" />
    <property name="hibernate.connection.password" value="PASSWORD" />

Finally, please login with username **admin** and password **leet**

***

These tutorials made it possible

* [Getting Started with Spring MVC, Hibernate and JSON](https://confluence.jetbrains.com/display/IntelliJIDEA/Getting+Started+with+Spring+MVC,+Hibernate+and+JSON)
* [Spring Security Form Login Using Database](http://www.mkyong.com/spring-security/spring-security-form-login-using-database/)
* [Hibernate Many To Many Annotation Mapping Tutorial](http://viralpatel.net/blogs/hibernate-many-to-many-annotation-mapping-tutorial/)
