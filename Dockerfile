FROM alpine:3.14

RUN  apk update \
  && apk upgrade --no-cache \
  && apk add --no-cache openjdk11 tzdata \
  && rm -rf /var/cache/apk/*

ENV TZ=Asia/Seoul

RUN apk --no-cache add tzdata \
  && cp /usr/share/zoneinfo/${TZ} /etc/localtime \
  && apk del tzdata

WORKDIR /app

COPY target/webproject-0.0.1.war .

CMD ["java", "-jar", "webproject-0.0.1.war"]

EXPOSE 8080
