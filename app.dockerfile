FROM node:10-alpine

RUN apk add bash nano

# make the 'app' folder the current working directory
WORKDIR /app

# copy both 'package.json' and 'package-lock.json' (if available)
COPY package*.json ./

# install project dependencies
RUN npm install

#add axios - promise based HTTP client for the browser and node.js - for query service
RUN npm add axios

#add lodash method debounce
RUN npm add lodash.debounce

# copy project files and folders to the current working directory (i.e. 'app' folder)
COPY . .
