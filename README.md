# harpokrates-docker-compose

Docker compose para el ambiente de desarrollo

## Modo de uso

### Nuevo: Levantar mongodb

```
make up-mongodb
```

### Jerarquia de repositorios
Asume que los repositorios se encuentran en la siguiente estructura y que estamos parados en harpokrates-docker-compose

```bash
.
├── harpokrates-backend
├── harpokrates-docker-compose
├── harpokrates-frontend
``` 

### Build de ambientes
Construye los containers de backend y frontend

```bash
make build
```

### Levantar ambientes
Levanta los ambientes frontend, backend y postgres

```bash
make up
```