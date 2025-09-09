FROM node:18.20.8-alpine
WORKDIR /data
copy . /data
RUN npm install
CMD npm start