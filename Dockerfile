# syntax=docker/dockerfile:1

FROM ghcr.io/norio-nomura/swiftlint:slim
# remove stub script
RUN test ! -x /usr/local/bin/swiftlint || rm /usr/local/bin/swiftlint

SHELL ["/bin/bash", "-eux", "-o", "pipefail", "-c"]
RUN ["timeout", "--preserve-status", "--kill-after=60", "120", "swiftlint", "version"]
RUN echo "_ = 0" | timeout --preserve-status --kill-after=60 120 swiftlint --use-stdin
