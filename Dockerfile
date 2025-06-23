# Stage 1: Build the JAR using Maven
FROM maven:3.9.6-eclipse-temurin-17 AS builder

# Set work directory
WORKDIR /app

# Copy pom and source
COPY pom.xml .
COPY src ./src

# Build the jar
RUN mvn clean package -DskipTests

# Stage 2: Run the jar
FROM eclipse-temurin:17-jdk

# Set work directory
WORKDIR /app

# Copy jar from builder stage
COPY --from=builder /app/target/myapp-1.0.0.jar app.jar

# Run app
CMD ["java", "-jar", "app.jar"]
