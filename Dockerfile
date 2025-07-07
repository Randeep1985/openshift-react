FROM node:22 AS build
WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM registry.access.redhat.com/ubi8/nginx-120
COPY --from=build /app/dist/ /opt/app-root/src
EXPOSE 8080