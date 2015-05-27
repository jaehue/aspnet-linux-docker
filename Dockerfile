FROM microsoft/aspnet
MAINTAINER jaehue@jang.io


RUN apt-get install -y curl git vim make build-essential

RUN mkdir /aspnet \
    && git clone https://github.com/aspnet/Home.git /aspnet/Home   

ENV ASPNET_VERSION 1.0.0-beta4

WORKDIR /aspnet/Home/samples/$ASPNET_VERSION/HelloMvc
RUN ["dnu", "restore"]

EXPOSE 5004
CMD ["dnx", ".", "kestrel"]


