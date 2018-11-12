# Dockerfile for eureka
# Build with:
# docker build -t eureka .
# Run with:
# docker run -p 2000:2000 -d -v /tmp/logs:/opt/logs --name eureka eureka

FROM openjdk:8-jre-alpine
MAINTAINER yancq <493522194@qq.com>

ENV SERVICE_NAME eureka
ENV VERSION 1.0-BETA

RUN echo "http://mirrors.aliyun.com/alpine/v3.8/main" > /etc/apk/repositories \
    && echo "http://mirrors.aliyun.com/alpine/v3.8/community" >> /etc/apk/repositories \
    && apk update upgrade \
    && apk add --no-cache procps unzip curl bash tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

ADD ${SERVICE_NAME}-${VERSION}.zip /${SERVICE_NAME}/${SERVICE_NAME}-${VERSION}.zip

RUN unzip /${SERVICE_NAME}/${SERVICE_NAME}-${VERSION}.zip -d /${SERVICE_NAME} \
    && rm -rf /${SERVICE_NAME}/${SERVICE_NAME}-${VERSION}.zip \
    && sed -i '$d' /${SERVICE_NAME}/scripts/startup.sh \
    && echo "tail -f /dev/null" >> /${SERVICE_NAME}/scripts/startup.sh

EXPOSE 2000

CMD ["/eureka/scripts/startup.sh"]
