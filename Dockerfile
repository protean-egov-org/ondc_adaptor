FROM openjdk:11
ARG JAR_FILE=./jars/beckn-adaptor-public-0.0.5.jar
COPY ${JAR_FILE} ondc_adaptor.jar
ENTRYPOINT ["java","-jar","./ondc_adaptor.jar"]
EXPOSE 8088
