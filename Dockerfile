# Build stage - Sử dụng JDK để build
FROM maven:3.9.6-eclipse-temurin-17-alpine AS build
WORKDIR /app
COPY pom.xml .
# Tải dependencies trước để tận dụng cache Docker layer
RUN mvn dependency:go-offline
COPY src ./src
# Build và bỏ qua tests (nên chạy test ở CI/CD riêng)
RUN mvn clean package -DskipTests

# Runtime stage - Chỉ cần JRE cho production
FROM tomcat:11.0.0-jre17-temurin
WORKDIR /usr/local/tomcat

# Xóa ứng dụng mặc định và thư mục work để tránh cache
RUN rm -rf webapps/* && \
    rm -rf work/* && \
    rm -rf temp/*

# Copy file WAR từ stage build
COPY --from=build /app/target/WebMyPham_-1.0-SNAPSHOT.war webapps/ROOT.war

# Expose port và chạy Tomcat
EXPOSE 8080
CMD ["catalina.sh", "run"]