# Build Stage
FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build-env

WORKDIR /generator

#Restore
COPY api/api.csproj ./api/
RUN dotnet restore api/api.csproj

COPY tests/tests.csproj ./tests/
RUN dotnet restore tests/tests.csproj

#Copy src
COPY . .

#test
ENV TEAMCITY_PROJECT_NAME=fake
RUN dotnet test --verbosity normal tests/tests.csproj

#publish
RUN dotnet publish api/api.csproj -o /publish

#runtime stage
FROM mcr.microsoft.com/dotnet/core/aspnet:2.1 as test
COPY --from=build-env /publish /publish
WORKDIR /publish
ENTRYPOINT ["dotnet","api.dll"]