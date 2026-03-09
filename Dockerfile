# Paso 1: Construcción (Build) usando Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
COPY . .
RUN mvn clean package -DskipTests

# Paso 2: Ejecución (Run)
FROM eclipse-temurin:17-jdk-jammy
COPY --from=build /target/*.jar app.jar
# Render pasará el puerto automáticamente aquí
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]