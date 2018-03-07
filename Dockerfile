FROM alpine:3.6

ENV GRAFANA_VERSION=4.6.3 \
    CACERTIFICATES_VERSION=20161130-r2

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

EXPOSE 3000

WORKDIR /opt/grafana

ADD ./resources /resources

RUN /resources/build && rm -rf resources

ENTRYPOINT ["grafana-server"]

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="grafana" \
      "org.label-schema.base-image.name"="docker.io/library/alpine" \
      "org.label-schema.base-image.version"="3.6" \
      "org.label-schema.description"="Grafana in a container" \
      "org.label-schema.url"="https://grafana.com/" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-grafana" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.grafana.version"=$GRAFANA_VERSION \
      "org.label-schema.applications.ca-certificates.version"=$CACERTIFICATES_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="https://bitbucket.org/fxadmin/public-common-docker-grafana"
