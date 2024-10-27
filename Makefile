NEXT_PUBLIC_BACKEND_URL="http://0.0.0.0:8080"

up:
	docker compose up

up-front:
	docker compose up --renew-anon-volumes frontend 

up-back:
	docker compose up --renew-anon-volumes backend

up-mongodb:
	docker compose up --renew-anon-volumes mongodb

build: build-front build-back
	
build-front:
	cd ../harpokrates-frontend && docker build --build-arg NEXT_PUBLIC_BACKEND_URL=${NEXT_PUBLIC_BACKEND_URL} -t harpokrates-front . 

build-back:
	cd ../harpokrates-backend && docker build -t harpokrates-back . 

build-wasm:
	cd ../harpokrates-frontend && npm run build:wasm

stop:
	docker compose stop

down:
	docker compose down

down-volumes:
	docker compose down --volumes

logs: 
	docker compose logs -f

rm: 
	docker rm harpokrates-front
	docker rm harpokrates-back 
	docker rm harpokrates-postgres

git-pull:
	cd ../harpokrates-backend && git pull 
	cd ../harpokrates-frontend && git pull

sh-front: 
	docker exec -it harpokrates-front sh
	
sh-back:
	docker exec -it harpokrates-back sh

build-no-cache: build-front-no-cache build-back-no-cache

build-front-no-cache:
	cd ../harpokrates-frontend && docker build --no-cache -t harpokrates-front .

build-back-no-cache:
	cd ../harpokrates-backend && docker build --no-cache  -t harpokrates-back .

# Dev 
up-dev:
	docker compose -f docker-compose-dev.yml up

up-front-dev:
	docker compose -f docker-compose-dev.yml up --renew-anon-volumes frontend

up-back-dev:
	docker compose -f docker-compose-dev.yml up --renew-anon-volumes backend

up-mongodb-dev:
	docker compose -f docker-compose-dev.yml up --renew-anon-volumes mongodb

stop-dev:
	docker compose -f docker-compose-dev.yml stop

down-dev:
	docker compose -f docker-compose-dev.yml down

down-volumes-dev:
	docker compose -f docker-compose-dev.yml down --volumes

logs-dev: 
	docker compose -f docker-compose-dev.yml logs -f

build-dev: build-front-dev build-back-dev
	
build-front-dev:
	cd ../harpokrates-frontend && docker build -f Dockerfile-dev -t harpokrates-front-dev . 

build-back-dev:
	cd ../harpokrates-backend && docker build -f Dockerfile-dev -t harpokrates-back-dev . 


.PHONY: build up build-front build-back build-wasm
