(function() {
	
// google client properties.
// google client properties.
var clientId = '51367660731-2slemtb0q2f68mjq8lfac09o307i3ua0.apps.googleusercontent.com';
var apiKey = 'cjrMJqivyOu1ndYB_nxYaYcg';
var scopes = 'https://www.googleapis.com/auth/contacts.readonly';


var contactsApp = angular.module('contactsApp', []);

contactsApp.controller('ContactListCtrl', function ($scope, $http)  {
    
	this.dataLoaded = false;
	
	$scope.authorize = function() {
      gapi.client.setApiKey(apiKey);
      gapi.auth.authorize({client_id: clientId, scope: scopes, immediate: false}, handleAuthResult);
	};
	
    function handleAuthResult(authResult) {
    	
     $http.get('https://www.google.com/m8/feeds/contacts/default/full?alt=json&max-results=1000&access_token='+authResult.access_token).success(function(data) {
    	    $scope.contacts = data.feed.entry;
    	    $scope.title = data.feed.title.$t;
    	    $scope.email = data.feed.id.$t;
    	    $scope.Total = data.feed.openSearch$totalReasults;
    	    this.dataLoaded = true;
     });
     
    }
    
    
 });

})();