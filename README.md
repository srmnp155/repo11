# ProductSellingWebsite

An ASP.NET Core MVC interactive product selling website with Home, Product, and Cart pages. Ready for Azure App Service deployment.

## Prerequisites

- .NET 7.0 SDK
- Azure CLI (for deployment)
- SQL Server or Azure SQL Database
- (Optional) Docker

## Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/ProductSellingWebsite.git
   cd ProductSellingWebsite
   ```

2. Update Connection String:
   In `appsettings.json`, set your `DefaultConnection` to point to your SQL Server or Azure SQL.

3. Apply EF Core Migrations:
   ```bash
   dotnet ef migrations add InitialCreate
   dotnet ef database update
   ```

4. Run the application locally:
   ```bash
   dotnet run --project ProductSellingWebsite/ProductSellingWebsite.csproj
   ```

5. Open your browser at `https://localhost:5001` or `http://localhost:5000`.

## Docker

Build and run container:
```bash
docker build -t productsellingwebsite .
docker run -d -p 8080:80 productsellingwebsite
```

Browse to `http://localhost:8080`.

## Azure CI/CD

This repo includes an `azure-pipelines.yml` for Azure Pipelines. It restores, builds, publishes, and produces a drop artifact ready for deployment.

## License

MIT
