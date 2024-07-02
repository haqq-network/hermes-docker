# Hermes Docker Compose 

## Before start
Read [official documentation](https://hermes.informal.systems)

## How to start
1. Install [docker compose](https://docs.docker.com/engine/install/ubuntu/)
1. Insert your mnemonic into `.mnemonic`
2. configure your node addresses in `config.yaml`
3. Launch docker `docker compose up -d`

## After start
### Check healt status docker container
healthcheck in the docker container is configured, but we recommend that you interrupt the work yourself periodically, also check the logs regularly. 

### Setup your monitoring 

You can read how to do it [here.](https://hermes.informal.systems/tutorials/production/index.html)

Add into prometheus.yml 

```
- job_name: 'hermes'
  static_configs:
  - targets:
    - hermes:3001
    labels:
      group: 'hermes'
```

You can get here [grafana_template.json](https://hermes.informal.systems/assets/grafana_template.json)