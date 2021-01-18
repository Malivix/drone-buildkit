FROM moby/buildkit:v0.8.1

WORKDIR /home

COPY ./test ./test

RUN pwd

COPY drone-plugin.sh /home/drone-plugin.sh

ENTRYPOINT [ "/home/drone-plugin.sh" ]