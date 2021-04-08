package tech.itpark.http;

public class Main {
    public static void main(String[] args) {
        System.out.println("Я из контейнера!");
        final var server = new Server();
        server.listen(9999);
    }
}
