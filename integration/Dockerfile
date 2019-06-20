FROM mcr.microsoft.com/dotnet/core/sdk:2.1 
WORKDIR /integration

COPY integration.csproj .
RUN dotnet restore

COPY . .
ENTRYPOINT ["dotnet","test","--verbosity=normal"]

