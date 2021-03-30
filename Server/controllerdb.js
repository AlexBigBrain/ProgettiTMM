const pool = require('./db');

async function getParola( Parola ) {
   const [result,] = await pool.query('SELECT `ScritturaGenerale`.`Parola_fk` FROM `ScritturaGenerale` WHERE `ScritturaGenerale`.`ScritturaGenerale` = ?;', [Parola]);
   return result;
}
async function getDescrizioni( Parola ) {
    const [result,] = await pool.query('SELECT * FROM `Parola` INNER JOIN `Descrizione` ON `Parola`.`Parola_pk` = `Descrizione`.`Parola_fk` where `Parola`.`Parola_pk` = ?;',[Parola]);
    return result;
}
async function getLingueParola( Parola ) {
    const [result,] = await pool.query('SELECT `Lingua` FROM `Parola` WHERE `Parola_pk` = ?;',[Parola]);
    return result;
}
async function getEsempi( Parola ){
    const [result,] = await pool.query('SELECT `Esempio`,`LinguaEsempio` FROM `Esempi` WHERE `Parola_fk` = ?;',[Parola]);
    return result;

}
async function getSinonimi( Parola ){
    const [result,] = await pool.query('SELECT `Sinonimi(P-P)`.`SI_ParolaB_fk` FROM `Sinonimi(P-P)` WHERE `SI_ParolaA_fk` = ? UNION SELECT `Sinonimi(P-P)`.`SI_ParolaA_fk` FROM `Sinonimi(P-P)` WHERE `SI_ParolaB_fk` = ?;',[Parola, Parola]);
    return result;
}
async function getTraduzioniEN( Parola ){
    const [result,] = await pool.query('SELECT `Traduzione(P-P)`.`TR_ParolaEN_fk` FROM `Traduzione(P-P)` WHERE `TR_ParolaIT_fk` = ?;',[Parola]);
    return result;
}
async function getTraduzioniIT( Parola ){
    const [result,] = await pool.query('SELECT `Traduzione(P-P)`.`TR_ParolaIT_fk` FROM `Traduzione(P-P)` WHERE `TR_ParolaEN_fk` = ?;',[Parola]);
    return result;
}

module.exports = {
    getDescrizioni,
    getEsempi,
    getLingueParola,
    getParola,
    getSinonimi,
    getTraduzioniEN,
    getTraduzioniIT,
};