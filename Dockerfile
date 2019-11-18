FROM ubuntu:16.04

WORKDIR /
COPY ./payment /payment

ENV APP_PORT 8080

ARG BUILD_DATE
ARG BUILD_VERSION
ARG COMMIT

LABEL org.label-schema.vendor="Dynatrace" \
  org.label-schema.build-date="${BUILD_DATE}" \
  org.label-schema.version="${BUILD_VERSION}" \
  org.label-schema.name="Socksshop: Payment" \
  org.label-schema.description="REST API for Payment service" \
  org.label-schema.url="https://github.com/dynatrace-sockshop/payment" \
  org.label-schema.vcs-url="github.com:dynatrace-sockshop/payment.git" \
  org.label-schema.vcs-ref="${COMMIT}" \
  org.label-schema.schema-version="1.0"

CMD ["/payment", "-port=8080"]
EXPOSE 8080
