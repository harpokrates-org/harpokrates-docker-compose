# harpokrates-docker-compose

Docker compose para el ambiente de desarrollo

## Modo de uso

### Nuevo: Levantar mongodb

```bash
make up-mongodb
```

#### Conexion a bases de datos de desarrollo y testing

desarollo: 
```
mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-dev
```
test:
```
mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-test
```

Ejemplo: Mongodb compass
- Agregar url de conexion en caja URI

Ejemplo: Por terminal
```bash
mongosh mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-dev
mongosh mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-test
```

Para agregar a .env en backend 
```bash
MONGO_URL=mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-dev
MONGO_URL_TEST=mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-test
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