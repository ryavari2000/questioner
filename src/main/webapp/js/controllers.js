(function() {
	
// google client properties.
// google client properties.
var clientId = '51367660731-2slemtb0q2f68mjq8lfac09o307i3ua0.apps.googleusercontent.com';
var apiKey = 'cjrMJqivyOu1ndYB_nxYaYcg';
var scopes = 'https://www.googleapis.com/auth/contacts.readonly';


var contactsApp = angular.module('contactsApp', []);

contactsApp.controller('ContactListCtrl', function ($scope, $http)  {
    
	$scope.selectedContacts = []; 
	
	$scope.authorize = function() {
      gapi.client.setApiKey(apiKey);
      gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: false}, handleAuthResult);
	};
	
    
	function handleAuthResult(authResult) {
    	
     $http.get('https://www.google.com/m8/feeds/contacts/default/full?alt=json&max-results=1000&access_token='+authResult.access_token).success(function(data) {
    	   $scope.contacts = []; 
    	   
    	   for ( var i = 0 ; i < data.feed.entry.length ; ++ i ) {
    		   if ( data.feed.entry[i].gd$email != undefined ){
    		    var p = {};
    		    angular.copy( data.feed.entry[i] , p );
    		    $scope.contacts.push(p);
    		   }
    	   }
    	   
    	   $scope.title = data.feed.title.$t;
    	   $scope.email = data.feed.id.$t;
    	   $scope.Total = data.feed.openSearch$totalReasults;
     });
     
    }
    
	
	$scope.addEmail = function ( contact ) {
		
		// if exist dont add
		for (  var i = 0 ; i < $scope.selectedContacts.length ; ++ i  ) {
		  if ( contact.gd$email[0].address ==  $scope.selectedContacts[i].gd$email[0].address) {
			  return;
		  }
		}
		// if not exist add it
		var p = {};
		angular.copy( contact , p );
		$scope.selectedContacts.push(p);
	};
	
    
 });

})();