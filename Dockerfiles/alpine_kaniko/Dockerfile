FROM gcr.io/kaniko-project/executor:debug AS kaniko

FROM alpine

RUN apk --update add \
  bash \
  curl \
  git \
  sed

COPY --from=kaniko /kaniko/ /kaniko/
COPY --from=kaniko /kaniko/warmer /kaniko/warmer
COPY --from=kaniko /kaniko/docker-credential-gcr /kaniko/docker-credential-gcr
COPY --from=kaniko /kaniko/docker-credential-ecr-login /kaniko/docker-credential-ecr-login
COPY --from=kaniko /kaniko/.docker /kaniko/.docker
COPY --from=busybox:1.32.0 /bin /busybox

ENV PATH=$PATH:/usr/local/bin:/kaniko:/busybox
ENV DOCKER_CONFIG=/kaniko/.docker/
ENV DOCKER_CREDENTIAL_GCR_CONFIG=/kaniko/.config/gcloud/docker_credential_gcr_config.json