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

# 暴露 Tomcat 端口
EXPOSE 8080

# 启动 Tomcat
CMD ["/app/tomcat/bin/catalina.sh", "run"]

#注意，servlet需要用注解的方式配置

#构建流程
#docker build -t <镜像名称> .
#docker run -d -p 8080:8080 -v [jsp_files的本地路径]:/app/tomcat/webapps/ROOT/ -v [servlet的本地路径]:/app/tomcat/webapps/ROOT/WEB-INF/classes/ [your_image_name]
#Example:docker run -d -p 8080:8080 -v D:/Javaweb/Pro1/jsp_files:/app/tomcat/webapps/ROOT/ -v D:/Javaweb/Pro1/servlet:/app/tomcat/webapps/ROOT/WEB-INF/classes/ java

# 编译 Java 文件
# 进入容器  docker exec -it <container—_id> sh
# 运行javac -cp /app/tomcat/lib/servlet-api.jar:/app/tomcat/webapps/ROOT/WEB-INF/classes /app/tomcat/webapps/ROOT/WEB-INF/classes/*.java

#重启容器docker restart <container_id>
#！！！！运行javac后一定要重启容器才能刷新服务！！！！

#访问地址
#http://localhost:8080/此后填写jsp_files下的jsp文件名
