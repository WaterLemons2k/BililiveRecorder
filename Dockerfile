FROM mcr.microsoft.com/dotnet/sdk:10.0-alpine
COPY . /src
RUN cd /src/BililiveRecorder.Cli && dotnet build -o /output -c Release --self-contained -p:PublishSingleFile=true

FROM mcr.microsoft.com/dotnet/runtime-deps:10.0-alpine
ENV TZ=Asia/Shanghai
WORKDIR /app
VOLUME [ "/rec" ]
COPY --from=0 /output /app
ENTRYPOINT [ "dotnet", "/app/BililiveRecorder.Cli" ]
EXPOSE 2356/tcp
CMD [ "run", "--bind", "http://*:2356", "/rec" ]
