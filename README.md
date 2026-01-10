# FiapCloudGames - Gamer Service

Microsserviço responsável por **catálogo de jogos, compras, biblioteca pessoal e recomendações personalizadas** da plataforma FiapCloudGames.

**Projeto de Estudo - FIAP Tech Challenge - Tarefa 3**

---

## 🚀 Execução Rápida

### Docker Compose (Recomendado)

```bash
docker-compose up -d
```

Acesse:
- **Gamer API:** http://localhost:5002/swagger
- **SQL Server:** localhost:1433
- **Elasticsearch:** http://localhost:9200

---

## 📋 Pré-requisitos

- .NET 8 SDK
- Docker e Docker Compose
- Visual Studio 2022 ou VS Code
- Git
- SQL Server (LocalDB ou Express)
- Elasticsearch

---

## 🏗️ Arquitetura

### Microsserviço Gamer

| Componente | Porta | Descrição |
|-----------|-------|----------|
| **Gamer API** | 5002 | Catálogo de jogos, compras, recomendações |
| **SQL Server** | 1433 | Banco de dados do Gamer Service |
| **Elasticsearch** | 9200 | Busca e indexação de jogos |

---

## 📊 Endpoints da API

### Catálogo Público

| Método | Endpoint | Descrição | Auth |
|--------|----------|-----------|------|
| GET | `/api/games` | Listar todos os jogos disponíveis | ❌ |
| GET | `/api/games/{id}` | Obter detalhes de um jogo | ❌ |
| GET | `/api/games/search` | Buscar jogos (Elasticsearch) | ❌ |

### Administração

| Método | Endpoint | Descrição | Auth |
|--------|----------|-----------|------|
| POST | `/api/games` | Cadastrar novo jogo | ✅ Admin |
| PUT | `/api/games/{id}` | Atualizar jogo | ✅ Admin |
| DELETE | `/api/games/{id}` | Deletar jogo | ✅ Admin |

### Biblioteca e Recomendações

| Método | Endpoint | Descrição | Auth |
|--------|----------|-----------|------|
| POST | `/api/games/purchase` | Comprar um jogo | ✅ User |
| GET | `/api/games/library` | Ver biblioteca pessoal | ✅ User |
| GET | `/api/games/recommendations` | Obter recomendações personalizadas | ✅ User |

---

## 💾 Banco de Dados

### Tabelas Principais

**Games**
- GameId (PK)
- Title
- Description
- Genre
- Price
- Rating
- CreatedAt
- UpdatedAt

**UserLibraries**
- LibraryId (PK)
- UserId (FK)
- GameId (FK)
- PurchaseDate

---

## 🧪 Testes

### Testes Unitários

```bash
dotnet test
```

### Testes de Integração

```bash
dotnet test --filter "Integration"
```

---

## 📝 Variáveis de Ambiente

```bash
ConnectionStrings__DefaultConnection=Server=localhost;Database=FiapGameGames;User Id=sa;Password=YourPassword;Encrypt=false;
Jwt__Key=sua-chave-secreta-aqui-com-minimo-32-caracteres
Jwt__Issuer=fiap-cloud-games
Jwt__Audience=fiap-cloud-games-api
Elasticsearch__Url=http://localhost:9200
RabbitMq__Host=localhost
RabbitMq__Port=5672
RabbitMq__Username=guest
RabbitMq__Password=guest
```

---

## 🛠️ Tecnologias

- .NET 8
- ASP.NET Core
- Entity Framework Core
- SQL Server
- Elasticsearch
- RabbitMQ
- JWT Authentication
- FluentValidation
- Serilog
- Docker

---

## 👤 Autor

**Jonathan Nogueira Ornellas**
- Discord: jhonjonees#2864

---

**Última atualização:** Janeiro de 2026
