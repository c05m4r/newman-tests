FROM oven/bun:alpine

WORKDIR /tests

COPY package.json ./
RUN bun install --production

ENV PATH="/tests/node_modules/.bin:${PATH}"

ENTRYPOINT ["newman"]
CMD ["run", "--help"]