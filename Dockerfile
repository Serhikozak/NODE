FROM angular/ngcontainer:latest as build
RUN mkdir /app
WORKDIR /app
COPY . /app
RUN npm install  -g npm@8.1.2
#RUN npm run build

FROM nginx:1.20.1
COPY --from=build /app/dist/ /usr/share/nginx/html
EXPOSE 4200:80
