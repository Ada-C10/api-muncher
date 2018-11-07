// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
about supported directives.
  = require jquery3
  = require popper
  = require bootstrap-sprockets


= require rails-ujs
= require activestorage
= require turbolinks
= require_tree .
function searchRecipes(){

 //grab the search term
  const searchM = document.querySelector('#searchBox').value;

  //grab the url
const endpoint = 'https://api.edamam.com/search?q='+searchM+'&app_id=53c99899&app_key=5bcac43624cd4fde163db0d5b37859e3&from=0&to=48';
  //set up the ajax
 $.ajax({
   url: endpoint,
   Accept: 'application/json',
   Headers: {'Api-User-Agent': 'Search-Here'},
   ContentType: "application/x-www-form-urlencoded",
   type: 'GET',
   data: {},
   dataType: 'json',
   success: function(data){
     //get the recipe label
     var label = '';
    //get the image
     var image ='';
    //create a button
     var searchButton = '';
     //get the recipe source
     var source = '';

     var detail = '';
    //set up the variables
    var url = '';

     function reset(){
    //grab what I want to reset/ clear
    //clear the field
            var childRemove =  $('.results').remove();
        return childRemove;
  }
     reset();

     for(var i =0; i<data.hits.length; i++){
       //set the vars to their respective locations in JSON
        label = data.hits[i].recipe["label"];
        image = data.hits[i].recipe["image"];
        source = data.hits[i].recipe["source"];
        url = data.hits[i].recipe["url"];

       var results = ('<figure class="results"><a href="'+url+'" target="_blank"><img src="'+image+ '"alt='+label+'"/><h4 class="results_label">'+label+'</h4><h5 class="results_source">From '+source+'</h5></a></figure>');

       $('.displaySearch').append(results);
     }

   },
   error:function(err){
     alert('sorry, something is wrong!');
   },
 });

}

//line that makes the code show up
document.getElementById('search').addEventListener('click', searchRecipes);
