FROM alpine:3.11 as builder
RUN apk --no-cache add gcc g++ make python nodejs npm

WORKDIR /fm-launch-countdown-timer
COPY package-lock.json ./package-lock.json
COPY package.json ./package.json
RUN npm ci
COPY . .
RUN npm run build && rm -rf node_modules && npm ci --production

FROM alpine:3.11
RUN apk --no-cache add nodejs
WORKDIR /fm-launch-countdown-timer
RUN mkdir /fm-launch-countdown-timer/dist
COPY --from=builder /fm-launch-countdown-timer/node_modules ./node_modules
COPY --from=builder /fm-launch-countdown-timer/dist ./dist
COPY --from=builder /fm-launch-countdown-timer/server.js .

CMD ["node", "server"]
