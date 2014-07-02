<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
  <head>
    <meta charset='utf-8' />
  </head>
  <body>
    <!--Add a button for the user to click to initiate auth sequence -->
    <button id="authorize-button" style="visibility: hidden">Authorize</button>
    <script type="text/javascript">
      // Enter a client ID for a web application from the Google Developer Console.
      // The provided clientId will only work if the sample is run directly from
      // https://google-api-javascript-client.googlecode.com/hg/samples/authSample.html
      // In your Developer Console project, add a JavaScript origin that corresponds to the domain
      // where you will be running the script.
      var clientId = '51367660731-2slemtb0q2f68mjq8lfac09o307i3ua0.apps.googleusercontent.com';

      // Enter the API key from the Google Develoepr Console - to handle any unauthenticated
      // requests in the code.
      // The provided key works for this sample only when run from
      // https://google-api-javascript-client.googlecode.com/hg/samples/authSample.html
      // To use in your own application, replace this API key with your own.
      var apiKey = 'cjrMJqivyOu1ndYB_nxYaYcg';

      // To enter one or more authentication scopes, refer to the documentation for the API.
      var scopes = 'https://www.googleapis.com/auth/contacts.readonly';

      // Use a button to handle authentication the first time.
      function handleClientLoad() {
        gapi.client.setApiKey(apiKey);
        window.setTimeout(checkAuth,1);
      }

      function checkAuth() {
        gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: true}, handleAuthResult);
      }


      function handleAuthResult(authResult) {
        var authorizeButton = document.getElementById('authorize-button');
        if (authResult && !authResult.error) {
          authorizeButton.style.visibility = 'hidden';
          makeApiCall(authResult);
        } else {
          authorizeButton.style.visibility = '';
          authorizeButton.onclick = handleAuthClick;
        }
      }

      function handleAuthClick(event) {
        gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: false}, handleAuthResult);
        return false;
      }

      // Load the API and make an API call.  Display the results on the screen.
      function makeApiCall(authResult) {
    	  $.ajax({
    		  url: 'https://www.google.com/m8/feeds/contacts/default/full?alt=json&max-results=1000&access_token='+authResult.access_token,
    		  datatype: 'jsonp',
    		  success: function(data) {
    		   //alert(data.feed.entry);
    		   for ( i=0 ; i < data.feed.entry.length ; ++ i  )	  
    			   if ( data.feed.entry[i].gd$email )
      			      alert(data.feed.entry[i].title.$t +' '+ data.feed.entry[i].gd$email.address );
    			   else
        			   alert(data.feed.entry[i].title.$t );
    		  
    		  },
    		  error: function(j, t, e) {  alert(j);}
    		});
      }
    </script>
    <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
	<script src="jquery-1.8.3.js"></script>
    <div id="content"></div>
    <p>Retrieves your profile name using the Google Plus API.</p>
  </body>
</html>
