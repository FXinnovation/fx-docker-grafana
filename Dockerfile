ARG  GRAFANA_VERSION="7.4.2"
FROM "grafana/grafana:${GRAFANA_VERSION}"
ARG  GRAFANA_VERSION

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

USER root

ADD ./resources /resources

RUN /resources/build && rm -rf resources

USER grafana

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="grafana" \
      "org.label-schema.base-image.name"="docker.io/grafana/grafana" \
      "org.label-schema.base-image.version"=$GRAFANA_VERSION \
      "org.label-schema.description"="Grafana in a container" \
      "org.label-schema.url"="https://grafana.com/" \
      "org.label-schema.vcs-url"="https://scm.dazzlingwrench.fxinnovation.com/fxinnovation-public/docker-grafana" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.grafana.version"=$GRAFANA_VERSION \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="See README.md"
