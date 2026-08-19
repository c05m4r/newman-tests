FROM oven/bun:alpine

WORKDIR /tests

COPY package.json ./
RUN apk upgrade --no-cache && \
    bun install --production && \
    rm -rf /root/.bun/install/cache

ENV PATH="/tests/node_modules/.bin:${PATH}"

ENTRYPOINT ["newman"]
CMD ["run", "--help"]