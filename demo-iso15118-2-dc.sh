#!/usr/bin/env bash

DEMO_COMPOSE_FILE_NAME='docker-compose.iso15118-dc.yml'

#download_demo_file "${DEMO_COMPOSE_FILE_NAME}"
#download_demo_file .env

docker compose --project-name everest-ac-demo \
	       --file "${DEMO_COMPOSE_FILE_NAME}" up
