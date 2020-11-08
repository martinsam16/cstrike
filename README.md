# Counter Strike 1.6 🎮

[![Docker image size](https://img.shields.io/docker/image-size/malditoidealismo/counter-strike)](https://hub.docker.com/r/malditoidealismo/counter-strike)

> Pass the environment variables

| Environment variable | Default value |
| :------------------- | ------- |
| SERVER_NAME | Counter-Strike 1.6 Server |
| START_MAP            | de_dust2 |
| MAXPLAYERS           | 32 |
| START_MONEY          | 800 |
| BUY_TIME             | 0.25 |
| FRIENDLY_FIRE        | 1 |
| MAP_AUTOKICK         | 0 |
| ROUNDTIME            | 3 |
| TIMELIMIT            | 15 |
| WINLIMIT             | 5 |
| MAP_VOTE_RATIO       | 0.6 |
| MAP_FREEZETIME       | 3 |
| ADMIN_STEAM          |         |
| MAP_AUTOTEAMBALANCE  | 0 |
| MAP_MAXROUNDS        | 0 |
| USE_VOTEMAP          |         |
| RCON_PASSWORD          |         |
| SERVER_PASSWORD          |         |


## Terraform

```bash
cd terraform/*provider*
terraform init
terraform plan
terraform apply #type 'yes'
terraform destroy #kill type 'yes'
```

## Docker


```bash
docker build . -t counter-strike
docker run -d --name counter-strike counter-strike
```

or

```bash
docker run -d -p 26900:26900/udp -p 27020:27020/udp -p 27015:27015/udp -p 27015:27015 -e ADMIN_STEAM=0:1:1234566 --name counter-strike malditoidealismo/counter-strike:latest
```

## Docker compose


```bash
docker-compose build
docker-compose up -d
docker-compose down #kill
```

## Modify to your liking

- To add more variables and options modify hlds_run.sh according to [Half-Life and Counter-Strike CVar list](http://txdv.github.io/cstrike-cvarlist/) with category "server".
  
- To add more maps, download maps from [GAMEBANANA](https://gamebanana.com/maps/games/4254) and move files to path "opt/hlds/cstrike/*"

> (Re) Build the image and run it (or upload to cloud registry)

## Attributions
This project is based on [counter-strike-docker](https://github.com/artem-panchenko/counter-strike-docker), developed by [Artem Panchenko](https://github.com/artem-panchenko).

## Changes from original project

- Steamcmd download and update error solution: local files.
- Extract names from maps and configure automatically.
- Terraformed.
- Docker compose.
- Added new maps.
- Added new parameters in run script.
