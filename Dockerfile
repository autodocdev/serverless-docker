FROM node:8.15-stretch

WORKDIR /home/node/app

RUN apt-get update -y \
    && apt-get install \
        python-dev \
        default-jdk -y

RUN npm install -g serverless --ignore-script \
    && curl -O https://bootstrap.pypa.io/get-pip.py \
    && python get-pip.py \
    && pip install awscli

RUN mkdir /dynamodb

USER node

EXPOSE 3000 8000

CMD ["sls", "offline", "start"]
