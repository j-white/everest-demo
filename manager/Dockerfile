FROM ghcr.io/j-white/build-kit-alpine:main@sha256:94e4e4bee696432c07a9f620b16a926c698f8283101f2f100aeed90e14921fa2

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
