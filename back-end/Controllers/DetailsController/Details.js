/*
This function is responseble to recebe a ID and 
with it get all the information that we need to 
show to our user the game that he clicked at
*/

const axios = require('axios').default;
const Utils = require('./Utils')


async function Details(id){
    //General Data
    data = await axios({
        
        url: "https://api-v3.igdb.com/games/",
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'user-key': '92dc2928aab6bc080b79811519353eb5'
        },
        
        data: `where id = ${id}; fields name, cover,first_release_date, genres,involved_companies,platforms,total_rating;`
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
    const involvedCompanies = data.involved_companies
    const genres = data.genres


    //Getting an array of platforms names↓
    platformsNames = await Utils.getPlatforms(platforms)

    //Getting an array of companies names↓
    companies = await Utils.getCompanies(involvedCompanies)

    //Getting an array of genres of the game ↓
    genresNames = await Utils.getGenres(genres)

    //Transforming the Unix state date into human date ↓
    const unixTimestamp = release
    const milliseconds = unixTimestamp * 1000
    const dateObject = new Date(milliseconds)
    const humanDate = dateObject.toLocaleString("en-US", {year: "numeric"}) 
    dateObject.toLocaleString("en-US", {timeZoneName: "short"})

    console.log({
        name,
        humanDate,
        rating,
        genresNames,
        companies,
        platformsNames
    })

    return({
        name,
        humanDate,
        rating,
        genresNames,
        companies,
        platformsNames
    })

}

export default Details;