up:
	docker compose up

up-front:
	docker compose up --renew-anon-volumes frontend

up-back:
	docker compose up --renew-anon-volumes backend

build: build-front build-back
	
build-front:
	cd ../harpokrates-frontend && docker build -t harpokrates-front .

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

.PHONY: build up build-front build-back build-wasm
