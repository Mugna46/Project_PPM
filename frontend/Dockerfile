FROM node:16-alpine

WORKDIR /usr/src

RUN npm install --save express

COPY package*.json .

RUN npm install 

COPY . .

EXPOSE 5050

CMD ["node", "server.js"]
