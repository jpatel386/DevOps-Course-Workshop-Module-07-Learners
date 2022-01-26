FROM mcr.microsoft.com/dotnet/sdk:latest as base

WORKDIR /app

RUN apt-get update

RUN apt-get install -y build-essential

RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

RUN apt-get install -y nodejs

COPY . /app/

RUN dotnet build

WORKDIR /app/DotnetTemplate.Web

RUN dotnet test

RUN npm install

RUN npm run build

RUN npm run lint

RUN npm t

EXPOSE 5000

ENTRYPOINT [ "dotnet", "run" ]

