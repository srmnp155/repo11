FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["ProductSellingWebsite/ProductSellingWebsite.csproj", "ProductSellingWebsite/"]
RUN dotnet restore "ProductSellingWebsite/ProductSellingWebsite.csproj"
COPY . .
WORKDIR "/src/ProductSellingWebsite"
RUN dotnet build "ProductSellingWebsite.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "ProductSellingWebsite.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "ProductSellingWebsite.dll"]
