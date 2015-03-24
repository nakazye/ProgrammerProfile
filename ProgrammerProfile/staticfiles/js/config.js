(function() {
  var require;

  require = {
    baseUrl: '../',
    paths: {
      jquery: 'lib/js/jquery',
      jqueryui: 'lib/js/jquery-ui',
      underscore: 'lib/js/underscore',
      backbone: 'lib/js/backbone',
      marionette: 'lib/js/backbone.marionette',
      babysitter: 'lib/js/backbone.babysitter',
      wreqr: 'lib/js/backbone.wreqr',
      bootstrap: 'lib/js/bootstrap'
    },
    shim: {
      underscore: {
        exports: '_'
      },
      jquery: {
        exports: '$'
      },
      backbone: {
        deps: ["jquery", "underscore"],
        exports: "Backbone"
      },
      marionette: {
        deps: ["backbone"],
        exports: "Backbone"
      },
      bootstrap: {
        deps: ["jquery"]
      }
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImNvbmZpZy5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFBQSxNQUFBLE9BQUE7O0FBQUEsRUFBQSxPQUFBLEdBQ0U7QUFBQSxJQUFBLE9BQUEsRUFBUyxLQUFUO0FBQUEsSUFDQSxLQUFBLEVBQ0U7QUFBQSxNQUFBLE1BQUEsRUFBWSxlQUFaO0FBQUEsTUFDQSxRQUFBLEVBQVksa0JBRFo7QUFBQSxNQUVBLFVBQUEsRUFBWSxtQkFGWjtBQUFBLE1BR0EsUUFBQSxFQUFZLGlCQUhaO0FBQUEsTUFJQSxVQUFBLEVBQVksNEJBSlo7QUFBQSxNQUtBLFVBQUEsRUFBWSw0QkFMWjtBQUFBLE1BTUEsS0FBQSxFQUFZLHVCQU5aO0FBQUEsTUFPQSxTQUFBLEVBQVksa0JBUFo7S0FGRjtBQUFBLElBV0EsSUFBQSxFQUNFO0FBQUEsTUFBQSxVQUFBLEVBQ0U7QUFBQSxRQUFBLE9BQUEsRUFBUyxHQUFUO09BREY7QUFBQSxNQUVBLE1BQUEsRUFDRTtBQUFBLFFBQUEsT0FBQSxFQUFTLEdBQVQ7T0FIRjtBQUFBLE1BSUEsUUFBQSxFQUNFO0FBQUEsUUFBQSxJQUFBLEVBQU0sQ0FBQyxRQUFELEVBQVcsWUFBWCxDQUFOO0FBQUEsUUFDQSxPQUFBLEVBQVMsVUFEVDtPQUxGO0FBQUEsTUFPQSxVQUFBLEVBQ0U7QUFBQSxRQUFBLElBQUEsRUFBTSxDQUFDLFVBQUQsQ0FBTjtBQUFBLFFBQ0EsT0FBQSxFQUFTLFVBRFQ7T0FSRjtBQUFBLE1BVUEsU0FBQSxFQUNFO0FBQUEsUUFBQSxJQUFBLEVBQU0sQ0FBQyxRQUFELENBQU47T0FYRjtLQVpGO0dBREYsQ0FBQTtBQUFBIiwiZmlsZSI6ImNvbmZpZy5qcyIsInNvdXJjZVJvb3QiOiIvc291cmNlLyIsInNvdXJjZXNDb250ZW50IjpbInJlcXVpcmUgPVxuICBiYXNlVXJsOiAnLi4vJ1xuICBwYXRoczpcbiAgICBqcXVlcnkgICAgOiAnbGliL2pzL2pxdWVyeSdcbiAgICBqcXVlcnl1aSAgOiAnbGliL2pzL2pxdWVyeS11aSdcbiAgICB1bmRlcnNjb3JlOiAnbGliL2pzL3VuZGVyc2NvcmUnXG4gICAgYmFja2JvbmUgIDogJ2xpYi9qcy9iYWNrYm9uZSdcbiAgICBtYXJpb25ldHRlOiAnbGliL2pzL2JhY2tib25lLm1hcmlvbmV0dGUnXG4gICAgYmFieXNpdHRlcjogJ2xpYi9qcy9iYWNrYm9uZS5iYWJ5c2l0dGVyJ1xuICAgIHdyZXFyICAgICA6ICdsaWIvanMvYmFja2JvbmUud3JlcXInXG4gICAgYm9vdHN0cmFwIDogJ2xpYi9qcy9ib290c3RyYXAnXG5cbiAgc2hpbTpcbiAgICB1bmRlcnNjb3JlOlxuICAgICAgZXhwb3J0czogJ18nXG4gICAganF1ZXJ5OlxuICAgICAgZXhwb3J0czogJyQnXG4gICAgYmFja2JvbmU6XG4gICAgICBkZXBzOiBbXCJqcXVlcnlcIiwgXCJ1bmRlcnNjb3JlXCJdXG4gICAgICBleHBvcnRzOiBcIkJhY2tib25lXCJcbiAgICBtYXJpb25ldHRlOlxuICAgICAgZGVwczogW1wiYmFja2JvbmVcIl1cbiAgICAgIGV4cG9ydHM6IFwiQmFja2JvbmVcIlxuICAgIGJvb3RzdHJhcDpcbiAgICAgIGRlcHM6IFtcImpxdWVyeVwiXVxuIl19