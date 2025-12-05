FROM eclipse-temurin:17-jdk-jammy

EXPOSE 8080

# Environment for application 
ENV APP_HOME=/app

# set working directory
WORKDIR $APP_HOME

# Copy .jar file 
COPY app/*.jar ./app.jar

# Execute application
CMD ["java", "-jar", "app.jar"]
