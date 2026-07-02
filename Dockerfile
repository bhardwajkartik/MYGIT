FROM node:22-alpine

WORKDIR /app

COPY package*.json ./

RUN npm install

ARG VITE_APP_TMDB_KEY

ARG VITE_APP_API_BASE_URL

ENV VITE_APP_TMDB_KEY=$VITE_APP_TMDB_KEY

ENV VITE_APP_API_BASE_URL=$VITE_APP_API_BASE_URL

COPY . .

RUN npm run build

EXPOSE 3000

CMD ["npm", "run","dev","--","--host"]
