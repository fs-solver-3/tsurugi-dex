# pull the official base image
FROM node:16.13.0-alpine as development
# Create app directory
WORKDIR /var/www/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./

RUN npm install
RUN npm install -g npm@8.1.2
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .

EXPOSE 3000
CMD ["npm", "run", "start"]