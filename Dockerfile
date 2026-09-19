# PARTE 1: Construcción de la aplicación
FROM gradle:8-jdk21 AS build

WORKDIR /app

COPY . .

RUN gradle clean bootJar --no-daemon


# PARTE 2: Ejecución de la aplicación
FROM openjdk:21-jdk-slim

WORKDIR /app

COPY --from=build /app/build/libs/discografia-1.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]