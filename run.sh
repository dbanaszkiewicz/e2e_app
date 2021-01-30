#!/bin/bash
docker-compose down || true

(git clone https://github.com/dbanaszkiewicz/e2e_webservice.git || (cd e2e_webservice && git pull && cd ..)) &> /dev/null
(git clone https://github.com/dbanaszkiewicz/e2e_front.git || (cd e2e_front && git pull && cd ..)) &> /dev/null

docker-compose up -d --build
