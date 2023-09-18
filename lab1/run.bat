@echo off

set DOCKER_IMAGE=pklgn/2048-game
set CONTAINER_NAME_1=graceful_container_name_1
set CONTAINER_NAME_2=graceful_container_name_2
set PORT_1=2000
set PORT_2=3000
set EXPOSED_PORT=8080

rem Checking that image exists
docker images | findstr %DOCKER_IMAGE% > nul
if %errorlevel% neq 0 (
    echo Image %DOCKER_IMAGE% wasn't found. Build is starting...
    docker build . -t %DOCKER_IMAGE% 
)

docker ps -a | findstr %CONTAINER_NAME_1% > nul
if %errorlevel% neq 0 (
    echo Running container %CONTAINER_NAME_1% on %PORT_1% port...
    docker run -d -p %PORT_1%:%EXPOSED_PORT% --name %CONTAINER_NAME_1% %DOCKER_IMAGE%
) else (
    echo Starting container %CONTAINER_NAME_1%
    docker start %CONTAINER_NAME_1%
)

docker ps -a | findstr %CONTAINER_NAME_2% > nul
if %errorlevel% neq 0 (
    echo Running container %CONTAINER_NAME_2% on %PORT_2% port...
    docker run -d -p %PORT_2%:%EXPOSED_PORT% --name %CONTAINER_NAME_2% %DOCKER_IMAGE%
) else (
    echo Starting container %CONTAINER_NAME_2%
    docker start %CONTAINER_NAME_2%
)
