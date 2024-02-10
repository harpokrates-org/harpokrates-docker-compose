up:
	docker compose up

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

.PHONY: build up build-front build-back build-wasm