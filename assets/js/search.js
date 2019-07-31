(function() {
    function displaySearchResults(results, store) {
      var searchResults = document.getElementById('search-results');
  
      if (results.length) { // Are there any results?
        var appendString = '';
  
        for (var i = 0; i < results.length; i++) {  // Iterate over the results
          var item = store[results[i].ref];
          appendString += '<li><a href="' + item.url + '"><h3>' + item.title + '</h3></a>';
          appendString += '<p>' + item.content.substring(0, 150) + '...</p></li>';
        }
  
        searchResults.innerHTML = appendString;
      } else {
        searchResults.innerHTML = '<li>No results found</li>';
      }
    }
  
    function getQueryVariable(variable) {
      var query = window.location.search.substring(1);
      var vars = query.split('&');
  
      for (var i = 0; i < vars.length; i++) {
        var pair = vars[i].split('=');
  
        if (pair[0] === variable) {
          return decodeURIComponent(pair[1].replace(/\+/g, '%20'));
        }
      }
    }

    var clearForHebrew = function (builder) {
        var pipelineFunction = function (token) {
            var temp = token.str;
            temp = temp.replace('.','');
            temp = temp.replace(',','');
            temp = temp.replace('"','');
            temp = temp.replace('\'','');
            return token.update(function () { return temp })
        }
      
        // Register the pipeline function so the index can be serialised
        lunr.Pipeline.registerFunction(pipelineFunction, 'clearForHebrew')
      
        // Add the pipeline function to both the indexing pipeline and the
        // searching pipeline
        builder.pipeline.add(pipelineFunction)
        builder.searchPipeline.add(pipelineFunction)
      }

  
    var searchTerm = getQueryVariable('query');
  
    if (searchTerm) {
      document.getElementById('search-box').setAttribute("value", searchTerm);
  
      // Initalize lunr with the fields it will be searching on. I've given title
      // a boost of 10 to indicate matches on this field are more important.
      var idx = lunr(function () {
        this.field('id');
        this.field('title', { boost: 10 });
        this.field('content');
        this.pipeline.reset();
        this.use(clearForHebrew);
        for (var key in window.store) { // Add the data to lunr
            this.add({
              'id': key,
              'title': window.store[key].title,
              'content': window.store[key].content
            });
          }
      });
        var results = idx.search(searchTerm); // Get lunr to perform a search
        displaySearchResults(results, window.store); // We'll write this in the next section
    }
  })();