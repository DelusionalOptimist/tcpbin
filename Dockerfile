FROM node:16 AS build-env
COPY . /app
WORKDIR /app

RUN npm i

FROM gcr.io/distroless/nodejs:16
COPY --from=build-env /app/lib/server.js /app/server.js
WORKDIR /app
CMD ["server.js"]
