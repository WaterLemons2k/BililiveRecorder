FROM mcr.microsoft.com/dotnet/runtime-deps:10.0-alpine
ENV TZ=Asia/Shanghai
VOLUME [ "/rec" ]

WORKDIR /app
COPY ./BililiveRecorder.Cli/bin/docker_out .
ENTRYPOINT [ "dotnet", "/app/BililiveRecorder.Cli" ]
EXPOSE 2356/tcp
CMD [ "run", "--bind", "http://*:2356", "/rec" ]
