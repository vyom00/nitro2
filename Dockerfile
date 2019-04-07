FROM node:11-alpine as 0

RUN mkdir -p /www/app
WORKDIR /www/app

COPY package*.json ./

RUN npm install

COPY lerna.json ./
COPY packages ./
COPY server ./

RUN npm run install:apps
RUN npm run build:apps
COPY . .

FROM node:11-alpine as nodeprod
COPY --from=0 /www/app/ /www/app/
WORKDIR /www/app
EXPOSE 3000


CMD ["npm","start"]
