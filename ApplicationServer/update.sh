#!/bin/bash
docker-compose down
docker-compose up -d
docker ps
docker-compose logs