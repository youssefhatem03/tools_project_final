Write-Host "Removing old containers..."
docker-compose down
Write-Host "Building new containers..."
docker-compose up --build