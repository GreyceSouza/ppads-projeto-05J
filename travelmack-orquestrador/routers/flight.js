const express = require('express');

const flightController = require('../controllers/flight-find.controller');

const flightRouter = express.Router();

const router = () => {
    flightRouter.route('/list')
    .get(findFlightsByDestination);


    flightRouter.route('/autocomplete')
    .get(autoCompleteAirportName)

    
    return flightRouter;
}


// fn's
const findFlightsByDestination = (req,res) => {
    console.log('GET on /list with params: %j', req.query)
    let origin = (req.query.origin != undefined)?req.query.origin:null;
    let destination = (req.query.destination != undefined)?req.query.destination:null;
    let departure_date = (req.query.departure_date != undefined)?req.query.departure_date:null;
    let return_date = (req.query.return_date != undefined)?req.query.return_date:null;

    if(origin != null && destination != null && departure_date != null){
        flightController.findByDestination(origin,destination,departure_date,return_date).then((result) => {
            res.send(result);
        })
        .catch((err) => {
            res.status(400).json({err: true, msg: err});
        })
    }else{
        res.status(400).json({err: true, msg: 'Missing parameters: origin!, destination!, departure_date!, return_date?'})
    }
}

const autoCompleteAirportName = (req,res) => {
    console.log('GET on /list with params: %j', req.query)
    let country = (req.query.country != undefined)?req.query.country:null;
    let term = (req.query.term != undefined)?req.query.term:null;

    if(term != null){
        if(country == null){
            country = 'US'
        }
        flightController.autoCompleteAirportNames(term, country).then((response) => {
            res.send(response);
        })
        .catch((err) => {
            res.status(400).json({err: true, msg: err});
        })
    }else{
        res.status(400).json({err: true, msg: 'Missing parameters: term!, country?'});
    }
}

module.exports = router;