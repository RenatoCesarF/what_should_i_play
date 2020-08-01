const axios = require('axios').default;


function Details(id){

    dados = axios({
        
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

Details(1)
    
    