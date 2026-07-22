# Development image with Maven + Jetty for hot reload
FROM maven:3.9.9-eclipse-temurin-21 AS dev
WORKDIR /app

COPY pom.xml ./
RUN mvn -q -DskipTests dependency:resolve
COPY src ./src

EXPOSE 8080
CMD ["mvn", "jetty:run"]

# Build packaged WAR
FROM maven:3.9.9-eclipse-temurin-21 AS builder
WORKDIR /build

COPY pom.xml ./
RUN mvn -q -DskipTests dependency:go-offline
COPY src ./src
RUN mvn -q clean package -DskipTests

# Small runtime image
FROM tomcat:11.0-jre21-temurin
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=builder /build/target/servlet-skeleton.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
