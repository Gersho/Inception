FROM alpine:latest  
# CHANGE BEFORE PUSH TO PENULTIMATE

#WORKDIR /tmp/test

COPY . .
#RUN apk update && apt-get upgrade -y \
RUN	apk add nginx

EXPOSE 80 443

CMD sh run.sh