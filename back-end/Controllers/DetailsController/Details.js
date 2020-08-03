/*
This function is responseble to recebe a ID and 
with it get all the information that we need to 
show to our user the game that he clicked at
*/

const axios = require('axios').default;


module.exports = {
    async  Details(id){
        //General Data
        data = await axios({
            
            url: "https://api-v3.igdb.com/games/",
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'user-key': '92dc2928aab6bc080b79811519353eb5'
            },
            
            data: `where id = ${id}; fields name, cover.image_id,first_release_date, genres.name,platforms.name,total_rating, involved_companies.company.name,involved_companies.developer;`
        })
        .then(response => {
            const data = response.data[0]
            console.log(data)
            return data
        })
        .catch(err => {
            console.error(err);
        });

        //our variables of the game Object
        const name = data.name
        const release = data.first_release_date
        const rating = Math.floor(data.total_rating)
        const platforms = data.platforms
        const involved_companies = data.involved_companies
        const genres = data.genres

        //Getting the genres of the game
        genresNames = []
        for(i = 0;i < genres.length; i ++){
            genresNames.push(genres[i].name)
        }

        //Getting the companies that create the game
        developer =[]
        for(i = 0; i< involved_companies.length; i ++){
            dev = involved_companies[i].developer
            if(dev == true){
                devName = involved_companies[i].company.name
                developer.push(devName)
            }
        }
    
        //Getting the platforms where the game are
        platformsNames = []
        for(i = 0; i < platforms.length; i++){
            platform = platforms[i].name
            platformsNames.push(platform)
        }

        //Getting the publication year of the game 
        const unixTimestamp = release
        const milliseconds = unixTimestamp * 1000
        const dateObject = new Date(milliseconds)
        const year = dateObject.toLocaleString("en-US", {year: "numeric"}) 
        dateObject.toLocaleString("en-US", {timeZoneName: "short"})

        image = `https://images.igdb.com/igdb/image/upload/t_cover_big/${data.cover.image_id}.jpg`


        return({
            image,
            name,
            year,
            rating,
            genresNames,
            developer,
            platformsNames
        })

    }
    
}

