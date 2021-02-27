FROM nginx:1.17.0

LABEL MAINTAINER="BuildingIQ Docker Team <docker.buildingiq.com>"

RUN apt-get update &&\
    apt install  dos2unix &&\
    mkdir -p /opt/react-app

ADD nginx /etc/nginx/conf.d
ADD build /opt/react-app

RUN dos2unix /etc/nginx/conf.d/default.conf

COPY entrypoint /
RUN chmod +x /entrypoint
ENTRYPOINT [ "/entrypoint" ]

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]