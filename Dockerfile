FROM maven:3.8.4-openjdk-17-slim AS build

WORKDIR /app

COPY . /app/MyProject-1

RUN mvn package -f /app/MyProject-1/pom.xml

# Path: Dockerfile

FROM openjdk:17-slim

WORKDIR /app

COPY --from=build /app/MyProject-1/target/*.jar ./app.jar

EXPOSE 8080

CMD ["java", "-jar", "app.jar"]
