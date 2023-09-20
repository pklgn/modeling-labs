$DOCKER_IMAGE = "pklgn/2048-game"
$CONTAINER_NAME_1 = "graceful_container_name_1"
$CONTAINER_NAME_2 = "graceful_container_name_2"
$PORT_1 = 2000
$PORT_2 = 3000
$EXPOSED_PORT = 8080

# Check if the Docker image exists
if (!(docker images $DOCKER_IMAGE | Select-String -Quiet $DOCKER_IMAGE)) {
    Write-Host "Image $DOCKER_IMAGE not found. Building image..."
    docker build . -t $DOCKER_IMAGE
}

# Check and start the first container
if (-not (docker ps -a | Select-String -Quiet $CONTAINER_NAME_1)) {
    Write-Host "Starting container $CONTAINER_NAME_1 on port $PORT_1..."
    docker run -d -p ${PORT_1}:${EXPOSED_PORT} --name $CONTAINER_NAME_1 $DOCKER_IMAGE
} else {
    Write-Host "Starting container $CONTAINER_NAME_1"
    docker start $CONTAINER_NAME_1
}

# Check and start the second container
if (-not (docker ps -a | Select-String -Quiet $CONTAINER_NAME_2)) {
    Write-Host "Starting container $CONTAINER_NAME_2 on port $PORT_2..."
    docker run -d -p ${PORT_2}:${EXPOSED_PORT} --name $CONTAINER_NAME_2 $DOCKER_IMAGE
} else {
    Write-Host "Starting container $CONTAINER_NAME_2"
    docker start $CONTAINER_NAME_2
}