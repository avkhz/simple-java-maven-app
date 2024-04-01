FROM maven:3.8.6-jdk-11 as base

ARG MAJOR_NUM
ARG MINOR_NUM
ARG PATCH_NUM

COPY . .

RUN bash run.sh $MAJOR_NUM $MINOR_NUM $PATCH_NUM

RUN mvn package
WORKDIR target
RUN ls

FROM openjdk:17-jdk-slim

ARG MAJOR_NUM
ARG MINOR_NUM
ARG PATCH_NUM

COPY --from=base /target/my-app-$MAJOR_NUM.$MINOR_NUM.$PATCH_NUM.jar .

CMD java -jar *.jar
