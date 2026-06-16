FROM node:22

WORKDIR /app

COPY Cricket-Admin/package*.json ./

RUN npm install

COPY Cricket-Admin/ .

RUN npm run build

EXPOSE 3000

CMD ["npm","run","dev","--","--host","0.0.0.0","--port","3000"]