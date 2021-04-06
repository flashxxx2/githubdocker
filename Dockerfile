FROM openjdk:11 AS build
COPY . .
RUN javac src/main/java/tech/itpark/http/*.java src/main/java/tech/itpark/http/guava/*.java src/main/java/tech/itpark/http/exception/*.java

FROM openjdk:11
COPY --from=build src/main/java/tech/itpark/http/Main.class .
CMD ["java", "src/main/java/tech/itpark/http/Main"]