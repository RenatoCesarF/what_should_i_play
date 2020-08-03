/*
This script will be used on LIST page, its receve
an ID of the game that you search and return lists of
others games.
*/

const axios = require('axios')

async function List(id){
    //General Data
    data = await axios({
    
        url: "https://api-v3.igdb.com/games/",
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'user-key': '92dc2928aab6bc080b79811519353eb5'
        },
        
        
        data: `where id = ${id};fields name, franchises, similar_games.cover.image_id, similar_games.name, involved_companies.company.published.cover.image_id, involved_companies.company.name, involved_companies.developer, involved_companies.company.published.name;`
    }) 
    .then(response => {
        const data = response.data[0]
        console.log(data)
        return data
    })
    .catch(err => {
        console.error(err);
    });

    
    const franchises = data.franchises
    const similars = data.similar_games
    const companies = data.involved_companies



    //getting the images of games that the developer did
    developers = []
    async function isDev(){

        for(i = 0; i <= companies.length; i ++){
        
            dev = companies[i].developer 
            console.log(companies[i].developer)
            if(dev == true){
                devName = companies[i].company.name
                developers.push(devName)
                return i
            }
        
        }
    }
    const company = await isDev()
    const theDev = companies[company].company
    for(i = 0; i< companies.length; i++ ){
        allFromDev = [
            theDev.published[i].id,
            `https://images.igdb.com/igdb/image/upload/t_cover_big/${theDev.published[i].cover.image_id}.jpg`,
            theDev.published[i].name
        ]
        console.log(allFromDev)
    }

    //FIXME: fazer o mesmo que fiz com os similares e retornar um array com id, nome e imagem 
    //Getting the Collection
    fullfranchise = []
    for(i = 0;i < franchises.length;i ++){
        gameName = franchises[i].name //can pick the name, or the id
        fullfranchise.push(gameName)
    }

    //Getting the similar ones     
    similarGames = []
    for(i = 0;i < similars.length;i ++){
        eachGame = [ //this array return the id and the link to the image of each game
            similars[i].id,
            `https://images.igdb.com/igdb/image/upload/t_cover_big/${similars[i].cover.image_id}.jpg`,
            similars[i].name
        ]

        similarGames.push(eachGame)
    }


    return({
        similarGames,
        allFromDev
    })
}

List(1942)




/*

It receve an ID and return:
fields collection, franchise, similar_games, involved_companies.company.name 


List it by:
- Company
- Genres
- franchise

*/