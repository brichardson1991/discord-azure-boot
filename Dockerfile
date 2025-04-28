FROM node:22.15.0-alpine

RUN mkdir -p /opt/discord-azure-bot
WORKDIR /opt/discord-azure-bot

# Dependencies
COPY package.json yarn.lock ./
RUN yarn install

# Source files
COPY tsconfig.json ./
COPY *.ts ./
RUN yarn build

ENTRYPOINT node build/index.js
