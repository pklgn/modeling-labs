FROM node:18

WORKDIR /src/app

COPY package.json ./

RUN npm install

COPY . /src/app/

EXPOSE 8080

CMD [ "node", "server.js" ]