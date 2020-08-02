/*
This file will contain some functions that will
be used in others part of the App, so will write
it here to use everywhere
*/

const axios = require('axios').default;

module.exports = {
    //Function to get the image of a game
    async getCover(idGame){
        link = await axios({
    
            url: "https://api-v3.igdb.com/covers",
            method: 'POST',
            headers: {
                'Accept': 'application/json',
                'user-key': '92dc2928aab6bc080b79811519353eb5'
            },
            
            data: `where game = ${idGame} ; fields url;`
            
        })
        .then(response => {
            const data = response.data[0]
            var linkImage = (`https:${data.url}`)
            return linkImage
        })
        .catch(err => {
            console.error(err);
        });
        console.log(link)
        return link
    },

    async getPlatforms(platform){
        platformArray = []

        for(i=0; i<platform.length; i++){

            platformName = await axios({
                url: "https://api-v3.igdb.com/platforms",
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'user-key': "92dc2928aab6bc080b79811519353eb5"
                },
                data: `where id = ${platform[i]}; fields name;`
            })
            .then(response => {
                return response.data[0].name
            })
            .catch(err => {
                console.error(err);
            });
            
            platformArray.push(platformName)
        }
            
        return platformArray
        

    },

    async getCompanies(involvedCompanies){
        involvedCompaniesArray = []
        // ↓↓↓ getting the id of the companie with the involved companies id
        for(i=0; i<involvedCompanies.length; i++){

            companieID = await axios({
                url: "https://api-v3.igdb.com/involved_companies",
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'user-key': "92dc2928aab6bc080b79811519353eb5"
                },
                data: `where id = ${involvedCompanies[i]}; fields company;`
            })
            .then(response => {
                return response.data[0].company
            })
            .catch(err => {
                console.error(err);
            });
            
            involvedCompaniesArray.push(companieID)
        }
        
        companiesArray = []
        //↓↓↓ getting the name of the companie with it's ID
        for(i=0; i<involvedCompaniesArray.length; i++){

            companieName = await axios({
                url: "https://api-v3.igdb.com/companies",
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'user-key': "92dc2928aab6bc080b79811519353eb5"
                },
                data: `where id = ${involvedCompaniesArray[i]}; fields name;`
            })
            .then(response => {
                return response.data[0].name
            })
            .catch(err => {
                console.error(err);
            });
            
            companiesArray.push(companieName)
        }
        
        return companiesArray
    },

    async getGenres(genres){
        genresArray = []

        for(i=0; i<genres.length; i++){

            genresNames = await axios({
                url: "https://api-v3.igdb.com/genres",
                method: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'user-key': "92dc2928aab6bc080b79811519353eb5"
                },
                data: `where id = ${genres[i]}; fields name;`
            })
            .then(response => {
                return response.data[0].name
            })
            .catch(err => {
                console.error(err);
            });
            
            genresArray.push(genresNames)
        }
            
        return genresArray
        

    }

}





