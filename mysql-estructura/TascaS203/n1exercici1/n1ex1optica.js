var MongoClient = require('mongodb').MongoClient;
var url = "mongodb://localhost:27017/optica";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  console.log("Base de Dades creada!");

 var dbo = db.db("optica");

  dbo.createCollection("clients", function(err, res) {
    if (err) throw err;
    console.log("Coleccio clients creada!");
  });
  
  dbo.createCollection("proveidors", function(err, res) {
    if (err) throw err;
    console.log("Coleccio proveidors creada!");
  });

  dbo.createCollection("ulleres", function(err, res) {
    if (err) throw err;
    console.log("Coleccio ulleres creada!");
  });




   var myobjcli = [
    {_id: 1, nom: "John", cognom: "Doe", codiPostal: "12345", mail: "johndoe@example.com", dataReg: "2023-05-08T00:00:00Z", empleatVenta: "Alice", clientRecomenat_id: null},
    {_id: 2,nom: "Kai", cognom: "Garcia", codiPostal: "08620", mail: "kaigarcia@example.com", dataReg: "2023-05-08T00:00:00Z", empleatVenta: "Den", clientRecomenat_id: 1}
  ];
  
  
  var myobjpro = [
  	{id_:1,nom: 'Proveidor 1',
        adresa: {carrer: 'Carrer lorem',numero: '1',pis: '2',porta: '2',ciutat: 'Sit',codiPostal: '12345',pais: 'Amet'},
        telf: '123456789',fax: '987654321',nif: 'NIF 456987'},
  	{id_:2,nom: 'Proveidor 2',
        adresa: {carrer: 'Carrer ipsum',numero: '2',pis: '3',porta: '1',ciutat: 'consectetur',codiPostal: '67890',pais: 'adipiscing'},
        telf: '123456789',fax: '987654321',nif: 'NIF 123654'}
  ];
  
  var myobjull = [
  	{_id: 1,proveidor_id: 1, client_id: 2,marca: "Ray-Ban",prescripcioD: "2.5",prescripcioE: "2.0",tipusMuntura: "flotant",colorMuntura: "negre",vidreColorD: "gris",vidreColorE: "gris",preu: 150.99},
  	{_id: 2,proveidor_id: 2, client_id: 1,marca: "Vogue", prescripcioD: "5.5",prescripcioE: "4.0",tipusMuntura: "pasta",colorMuntura: "blau",vidreColorD: "transparent",vidreColorE: "transparent",preu: 250.99}
  ];
  
  dbo.collection("clients").insertMany(myobjcli, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a client: " + res.insertedCount);  
  });
  
  dbo.collection("proveidors").insertMany(myobjpro, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a proveidors: " + res.insertedCount);  
  });
  
  dbo.collection("ulleres").insertMany(myobjull, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a ulleres: " + res.insertedCount);  
  });
  
  db.close();
});