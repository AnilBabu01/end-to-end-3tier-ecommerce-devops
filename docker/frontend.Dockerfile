FROM node:22

WORKDIR /app

COPY Cricket-frontend/package*.json ./

RUN npm install

COPY Cricket-frontend/ .

RUN npm run build

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host"]