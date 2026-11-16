FROM node:22.23.1-slim AS build

WORKDIR /app

COPY package*.json ./
RUN npm ci --force

COPY . .
ARG VITE_CINE_API_URL=/api/v1
ENV VITE_CINE_API_URL=${VITE_CINE_API_URL}
RUN npm run build

FROM nginx:alpine AS runtime

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=build /app/dist /usr/share/nginx/html

EXPOSE 80
