# Result codes

The Mercaux API uses the following result codes:


Result Code | Meaning
---------- | -------
200 | Everything is OK, you may use result data. You will get this code if you either get all your data in one request or it's the last request in the row
204 | Everything is OK, but there's no data available at all
206 | Everything is OK, but not all the data is downloaded. You should request next portion (see <a href="#paging">Paging</a>)
303 | See other -- you should use provided URL to redirect
400 | Bad Request -- Your request is malformed
401 | Unauthorized -- Your API key is wrong or not provided
403 | Forbidden -- You're not allowed to get specific data using your API key
404 | Not Found -- The specified data could not be found
405 | Method Not Allowed -- You tried to access API with an invalid method
406 | Not Acceptable -- You request body format isn't json
429 | Too Many Requests -- You're requesting too data from API! Slow down! See <a href="#throttling">Throttling</a>
500 | Internal Server Error -- We had a problem with our server. Try again later.
503 | Service Unavailable -- We're temporarially offline for maintanance. Please try again later.
