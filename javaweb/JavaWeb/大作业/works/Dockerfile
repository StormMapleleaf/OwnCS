# 使用 OpenJDK 11 作为基础镜像
FROM adoptopenjdk/openjdk11:alpine

# 设置工作目录
WORKDIR /app

# 安装编译器和其他开发工具
RUN apk add --no-cache openjdk11-jdk

# 下载和解压 Tomcat
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.0.M1/bin/apache-tomcat-9.0.0.M1.tar.gz && \
    tar -zxvf apache-tomcat-9.0.0.M1.tar.gz && \
    rm apache-tomcat-9.0.0.M1.tar.gz && \
    mv apache-tomcat-9.0.0.M1 tomcat

# 下载 MySQL 驱动
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.26.tar.gz && \
    tar -zxvf mysql-connector-java-8.0.26.tar.gz && \
    cp mysql-connector-java-8.0.26/mysql-connector-java-8.0.26.jar tomcat/lib && \
    rm -rf mysql-connector-java-8.0.26 mysql-connector-java-8.0.26.tar.gz    

# 暴露 Tomcat 端口
EXPOSE 8088

# 启动 Tomcat
CMD ["/app/tomcat/bin/catalina.sh", "run"]

#注意，servlet需要用注解的方式配置

#构建流程
#docker build -t <镜像名称> .
#docker run -d -p 8080:8080 -v <项目本地路径>:/app/tomcat/webapps/ROOT/ <your_image_name>
#Example:docker run -d -p 8080:8080 -v D:/Javaweb/Pro1/:/app/tomcat/webapps/ROOT/ java

# 编译 Java 文件
# 进入容器  docker exec -it <container—_id> sh
# 运行find /app/tomcat/webapps/ROOT -name "*.java" | xargs javac -cp /app/tomcat/lib/servlet-api.jar -d /app/tomcat/webapps/ROOT/WEB-INF/classes

#重启容器docker restart <container_id>
#！！！！运行javac后一定要重启容器才能刷新服务！！！！

#访问地址
#http://localhost:8080/<此后填写项目下的包的路径>
#Example:http://localhost:8080/test1/test1.html


#示范项目结构
# Pro1
# │   Dockerfile
# │
# ├───test1
# ├───test2
# ├───test3
# ├───test4
# ├───test5                             //test为单独的程序
# │   │   LoginServlet.java
# │   │   test5.html
# │
# └───WEB-INF
    # └───classes                       //编译后的.class文件都会放在这里    
        # │   LoginServlet.class
        # │   MultiplicationTableServlet.class
        # │   RegisterServlet.class