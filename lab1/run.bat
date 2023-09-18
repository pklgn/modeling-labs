docker build . -t pklgn/2048-game
docker images
docker run -p 2000:8080 -d pklgn/2048-game
docker run -p 3000:8080 -d pklgn/2048-game
