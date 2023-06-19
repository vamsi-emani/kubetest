FROM openjdk:11
MAINTAINER vamsi.emani
COPY target/utils-1.0.jar app.jar
ENTRYPOINT ["java", "-cp", "/app.jar", "com.nerdysermons.Echo", "hello"]