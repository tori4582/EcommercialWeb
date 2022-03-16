# Construction Materials e-Commerce Web
*powered by **Java 11, Jakarta EE 9, JSP 4.0, Maven***

## How to run

### Requisites
1. Eclipse Glassfish 6.2.1
2. Maven
3. Java 17 (***recommended**, 11+ is also supported*)

### Installing step
1. Download the repo using `git clone` or downloading `.zip` file
2. Use `cd` to jump into the project directory
3. Run `maven build`
4. Run `asadmin start-domain` to start Glassfish server instance
5. Run `asadmin deploy -f $WAR_PATH` to deploy `.war` onto server instance
6. Open the link `localhost:8080/EcommercialWeb/home` to start the web
