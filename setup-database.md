# How to setup a local database for TeachAssist

Requires MySQL 5.6

### 1. Run [setup-database.sql](setup-database.sql) on your MySQL server

### 2. After deployment edit properties in spring-database.xml:

* full path `glassfish\domains\domain1\applications\test1\WEB-INF\spring-database.xml`

.

    <property name="url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="username" value="USER" />
    <property name="password" value="PASSWORD" />

And **persistence.xml**

* full path `glassfish\domains\domain1\applications\test1\META-INF\persistence.xml`

.

    <property name="hibernate.connection.url" value="jdbc:mysql://localhost:3306/MY_SCHEMA" />
    <property name="hibernate.connection.username" value="USER" />
    <property name="hibernate.connection.password" value="PASSWORD" />