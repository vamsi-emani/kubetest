FROM openjdk:11
MAINTAINER vamsi.emani
COPY target/kubetest-1.0.jar app.jar
ENTRYPOINT ["java", "-cp", "/app.jar", "com.nerdysermons.Echo", "Hello world!"]