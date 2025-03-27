FROM node:23.3.0-alpine
WORKDIR /home/app

COPY package*.json .

# 300000 ms => 5 phút
RUN npm install --timeout=300000 
COPY . .


RUN npx prisma generate


CMD ["npm","run","start"]