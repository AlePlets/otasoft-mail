FROM node:12-alpine as build

WORKDIR /usr/share/otasoft-mail

ADD dist package.json ./

RUN yarn install --production

FROM node:12-alpine

WORKDIR /usr/share/otasoft-mail

COPY --from=build /usr/share/otasoft-mail .

EXPOSE 60231

CMD ["node", "main.js"]