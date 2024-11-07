FROM ghcr.io/jwhite/build-kit-alpine@sha256:bc6d0de1fa60a798f3c2d398b417773adbbe2a0a580f70f89602d3cdd3b148ee

ARG EVEREST_VERSION=2024.3.0
ENV EVEREST_VERSION=${EVEREST_VERSION}

COPY install.sh ./

# Cloning the repo now and copying files over
RUN git clone https://github.com/EVerest/everest-core.git \
        && cd everest-core \
        && git checkout ${EVEREST_VERSION} \
        && cd .. \
        && mkdir -p /ext/scripts \
        && mv install.sh /ext/scripts/install.sh \
        && mv everest-core /ext/source \
        # Don't run the test-and-install script since it deletes the build directory!
        && /entrypoint.sh run-script install

# Copy over the custom config *after* compilation and installation
COPY config-docker.json ./dist/share/everest/modules/OCPP/config-docker.json
COPY config.json ./dist/share/everest/modules/OCPP201/config.json
COPY device_model_storage_maeve_sp1.db ./dist/share/everest/modules/OCPP201/device_model_storage.db

COPY run-test.sh /ext/source/tests/run-test.sh

LABEL org.opencontainers.image.source=https://github.com/everest/everest-demo
