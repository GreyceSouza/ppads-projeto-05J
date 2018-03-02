const express = require('express');
const cors = require('cors');
const bodyParser = require('body-parser');


const app = express();
const http = require('http').Server(app);

app.set('port', process.env.PORT || 3000);
app.use(cors());
app.use(bodyParser.json());

// routers
const flights = require('./routers/flight')();

app.use('/api/v1/', flights);


http.listen(app.get('port'), () => {
    console.log('Express server listening on port ' + app.get('port'));
})