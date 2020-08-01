/*
This function is responseble to recebe a ID and 
with it get all the information that we need to 
show to our user the game that he clicked at
*/

const axios = require('axios').default;

async function Details(id){

    // General Data
    data = await axios({
        
        url: "https://api-v3.igdb.com/games/",
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'user-key': '92dc2928aab6bc080b79811519353eb5'
        },
        
        data: `where id = ${id}; fields name,name, created_at, genres,involved_companies,platforms,total_rating;`
    })
    .then(response => {
        console.log(response.data);
        const data = response.data[0]
        return data
    })
    .catch(err => {
        console.error(err);
    });

    const name = data.name
    const createdAt = data.created_at
    const genres = data.genres
    const companies = data.companies
    const plataforms = data.plataforms
    const rating = data.total_rating


    //Get the day of creation
    function Date(createdAt){

        axios({
            
        url: "https://api-v3.igdb.com/games/",
        method: 'POST',
        headers: {
            'Accept': 'application/json',
            'user-key': '92dc2928aab6bc080b79811519353eb5'
        },
        
        data: `where id = ${id}; fields name,name, created_at, genres,involved_companies,platforms,total_rating;`
    })
    .then(response => {
        dados = response.data
        console.log(response.data);
    })
    .catch(err => {
        console.error(err);
    });
    }
    
    
    
}

Details(1)
    
    