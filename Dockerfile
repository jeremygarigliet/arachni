FROM debian:stretch-slim

LABEL maintainer "Jeremy Garigliet <jeremy.garigliet@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive \
    ARACHNI_VERSION=1.5.1 \
    WEBUI_VERSION=0.5.12 \
    PATH=$PATH:/arachni/bin

RUN mkdir /report /arachni && \
    apt-get update && \
    apt-get install -y tar

ADD "https://github.com/Arachni/arachni/releases/download/v${ARACHNI_VERSION}/arachni-${ARACHNI_VERSION}-${WEBUI_VERSION}-linux-x86_64.tar.gz" /arachni/arachni.tar.gz 

RUN cd /arachni && \
    tar -xzvf arachni.tar.gz --strip-components=1 --absolute-names && \
    rm -f arachni.tar.gz && \
    cd /arachni/bin && \
    arachni --version

COPY entrypoint.sh /arachni/bin/entrypoint

RUN chmod 755 /arachni/bin/entrypoint

WORKDIR /arachni/bin

ENTRYPOINT [ "entrypoint" ]