FROM node:18-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=0 /app/build /usr/share/nginx/html

EXPOSE 3001

CMD ["nginx", "-g", "daemon off;"]
