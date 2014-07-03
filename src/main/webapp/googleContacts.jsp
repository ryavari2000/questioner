<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!doctype html>
<html xmlns:ng="http://angularjs.org" lang="en" id="ng-app" ng-app="contactsApp">
<head>
  <meta charset="utf-8">
  <title>Questioners</title>
  <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
  <link rel="stylesheet" href="bootstrap/css/bootstrap-theme.css">

  <script src="angular-1.3.0-beta.14/angular.js"></script>
  <script src="angular-1.3.0-beta.14/angular-route.js"></script>

  <script src="js/contacts.js"></script>
  
  <script src="js/app.js"></script>
  <script src="js/controllers.js"></script>

  <script src="https://apis.google.com/js/client.js?onload=handleClientLoad"></script>
  <script src="jquery-1.8.3.js"></script>

</head>
<body ng-controller="ContactListCtrl as clist">

  <br/>
  
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-2">
        <!--Sidebar content-->
		  <div class="form-group">
		  <button ng-click="authorize()" class="btn btn-default btn-sm" role="button">Get My Google Contacts</button>
		  <label>Search:</label>
		  <input class="form-control input-sm" ng-model="query" placeholder="input filter">
		  
		  <label>Sort by:</label>
		  <select ng-model="orderProp" class="form-control input-sm">
				   <option value="title.$t">Alphabetical</option>
				    <option value="updated">Newest</option>
		  </select>
		  </div>
      </div>
      <div class="col-md-10">
        <!--Body content-->
         <h3 ng-show="title">{{title}} <small>({{email}})</small></h3>
         <section ng-show="title" ng-init="tab = 1">
           <ul class="nav nav-pills">
             <li ng-class="{active:tab===1}"><a href ng-click="tab = 1">All</a></li>
             <li ng-class="{active:tab===2}"><a href ng-click="tab = 2">Selected</a></li>
           </ul>
         </section>
        <div class="panel pre-scrollable" ng-show="tab === 1">
        <br/>
        <table ng-show="title" class="table table-bordered table-hover table-condensed ">
          <tr>
            <th>&nbsp</th>
            <th>Name</th>
            <th>Phone</th>
            <th>Email</th>
          </tr>
          <tr ng-repeat="contact in contacts | filter:query | orderBy:orderProp">
              <td>
               <input type="checkbox" class="form-control"/>
              </td>
              <td>{{contact.title.$t}}</td>
              <td>{{ contact.gd$phoneNumber[0].$t }}</td>
              <td>{{ contact.gd$email[0].address }}</td> 
          </tr>
        </table>
        </div>
        <div class="panel" ng-show="tab === 2">
          Show selected contacts ... //TODO:
        </div>
      </div>
    </div>
  </div>
  
</body>
</html>