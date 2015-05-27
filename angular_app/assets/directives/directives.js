'use strict';

angular.module('UnifyApp')

.directive("compareTo", function() {
    return {
        require: "ngModel",
        scope: {
            otherModelValue: "=compareTo"
        },
        link: function(scope, element, attributes, ngModel) {

            ngModel.$validators.compareTo = function(modelValue) {
                return modelValue == scope.otherModelValue;
            };

            scope.$watch("otherModelValue", function() {
                ngModel.$validate();
            });
        }
    };
})

// Directive to create a list of checkbox with validation
.directive('checkboxList', function () {
    return {
        restrict: 'A',
        replace: true,
        require: 'ngModel',
        scope: {
            items: '=',
            value: '@',
            label: '@'
        },
        template: '<span><label ng-repeat="item in list">' +
            '<input type="checkbox" value="{{item.value}}" ng-checked="item.checked" ng-click="toggle($index)"/>' +
          '{{item.label}}' +
          '</label></br></span>',
        link: function(scope, elm, attrs, ctrl) {

            ctrl.$validators.required =  function(modelValue) {
                return modelValue.length > 0;
            };

            scope.toggle = function (index) {
                ctrl.$setTouched();
                var item = scope.list[index],
                  i = ctrl.$viewValue.indexOf(item.value);
                item.checked = !item.checked;
                if (!item.checked && i > -1) {
                  ctrl.$viewValue.splice(i, 1);
                } else if (item.checked && i < 0) {
                  ctrl.$viewValue.push(item.value);
                }
                ctrl.$validate();
            };
            scope.$watch('items', function (value) {
                scope.list = [];
                if (angular.isArray(value)) {
                    angular.forEach(value, function (item) {
                        scope.list.push({
                            value: item[scope.value],
                            label: item[scope.label],
                            checked: ctrl.$modelValue.indexOf(item[scope.value]) > -1
                        });
                    });
                }
            }, true);
        }
    };
})

// Directive to compile the html, see https://docs.angularjs.org/api/ng/service/$compile
.directive('compile', function($compile) {
    // directive factory creates a link function
    return function(scope, element, attrs) {
        scope.$watch(
            function(scope) {
             // watch the 'compile' expression for changes
            return scope.$eval(attrs.compile);
            },
            function(value) {
                // when the 'compile' expression changes
                // assign it into the current DOM
                element.html(value);
                // compile the new DOM and link it to the current scope.
                $compile(element.contents())(scope);
            }
        );
    };
})

// Directive to upload file
// See more here https://stackoverflow.com/questions/17063000/ng-model-for-input-type-file
.directive("fileread", [function () {
    return {
        scope: {
            fileread: "="
        },
        link: function (scope, element, attributes) {
            element.bind("change", function (changeEvent) {
                var reader = new FileReader();
                reader.onload = function (loadEvent) {
                    scope.$apply(function () {
                        scope.fileread = loadEvent.target.result;
                    });
                }
                reader.readAsDataURL(changeEvent.target.files[0]);
            });
        }
    }
}]);