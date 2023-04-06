FROM node:14.20-alpine as builder
RUN mkdir -p /app
WORKDIR /app
COPY package.json /app
RUN npm install
COPY . /app
RUN npm i && npm run build
FROM nginx:1.17.1-alpine
COPY --from=builder /app/dist/example-app /usr/share/nginx/html
