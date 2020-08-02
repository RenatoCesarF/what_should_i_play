/*
This script will be used on LIST page, its receve
an ID of the game that you search and return lists of
others games.
*/

const axios = require('axios')
const Utils = require('../Utils')

async function List(id){
        //General Data
        data = await axios({
        
            url: "https://api-v3.igdb.com/games/",
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'user-key': '92dc2928aab6bc080b79811519353eb5'
            },
            
            data: `where id = ${id};fields name, genres.name;`
        })
        .then(response => {
            const data = response.data[0]
            console.log(data)
            return data
        })
        .catch(err => {
            console.error(err);
        });
}
List(1942)

/*

It receve an ID and return:
fields collection, franchise, similar_games, involved_companies 


List it by:
- Company
- Genres
- franchise

*/