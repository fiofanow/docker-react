FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine as production
COPY --from=builder /app/build /usr/share/nginx/html
