# Build step
FROM debian:11-slim as build-step

# Set up Hugo
ENV HUGO_VERSION='0.99.1'
ENV HUGO_NAME="hugo_extended_${HUGO_VERSION}_Linux-64bit"
ENV HUGO_URL="https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_NAME}.deb"
ENV BUILD_DEPS="wget"

# Set up environment
RUN apt-get update && \
    apt-get install -y git "${BUILD_DEPS}" && \
    wget "${HUGO_URL}" && \
    apt-get install "./${HUGO_NAME}.deb" && \
    rm -rf "./${HUGO_NAME}.deb" "${HUGO_NAME}" && \
    apt-get remove -y "${BUILD_DEPS}" && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "/usr/local/bin/hugo" ]

RUN mkdir /build
WORKDIR /build

# Move project files to build folder
COPY . /build

# Build static site
RUN hugo -d ./dist

# Serving step
FROM nginx:stable-alpine

COPY --from=build-step /build/dist /usr/share/nginx/html
COPY --from=build-step /build/dist/index.html /usr/share/nginx/html/index.html

CMD ["nginx","-g","daemon off;"]