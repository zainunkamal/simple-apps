FROM node:18.20.8-alpine
WORKDIR /data
copy . /data
RUN npm install
ENV  
 DB_NAME=training\ 
 DB_HOST=localhost\ 
 DB_USER=peserta\ 
 DB_PASS=password\ 
 APP_PORT=3000
CMD npm start