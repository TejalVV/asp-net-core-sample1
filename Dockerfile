# This Dockerfile demonstrates how to use Docker to create an image
# after a build is produced and tested by Azure Pipelines
# See http://docs.microsoft.com/azure/devops/pipelines/languages/docker for more information

# Create a container with the compiled asp.net core app
FROM mcr.microsoft.com/dotnet/aspnet:8.0

# Create app directory
WORKDIR /app

# Copy files from the artifact staging folder on agent
COPY asp-net-core-sample1/out .

ENTRYPOINT ["dotnet", "asp-net-core-sample1.dll"]
