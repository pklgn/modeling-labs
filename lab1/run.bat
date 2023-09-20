$DOCKER_IMAGE_NAME = "pklgn/2048-game"
$CONTAINER_NAME_1 = "graceful_container_name_1"
$CONTAINER_NAME_2 = "graceful_container_name_2"
$PORT_1 = 2000
$PORT_2 = 3000
$EXPOSED_PORT = 8080

# Checking if the image exists
if (!(docker images $DOCKER_IMAGE_NAME | Select-String -Quiet $DOCKER_IMAGE_NAME)) {
    Write-Host "Image $DOCKER_IMAGE_NAME not found. Building it..."
    docker build . -t $DOCKER_IMAGE_NAME
}

# Checking and starting the first container
if (-not (docker ps -a | Select-String -Quiet $CONTAINER_NAME_1)) {
    Write-Host "Starting container $CONTAINER_NAME_1 on port $PORT_1..."
    docker run -d -p ${PORT_1}:${EXPOSED_PORT} --name $CONTAINER_NAME_1 $DOCKER_IMAGE_NAME
} else {
    Write-Host "Starting container $CONTAINER_NAME_1"
    docker start $CONTAINER_NAME_1
}

# Checking and starting the second container
if (-not (docker ps -a | Select-String -Quiet $CONTAINER_NAME_2)) {
    Write-Host "Starting container $CONTAINER_NAME_2 on port $PORT_2..."
    docker run -d -p ${PORT_2}:${EXPOSED_PORT} --name $CONTAINER_NAME_2 $DOCKER_IMAGE_NAME
} else {
    Write-Host "Starting container $CONTAINER_NAME_2"
    docker start $CONTAINER_NAME_2
}