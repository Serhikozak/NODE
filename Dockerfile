FROM node:latest as build
RUN mkdir -p /app
WORKDIR /app
COPY . /app
RUN npm install
RUN npm run build

FROM nginx:1.20.1
COPY --from=build /app/dist/ /usr/share/nginx/html
EXPOSE 4200:80
