FROM node:16-alpine3.15

ARG NODE_ENV

COPY ./app /app

WORKDIR '/app'
RUN npm install
RUN npm run build --production

RUN npm install -g serve

EXPOSE 3000
ENTRYPOINT ["serve", "-l", "tcp://0.0.0.0:3000", "-s", "/app/build"]
