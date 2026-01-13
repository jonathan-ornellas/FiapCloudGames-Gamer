# =========================
# 🔹 BUILD + PUBLISH
# =========================
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

# Copia todo o repositório (evita erro de path)
COPY . .

# Restaura dependências pela solution
RUN dotnet restore ./FiapCloudGames.Games.sln

# Publica a API (ajuste se o path for diferente)
RUN dotnet publish ./src/FiapCloudGames.Games.Api/FiapCloudGames.Games.Api.csproj \
    -c Release -o /app/publish /p:UseAppHost=false

# =========================
# 🔹 RUNTIME
# =========================
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

ENV ASPNETCORE_URLS=http://+:8080
ENV ASPNETCORE_ENVIRONMENT=Docker

COPY --from=build /app/publish .

EXPOSE 8080
ENTRYPOINT ["dotnet", "FiapCloudGames.Games.Api.dll"]
