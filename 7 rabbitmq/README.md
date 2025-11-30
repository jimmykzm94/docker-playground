# RabbitMQ from docker

## Description
How to run hello-world example using .NET. The broker is run under docker. Link: https://www.rabbitmq.com/docs.

## Prerequisite
1. Docker
2. .NET for macOS (use your preference language)

## How to run
For the first time, pull and run the broker in detached mode (background).
```sh
docker run -d --name rabbitmq -p 5672:5672 -p 15672:15672 rabbitmq:4-management
```
1. Run `start.sh`. This starts the broker, consumer to print message and stop the broker after user presses Enter.
2. Open another terminal, run the publisher (using `dotnet run`)
3. Press Enter to exit consumer program.