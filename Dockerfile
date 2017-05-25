FROM grafana/grafana:3.4.1

ENV GF_SESSIONS_PROVIDER=memcache \
    GF_SESSIONS_PROVIDER_CONFIG=memcached.applications:11211 \
    GF_ANALYTICS_REPORTING_ENABLED=false \
    GF_ANALYTICS_CHEF_FOR_UPDATES=false \
    GF_SECURITY_ADMIN_USER=fxinnovation \
    GF_SECURITY_ADMIN_PASSWORD=fx1nn0v@t10n \
    GF_USERS_ALLOW_SIGN_UP=false \
    GF_USERS_ALLOW_ORG_CREATE=false \
    GF_AUTH_BASIC_ENABLED=true \
    GF_LOG_MODE=console \
    GF_LOG_LEVEL=warn \
    GF_LOG_CONSOLE_LEVEL=warn \
    GF_LOG_CONSOLE_FORMAT=json \
    GF_DASHBOARDS_JSON_ENABLED=true \
    GF_DASHBOARDS_JSON_PATH=/data/dashboards

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

ADD ./resources /resources

RUN /resources/build && rm -rf resources

LABEL "maintainer"="cloudsquad@fxinnovation.com" \
      "org.label-schema.name"="grafana" \
      "org.label-schema.base-image.name"="docker.io/grafana/grafana" \
      "org.label-schema.base-image.version"="3.4.1" \
      "org.label-schema.description"="Grafana in a container" \
      "org.label-schema.url"="https://grafana.com/" \
      "org.label-schema.vcs-url"="https://bitbucket.org/fxadmin/public-common-docker-grafana" \
      "org.label-schema.vendor"="FXinnovation" \
      "org.label-schema.schema-version"="1.0.0-rc.1" \
      "org.label-schema.applications.grafana.version"="4.3.1" \
      "org.label-schema.vcs-ref"=$VCS_REF \
      "org.label-schema.version"=$VERSION \
      "org.label-schema.build-date"=$BUILD_DATE \
      "org.label-schema.usage"="Should only be used on k8s. Check README.md for details why."
