<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en" ng-app="contactsApp">
<head>
  <meta charset="utf-8">
  <title>Questioners</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <script src="angular-1.3.0-beta.14/angular.js"></script>
  <script src="js/contacts.js"></script>
  <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
  <script src="jquery-1.8.3.js"></script>

</head>
<body ng-controller="ContactListCtrl">

  <button ng-click="authorize()" >Get My Google Contacts</button>
  <br/>
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2">
        <!--Sidebar content-->

        Search: <input ng-model="query">
		Sort by:
		<select ng-model="orderProp">
		   <option value="title.$t">Alphabetical</option>
		    <option value="-updated">Newest</option>
		</select>
      </div>
      <div class="col-md-10">
        <!--Body content-->

        <ul class="phones">
          <li ng-repeat="contact in contacts | filter:query | orderBy:orderProp">
              {{contact.title.$t}} - {{ contact.gd$phoneNumber[0].$t }} ({{ contact.gd$email[0].address }} ) 
          </li>
        </ul>

      </div>
    </div>
  </div>
  
</body>
</html>