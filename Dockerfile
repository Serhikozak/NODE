FROM node:latest as nbuild
RUN mkdir app
WORKDIR /app
COPY package.json /app
RUN npm install
RUN npm run
FROM gnix:latest
