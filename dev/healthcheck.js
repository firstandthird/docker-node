const http = require("http");

const healthcheckUrl = process.env.HEALTHCHECK_URL;

const options = {  
  timeout : 2000
};

if (!healthcheckUrl || healthcheckUrl === 'none') {
  // silently exit
  process.exit(0);
}

const request = http.request(healthcheckUrl, options, (res) => {  
  console.log(`STATUS: ${res.statusCode}`);  
  process.exit(res.statusCode == 200 ? 0 : 1);
});

request.on('error', function(err) {  
  console.log('ERROR');
  process.exit(1);
});

request.end();