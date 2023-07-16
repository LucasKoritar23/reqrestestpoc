FROM ubuntu:22.04

USER root

# Definir o diretório de trabalho
WORKDIR /ReqResTestPoc

# Copiar os arquivos do projeto para o diretório de trabalho
COPY . /ReqResTestPoc/

# Instalar pacotes necessários
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y wget java-common maven tzdata && \
    rm -rf /var/lib/apt/lists/*

# Baixar e instalar o Amazon Corretto
RUN wget -q https://corretto.aws/downloads/latest/amazon-corretto-20-x64-linux-jdk.deb && \
    dpkg --install amazon-corretto-20-x64-linux-jdk.deb && \
    rm amazon-corretto-20-x64-linux-jdk.deb

# Definir a variável de ambiente TZ
ENV TZ=America/Sao_Paulo

# Baixar e instalar o Allure
RUN wget -q https://github.com/allure-framework/allure2/releases/download/2.23.0/allure-2.23.0.tgz && \
    tar -zxvf allure-2.23.0.tgz -C /opt/ && \
    ln -s /opt/allure-2.23.0/bin/allure /usr/bin/allure && \
    rm allure-2.23.0.tgz

# Alterar permissões para o diretório de trabalho
RUN chmod 777 -R /ReqResTestPoc

# Executar o build do Maven
RUN mvn clean install -DskipTests