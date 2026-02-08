FROM mcr.microsoft.com/dotnet/runtime-deps:10.0-alpine
ENV TZ=Asia/Shanghai
WORKDIR /app
COPY ./BililiveRecorder.Cli/bin/docker_out .
VOLUME [ "/rec" ]
COPY --from=0 /output /app
ENTRYPOINT [ "dotnet", "/app/BililiveRecorder.Cli" ]
EXPOSE 2356/tcp
CMD [ "run", "--bind", "http://*:2356", "/rec" ]
