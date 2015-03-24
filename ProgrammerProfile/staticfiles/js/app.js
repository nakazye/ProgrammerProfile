(function() {
  var Foo;

  Foo = (function() {
    var $;

    function Foo() {}

    $ = require('jquery');

    Foo.prototype.name = function() {
      return 'Foo';
    };

    return Foo;

  })();

  module.exports = Foo;

}).call(this);

//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbImFwcC5jb2ZmZWUiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6IkFBQUE7QUFBQSxNQUFBLEdBQUE7O0FBQUEsRUFBTTtBQUNKLFFBQUEsQ0FBQTs7cUJBQUE7O0FBQUEsSUFBQSxDQUFBLEdBQUksT0FBQSxDQUFRLFFBQVIsQ0FBSixDQUFBOztBQUFBLGtCQUNBLElBQUEsR0FBTSxTQUFBLEdBQUE7YUFDSixNQURJO0lBQUEsQ0FETixDQUFBOztlQUFBOztNQURGLENBQUE7O0FBQUEsRUFJQSxNQUFNLENBQUMsT0FBUCxHQUFpQixHQUpqQixDQUFBO0FBQUEiLCJmaWxlIjoiYXBwLmpzIiwic291cmNlUm9vdCI6Ii9zb3VyY2UvIiwic291cmNlc0NvbnRlbnQiOlsiY2xhc3MgRm9vXG4gICQgPSByZXF1aXJlKCdqcXVlcnknKVxuICBuYW1lOiAtPlxuICAgICdGb28nXG5tb2R1bGUuZXhwb3J0cyA9IEZvb1xuIl19