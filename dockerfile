# Imagen base con Java 17
FROM openjdk:17-jdk-alpine

# Directorio de trabajo en el contenedor
WORKDIR /app

# Copiar el archivo JAR generado desde subcarpeta
COPY presentacion/target/presentacion-0.0.1-SNAPSHOT.jar app.jar

# Exponer el puerto de la app Spring Boot
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]
