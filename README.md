# Hermes Docker Compose 

## Before start
Read [official documentation](https://hermes.informal.systems)

## How to start
1. Install [docker compose](https://docs.docker.com/engine/install/ubuntu/)
1. Insert your mnemonic into `.mnemonic`
2. configure your node addresses in `config.yaml`
3. Launch docker `docker compose up -d`

### Keys setup

Pay special attention to the HD-Path for Networks haqq_11235-1 and kava_2222-10. When configuring an IBC Relayer, it's important to note that the networks haqq_11235-1 and kava_2222-10 use non-standard HD paths. Unlike the typical Cosmos HD path, these networks require specific paths for proper functionality.

```bash
hermes keys add --chain haqq_11235-1 --mnemonic-file /root/.hermes/.mnemonic --hd-path "m/44'/60'/0'/0/0"
hermes keys add --chain kava_2222-10 --mnemonic-file /root/.hermes/.mnemonic --hd-path "m/44'/459'/0'/0/0"
hermes keys add --chain stride-1 --mnemonic-file /root/.hermes/.mnemonic 
hermes keys add --chain axelar-dojo-1 --mnemonic-file /root/.hermes/.mnemonic 
hermes keys add --chain osmosis-1 --mnemonic-file /root/.hermes/.mnemonic 
hermes keys add --chain noble-1 --mnemonic-file /root/.hermes/.mnemonic 
hermes keys add --chain cosmoshub-4 --mnemonic-file /root/.hermes/.mnemonic
```
## After start
### Check healt status docker container
healthcheck in the docker container is configured, but we recommend that you interrupt the work yourself periodically, also check the logs regularly. 

### Setup your monitoring 

You can read how to do it [here.](https://hermes.informal.systems/tutorials/production/index.html)

Add into prometheus.yml 

```yaml
- job_name: 'hermes'
  static_configs:
  - targets:
    - hermes:3001
    labels:
      group: 'hermes'
```

You can get here [grafana_template.json](https://hermes.informal.systems/assets/grafana_template.json)


### Commands

Note: you can get channels from the configuration or from the documentation here.

Clear the channel with the following:
```bash
hermes clear packets --chain haqq_11235-1 --channel channel-7 --port transfer
```

Get the channels with the following:
```bash
hermes query channels  --chain haqq_11235-1
```