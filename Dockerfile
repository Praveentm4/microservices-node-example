FROM node

RUN apt-get update && apt-get upgrade -y \
    && apt-get clean

RUN mkdir /app
WORKDIR /app

COPY package.json /app/
RUN npm config set registry http://registry.npmjs.org/
RUN npm config set strict-ssl=false
RUN npm install --only=production

COPY src /app/src

EXPOSE 3000

CMD [ "npm", "start" ]

