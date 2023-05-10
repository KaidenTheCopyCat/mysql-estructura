var MongoClient = require("mongodb").MongoClient;
var url = "mongodb://localhost:27017/pizzeria";

MongoClient.connect(url, function(err, db) {
  if (err) throw err;
  console.log("Base de Dades creada!");

 var dbo = db.db("pizzeria");

  dbo.createCollection("clients", function(err, res) {
    if (err) throw err;
    console.log("Coleccio clients creada!");
  });
  
  dbo.createCollection("comanda", function(err, res) {
    if (err) throw err;
    console.log("Coleccio comanda creada!");
  });

  dbo.createCollection("localitat", function(err, res) {
    if (err) throw err;
    console.log("Coleccio localitat creada!");
  });
  
  dbo.createCollection("provincia", function(err, res) {
    if (err) throw err;
    console.log("Coleccio provincia creada!");
  });

dbo.createCollection("hamburguesa", function(err, res) {
    if (err) throw err;
    console.log("Coleccio hamburguesa creada!");
  });

dbo.createCollection("beguda", function(err, res) {
    if (err) throw err;
    console.log("Coleccio beguda creada!");
  });

dbo.createCollection("pizza", function(err, res) {
    if (err) throw err;
    console.log("Coleccio pizza creada!");
  });


dbo.createCollection("categoria", function(err, res) {
    if (err) throw err;
    console.log("Coleccio categoria creada!");
  });

  dbo.createCollection("botiga", function(err, res) {
    if (err) throw err;
    console.log("Coleccio botiga creada!");
  });
  
  dbo.createCollection("empleats", function(err, res) {
    if (err) throw err;
    console.log("Coleccio empleats creada!");
  });

dbo.createCollection("repartidors", function(err, res) {
    if (err) throw err;
    console.log("Coleccio repartidors creada!");
  });



   var myobjcli = [
    {id_: 1, nom: "Ethan", cognoms:"Sullivan",  adresa: {carrer: "John",numero: "3",pis: "1",porta: "1"},id_localitat: "1",codiPostal: "12345", telf:"654789321"},
    {id_: 2, nom: "Olivia", cognoms:"Parker",  adresa: {carrer: "Kong",numero: "24",pis: "2",porta: "3"},id_localitat: "2",codiPostal: "65432", telf:"693582471"},
    {id_: 3, nom: "Liam", cognoms:"Reynolds",  adresa: {carrer: "Jacint",numero: "105",pis: "3",porta: "2"},id_localitat: "1",codiPostal: "12345", telf:"624351789"}
  ];
  
  
  var myobjcom = [
  	{id_: 1, data_hora:"2023-05-08T00:00:00Z" , repartiment_recollida:"repartiment" ,preu: 30.25,cuantitat_prod1:3 ,cuantitat_prod2:2 ,cuantitat_prod3:1 ,id_client: 1, id_botiga:1, id_repartidor:1},
  	{id_: 2, data_hora:"2023-05-08T00:00:00Z" , repartiment_recollida:"repartiment" ,preu:  23.42,cuantitat_prod1:2 ,cuantitat_prod2: 3,cuantitat_prod3: 4,id_client: 1, id_botiga:2, id_repartidor:2},
  	{id_: 3, data_hora: "2023-05-08T00:00:00Z", repartiment_recollida:"repartiment" ,preu: 35.42,cuantitat_prod1: 0,cuantitat_prod2: 4,cuantitat_prod3:4 ,id_client: 1, id_botiga:1, id_repartidor:1}
  ];
  
  var myobjloc = [
  	{id_: 1, nom: "Willowbrook", id_provincia: 1},
  	{id_: 2, nom: "Cedarwood", id_provincia: 2}
  ];
  
   var myobjcatev  = [
  	{id_: 1, nom: "Ashbourne"},
  	{id_: 2, nom: "Medowvale"}
  ];
  
var myobjhamb = [
  	{id_: 1, nom: "Hamburguesa", descripcio:"Deliciosa hamburguesa jugosa con una irresistible combinación de sabores y texturas", imatge:"burger1.jpg", preu:1.50},
  	{id_: 2, nom: "Hamburguesa con queso", descripcio:"Irresistible hamburguesa con queso derretido, que añade un toque cremoso y delicioso a cada mordisco.", imatge:"burger2.jpg", preu:2.15}
  ];
var myobjbegu  = [
  	{id_: 1, nom: "Limonada", descripcio:"Clásica y refrescante  con un toque de menta fresca.", imatge:"bebida1.jpg", preu:2.50},
  	{id_: 1, nom: "Soda de naranja", descripcio:"Refrescante y burbujeante, perfecta para calmar la sed en días calurosos.", imatge:"bebida2.jpg", preu:2.50}
  ];
var myobjpizz  = [
  	{id_: 1, nom: "Pepperoni", descripcio:"Deliciosa pizza de pepperoni, con generosas porciones de queso fundido y sabroso pepperoni en cada bocado.", imatge:"pizza1.jpg", preu:11.26, id_categoria:1},
  	{id_: 2, nom: "Verdurezza", descripcio:"Exquisita pizza vegetariana, cubierta con  champiñones, pimientos, cebolla y aceitunas, sobre una base de salsa de tomate y queso derretido.", imatge:"pizza2.jpg", preu:9.62, id_categoria:2}
  ];



var myobjcate = [
  	{id_: 1, nom: "no_vegetarianas"},
  	{id_: 2, nom: "vegetarianas"}
  ];
  
  var myobjboti = [
  	{id_:1,adresa: {carrer: "Primavera",numero: "13"},id_localitat:1,codiPostal: "12345"},
  	{id_:2,adresa: {carrer: "Sol",numero: "24"},id_localitat:2,codiPostal: "65432"}
  ];
  
   var myobjempl = [
  	{id_: 1, nom: "Ava", cognoms:"Mitchell",nif:"32128341Y",telf:"684759321",cuiner_repart:"Repartidor",id_botiga:1},
  	{id_: 2, nom: "Benjamin", cognoms:"Campbell",nif:"25548367M",telf:"654398217",cuiner_repart:"Cuiner",id_botiga:1},
  	{id_: 3, nom: "Sophia", cognoms:"Hughes",nif:"98472615T",telf:"639854217",cuiner_repart:"Cuiner",id_botiga:2},
  	{id_: 4, nom: "Lucas", cognoms:"Bennet",nif:"42284319C",telf:"621354789",cuiner_repart:"Repartidor",id_botiga:2}
  ];


var myobjrep = [
  	{id_: 1, id_empleat:1},
  	{id_: 2, id_empleat:4}
  ];


  dbo.collection("clients").insertMany(myobjcli, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a client: " + res.insertedCount);  
  });
  
  dbo.collection("comanda").insertMany(myobjcom, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a comanda: " + res.insertedCount);  
  });
  
  dbo.collection("localitat").insertMany(myobjloc l, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a localitat: " + res.insertedCount);  
  });
  
  dbo.collection("provincia").insertMany(myobjcatev , function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a provincia: " + res.insertedCount);  
  });
  
dbo.collection("hamburguesa").insertMany(myobjhamb , function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a hamburguesa: " + res.insertedCount);  
  });
dbo.collection("beguda").insertMany(myobjbegu , function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a beguda: " + res.insertedCount);  
  });
dbo.collection("pizza").insertMany(myobjpizz , function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a pizza: " + res.insertedCount);  
  });


dbo.collection("categoria").insertMany(myobjcate, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a categoria: " + res.insertedCount);  
  });
  
  dbo.collection("botiga").insertMany(myobjboti, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a botiga: " + res.insertedCount);  
  });
  
  dbo.collection("empleats").insertMany(myobjempl, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a empleats: " + res.insertedCount);  
  });


dbo.collection("repartidors").insertMany(myobjrep, function(err, res) {
    if (err) throw err;
    console.log("Numero de documents insertats a repartidors: " + res.insertedCount);  
  });


  db.close();
});