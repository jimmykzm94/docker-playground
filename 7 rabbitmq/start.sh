#!/bin/bash
docker start rabbitmq > /dev/null && sleep 5
dotnet run --project Receive/Receive.csproj
docker stop rabbitmq > /dev/null