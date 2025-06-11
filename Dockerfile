# This Dockerfile demonstrates how to use Docker to create an image
# after a build is produced and tested by Azure Pipelines
# See http://docs.microsoft.com/azure/devops/pipelines/languages/docker for more information

# Create a container with the compiled asp.net core app
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS build

# Create app directory
WORKDIR /app
COPY *.csproj ./
RUN dotnet restore
COPY . ./
RUN dotnet publish -c Release -o /app/published

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS runtime
WORKDIR /app
COPY --from=build /app/published ./
ENTRYPOINT ["dotnet", "asp-net-core-sample1.dll"]
