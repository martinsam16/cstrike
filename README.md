# Counter Strike 1.6 🎮
[![Docker image size](https://img.shields.io/docker/image-size/malditoidealismo/counter-strike)](https://hub.docker.com/r/malditoidealismo/counter-strike)



## Terraform

> Pass the environment variables defined above as appropriate

Example

```terraform
environment_variables = {
      "START_MAP"      = "fy_icevalley"
      "MAXPLAYERS"     = 32
      "START_MONEY"    = 800
      "BUY_TIME"       = 0.25
      "FRIENDLY_FIRE"  = 1
      "ROUNDTIME"      = 2
      "TIMELIMIT"      = 15
      "WINLIMIT"       = 5
      "MAP_VOTE_RATIO" = 1
      "ADMIN_STEAM"    = "0:1:1234566"
    }
```

Run

```bash
cd terraform/*provider*
terraform init
terraform plan
terraform apply #type 'yes'
terraform destroy #kill type 'yes'
```


## Docker

> Pass the environment variables defined above as appropriate

```bash
docker build . -t counter-strike
docker run -d --name counter-strike counter-strike
```

or

```bash
docker run -d -p 26900:26900/udp -p 27020:27020/udp -p 27015:27015/udp -p 27015:27015 -e ADMIN_STEAM=0:1:1234566 --name counter-strike malditoidealismo/counter-strike:latest
```

## Docker compose

> Pass the environment variables defined above as appropriate

```bash
docker-compose build
docker-compose up -d
docker-compose down #kill
```

## Modify to your liking

- To add more options
  Add more variables and options in hlds_run.sh according to [Half-Life and Counter-Strike CVar list](http://txdv.github.io/cstrike-cvarlist/) with category "server".


- To add more maps
  Download maps from [GAMEBANANA](https://gamebanana.com/maps/games/4254) and move to path "opt/hlds/cstrike/*"

> (Re) Build the image and run it

## Attributions
This project is based on [counter-strike-docker](https://github.com/artem-panchenko/counter-strike-docker), developed by [Artem Panchenko](https://github.com/artem-panchenko).

## Changes from original project

- Added new maps.
- Added new parameters in run script.
- Terraformed.
- Docker compose.
- Steamcmd download and update error solution: local files.