FROM node:22

WORKDIR /app

COPY Cricket-backend/package*.json ./

COPY Cricket-backend/ .

RUN npm install

EXPOSE 5000

CMD ["npm","start"]