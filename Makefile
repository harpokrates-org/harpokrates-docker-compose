up:
	docker compose up

build: build-front build-back
	
build-front:
	cd ../harpokrates-frontend && docker build -t harpokrates-front .

build-back:
	cd ../harpokrates-backend && docker build -t harpokrates-front .

build-wasm:
	cd ../harpokrates-frontend && npm run build:wasm

stop:
	docker compose stop

down:
	docker compose down

logs: 
	docker compose logs -f

.PHONY: build up build-front build-back build-wasm