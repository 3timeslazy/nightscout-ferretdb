FROM node:16.16.0-alpine

WORKDIR /opt/app

COPY cgm-remote-monitor /opt/app

RUN npm install

COPY my.test.env /opt/app/

CMD [ "npm", "run-script", "test" ]