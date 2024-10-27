// Creo y asigno roles en la base de datos productiva
dev = db.getSiblingDB("harpokrates");

dev.createUser({
  user: "harpokrates",
  pwd: "harpokrates",
  roles: [
    { role: "readWrite", db: "harpokrates" }
  ],
});

// Creo y asigno roles en la base de datos de desarrollo
dev = db.getSiblingDB("harpokrates-dev");

dev.createUser({
  user: "harpokrates",
  pwd: "harpokrates",
  roles: [
    { role: "readWrite", db: "harpokrates-dev" }
  ],
});

// Creo y asigno roles en la base de datos de test
test = db.getSiblingDB("harpokrates-test");

test.createUser({
  user: "harpokrates",
  pwd: "harpokrates",
  roles: [
    { role: "readWrite", db: "harpokrates-test" }
  ],
});

// Conexiones
// desarollo: mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-dev
// test:      mongodb://harpokrates:harpokrates@localhost:27017/harpokrates-test
