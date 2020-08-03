/*
This function is responseble to list the similar
games receving one(game ID) from paramter
*/

const axios = require('axios')

module.exports = {
    async List(id){
        //Getting the API data
        data = await axios({
        
            url: "https://api-v3.igdb.com/games/",
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'user-key': '92dc2928aab6bc080b79811519353eb5'
            },
            
            //asking for the especifyc data
            data: `where id = ${id};fields name,franchises.games.name,franchises.games.cover.image_id, similar_games.cover.image_id, similar_games.name, involved_companies.company.published.cover.image_id, involved_companies.company.name, involved_companies.developer, involved_companies.company.published.name;`
        }) 
        .then(response => {
            const data = response.data[0]
            console.log(data)
            return data
        })
        .catch(err => {
            console.error(err);
        });

        //Data API transformed to consts
        const franchises = data.franchises
        const similars = data.similar_games
        const companies = data.involved_companies

        
        //Getting the franshise games (image,id,name)
        manyInFranchise = franchises[0].games
        fullfranchise = []
        for(i = 0;i < manyInFranchise.length; i ++){
            image = franchises[0].games[i].cover.image_id
            franchiseGame = [
                franchises[0].games[i].name,
                `https://images.igdb.com/igdb/image/upload/t_cover_big/${image}.jpg`,
                franchises[0].games[i].id
            ]

            fullfranchise.push(franchiseGame)
        }
    

        //Getting the images of games that the developer did (image,id,name)
        developers = []
        async function isDev(){

            for(i = 0; i <= companies.length; i ++){
                dev = companies[i].developer 
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
        }

        //Getting the similar ones (image,id,name)    
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
            allFromDev,
            fullfranchise,
        })
    }
}
