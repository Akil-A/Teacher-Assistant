## Teacher-Assistant

This is a module of our project. For this module we have only implemented the admin section.

**Server requirements**

 * Glassfish 4
 * JDK 1.8
 * MySQL 5.6

**Setup**

### 1. Choose **Download ZIP** from the Github sidebar.

### 2. Run [setup-database.sql](setup-database.sql)

### 3. Edit properties in **spring-database.xml**:

    <property name="url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="username" value="USER" />
    <property name="password" value="PASSWORD" />
    
And **persistence.xml**

    <property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="hibernate.connection.username" value="USER" />
    <property name="hibernate.connection.password" value="PASSWORD" />
    
### 4. Start glassfish:
* run `glassfish\bin\asadmin` from command-line
* run `asadmin> start-domain domain1`)


### 5. Deploy Teacher-Assistant
`asadmin> deploy Teacher-Assistant\target\test1.war`

### 6. Open `localhost:8080\test1` in browser and login with username '**admin**' and password '**leet**'

***

Thanks to these tutorials

* [Getting Started with Spring MVC, Hibernate and JSON](https://confluence.jetbrains.com/display/IntelliJIDEA/Getting+Started+with+Spring+MVC,+Hibernate+and+JSON)
* [Spring Security Form Login Using Database](http://www.mkyong.com/spring-security/spring-security-form-login-using-database/)
* [Hibernate Many To Many Annotation Mapping Tutorial](http://viralpatel.net/blogs/hibernate-many-to-many-annotation-mapping-tutorial/)
