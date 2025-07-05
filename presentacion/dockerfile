# Usar una imagen base ligera con Java 17
FROM openjdk:17-jdk-alpine

# Establecer el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copiar el JAR al contenedor
COPY target/presentacion-0.0.1-SNAPSHOT.jar app.jar 

# Exponer el puerto 8080 (Spring Boot por defecto)
EXPOSE 8080

# Comando para ejecutar la aplicación
CMD ["java", "-jar", "app.jar"]