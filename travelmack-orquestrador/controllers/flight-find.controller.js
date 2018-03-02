// var's
const request = require('request');
const moment = require('moment');
const API_URL_FLIGHTS = "https://api.sandbox.amadeus.com/v1.2/flights/low-fare-search";
const API_URL_AIRPORT_NAMES = "https://api.sandbox.amadeus.com/v1.2/airports/autocomplete";
require('dotenv').load();

// fn's
async function findByDestination(origin, destination, departure_date, return_date = null) {
    let result;
    if (origin && destination && departure_date && return_date != null) {
        result = await fetchDestination('?apikey=' + process.env.API_KEY + '&origin=' + origin + '&destination=' + destination + '&departure_date=' + departure_date + '--' + return_date);
    } else {
        result = await fetchDestination('?apikey=' + process.env.API_KEY + '&origin=' + origin + '&destination=' + destination + '&departure_date=' + departure_date);
    }

    return result;
}

async function autoCompleteAirportNames(term, country='US'){
    let result = await autoComplete('?apikey=' + process.env.API_KEY + '&term=' + term + "&country=" + country);

    return result;
}




// helper fn's
function fetchDestination(query = null) {
    return new Promise((resolve, reject) => {
            request.get(API_URL_FLIGHTS + query, {}, (error, response, body) => {
                if (error) {
                    reject(error);
                } else {
                    console.log(body);
                    if (response.statusCode == 200) {
                        var info = JSON.parse(body);
                        resolve(info);
                    } else {
                        reject(error);
                    }
                }
            })
    })
}

function autoComplete(query){
    return new Promise((resolve, reject) => {
        request.get(API_URL_AIRPORT_NAMES + query, {}, (error, response, body) => {
            if (error) {
                reject(error);
            } else {
                console.log(body);
                if (response.statusCode == 200) {
                    var info = JSON.parse(body);
                    resolve(info);
                } else {
                    reject(error);
                }
            }
        })
    })
}





module.exports = {
    findByDestination: findByDestination,
    autoCompleteAirportNames: autoCompleteAirportNames
}