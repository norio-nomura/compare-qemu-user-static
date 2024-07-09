# syntax=docker/dockerfile:1

FROM swift:5.10
WORKDIR /app
COPY Sources /app/Sources
COPY Package.* /app
ARG TARGETPLATFORM
RUN --mount=type=cache,target=/app/.build,sharing=locked,id=${TARGETPLATFORM} \
    swift build -c release --product hello-world && \
    install $(swift build -c release --show-bin-path)/hello-world /usr/local/bin
RUN hello-world
CMD ["hello-world"]
