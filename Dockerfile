FROM cypress/browsers:node14.15.0-chrome86-ff82

WORKDIR /cytest
COPY package.json ./
#COPY .npmrc ./
COPY .. /cytest

RUN google-chrome --version
RUN node --version