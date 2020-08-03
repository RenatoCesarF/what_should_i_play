/*
This function will recebe a incompleet game name
and will return a list of games with the similar name

return(image cover & Correct name)
*/

const axios = require('axios')

module.exports = {


    async Search(){
        //General Data
        const rightOnes  = await axios({
        
            url: "https://api-v3.igdb.com/games/",
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'user-key': '92dc2928aab6bc080b79811519353eb5'
            },
            
            //asked data ↓
            data: `fields name,cover.image_id; search "Zelda"; limit 30;`
        }) 
        .then(response => {
            console.log(response.data)
            return response.data  
        })
        .catch(err => {
            console.error(err);
        });

        
        rightNames = []
        
        // Ajusting the data (img url, gameId and gameName)
        for(i = 0; i < rightOnes.length; i ++){
            image = `https://images.igdb.com/igdb/image/upload/t_cover_big/${data[i].cover.image_id}.jpg`
            gameList = [
                data[i].id,
                data[i].name,
                image
            ]
            rightNames.push(gameList)
        }

        return(rightNames)
    
    }
}