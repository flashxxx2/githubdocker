#Без мавена
#FROM openjdk:11 AS build
#COPY src/ src/
#RUN javac -sourcepath ./src -d bin src/main/java/tech/itpark/http/*.java src/main/java/tech/itpark/http/guava/*.java src/main/java/tech/itpark/http/exception/*.java
#
#FROM openjdk:11
#COPY --from=build ./bin ./bin
#CMD ["java", "-classpath","./bin", "tech.itpark.http.Main"]

#С мавеном
FROM maven:3-openjdk-15-slim AS build
WORKDIR /app/build
COPY . .
RUN mvn package -B
RUN mv target/http-server-1.0-jar-with-dependencies.jar target/app.jar

FROM openjdk:17-slim
WORKDIR /app/bin
COPY --from=build /app/build/target/app.jar .
CMD ["java", "-jar", "app.jar"]