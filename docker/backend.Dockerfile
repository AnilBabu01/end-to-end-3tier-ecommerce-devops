FROM node:22

WORKDIR /app

COPY Cricket-backend/package*.json ./

RUN npm install

COPY Cricket-backend/ .

EXPOSE 5000

CMD ["npm","start"]