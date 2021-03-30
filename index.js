const express = require('express');
const app = express();

app.use(express.urlencoded({extended: true}));
app.use(express.json());

const {getDescrizioni,
       getEsempi,
       getLingueParola,
       getParola,
       getSinonimi,
       getTraduzioniEN,
       getTraduzioniIT}  = require('./Server/controllerdb');

app.listen(4000, ()=> console.log('listening on port 4000'));