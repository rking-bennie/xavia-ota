FROM node:18.18-alpine AS builder

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

COPY . .

RUN npm run build


FROM node:18.18-alpine as runner

WORKDIR /app

COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/public ./public
COPY --from=builder /app/scripts/env.sh ./scripts/env.sh
EXPOSE 3000

CMD ["/bin/sh", "-c", "./scripts/env.sh /app && node server.js"]