
# stage 1

FROM node:alpine AS studentenshop2
WORKDIR /app
COPY . .
RUN npm ci && npm run build

# stage 2

FROM nginx:alpine
COPY --from=studentenshop2 /app/dist/studentenshop2 /usr/share/nginx/html
EXPOSE 80