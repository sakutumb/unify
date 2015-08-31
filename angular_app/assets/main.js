'use strict';

var unifyModule = angular.module('UnifyApp', [
        'ui.router',
        'ui.bootstrap.showErrors',
        'checklist-model',
        'localytics.directives', // The "chosen" component used in the inbox tab
        'ngFileUpload', // The file upload is used in the compose section of the inbox tab to attach files
        'ngAnimate'
    ]).
    constant('appConstants', {
        // All app constants goes here
        APP_CONFIG          : APP_CONFIG,
        authenticity_token  : FORM_AUTHENTICITY_TOKEN, // Defined at layout level
        LOGIN_URL           : '/app/services/login',
        REGISTRATION_URL    : '/app/services/register',
        DIM_DATA_URL        : '/app/services/get_dim_data',
        FILTER_DATA_URL        : '/app/services/get_filter_data',
        LINKEDIN_PROFILE_SAVE_URL   : '/app/services/save_linkedin_profile',
        FB_PROFILE_SAVE_URL         : '/app/services/save_fb_profile',
        SUPPORTED_LOCALES        : [{"id":1,"name":"en-US"}]
    }).
    config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
        function ($stateProvider, $urlRouterProvider, $locationProvider) {
            $locationProvider.html5Mode({
                enabled: true,
                requireBase: false
            });
            $urlRouterProvider.otherwise('/');
            $stateProvider.state('index', {
                url: '/index.html',
                views: {
                    'index': {
                        controller: 'IndexCtrl',
                        templateUrl: '/assets/templates/index.html'
                    },
                    'hero@index': {
                        controller: 'HeroCtrl',
                        templateUrl: '/assets/partials/hero.html'
                    },
                    'features@index': {
                        templateUrl: '/assets/partials/features.html'
                    },
                    'faq@index': {
                        templateUrl: '/assets/partials/common/faq.html'
                    },
                    'footer@index': {
                        templateUrl: '/assets/partials/common/footer.html'
                    }
                }
            }).state('index.login', {
                url: 'login',
                views: {
                    'login': {
                        controller: 'LoginCtrl',
                        templateUrl: '/assets/partials/common/login.html'
                    }
                }
            }).state('index.register', {
                url: 'register',
                views: {
                    'register': {
                        controller: 'RegistrationCtrl',
                        templateUrl: '/assets/partials/bureau/registration.html'
                    }
                }
            }).state('search', {
                url: '/search.html',
                views: {
                    'search': {
                        controller: 'SearchCtrl',
                        templateUrl: '/assets/templates/search.html'
                    },
                    'header@search': {
                        templateUrl: '/assets/partials/search/header.html'
                    },
                    'quick-search@search': {
                        templateUrl: '/assets/partials/search/quick-search.html'
                    },
                    'sidebar@search': {
                        templateUrl: '/assets/partials/search/sidebar.html'
                    },
                    'results@search': {
                        templateUrl: '/assets/partials/search/results.html'
                    },
                    'search-filters@search': {
                        templateUrl: '/assets/partials/search/search-filters.html'
                    },
                    'footer@search': {
                        templateUrl: '/assets/partials/common/footer.html'
                    }
                }
            }).state('prospect', {
                url: '/prospect.html',
                views: {
                    'prospect': {
                        controller: 'ProspectCtrl',
                        templateUrl: '/assets/templates/prospect.html'
                    },
                    'header@prospect': {
                        templateUrl: '/assets/partials/prospect/header.html'
                    },
                    'main@prospect': {
                        templateUrl: '/assets/partials/prospect/main.html'
                    },
                    'social@prospect': {
                        controller: 'SocialCtrl',
                        templateUrl: '/assets/partials/social/social.html'
                    },
                    'footer@prospect': {
                        templateUrl: '/assets/partials/common/footer.html'
                    }
                }
            }).state('bureau', {
                url: '/bureau.html',
                views: {
                    'bureau': {
                        controller: 'IndexCtrl',
                        templateUrl: '/assets/templates/bureau.html'
                    },
                    'header@bureau': {
                        templateUrl: '/assets/partials/bureau/header.html'
                    },
                    'hero@bureau': {
                        templateUrl: '/assets/partials/bureau/hero.html'
                    },
                    'success@bureau': {
                        templateUrl: '/assets/partials/bureau/success.html'
                    },
                    'candidates@bureau': {
                        templateUrl: '/assets/partials/bureau/candidates.html'
                    },
                    'faq@bureau': {
                        templateUrl: '/assets/partials/common/faq.html'
                    },
                    'footer@bureau': {
                        templateUrl: '/assets/partials/common/footer.html'
                    }
                }
            }).state('bureau.login', {
                url: '/login',
                views: {
                    'login': {
                        controller: 'LoginCtrl',
                        templateUrl: '/assets/partials/common/login.html'
                    }
                }
            }).state('bureau.register', {
                url: '/register',
                views: {
                    'register': {
                        controller: 'RegistrationCtrl',
                        templateUrl: '/assets/partials/bureau/registration.html'
                    }
                }
            }).state('product', {
                // the angularjs_product is temporary to host in the ftp
                url: '/angularjs_product/product.html',
                views: {
                    'product': {
                        controller: 'ProductCtrl',
                        templateUrl: 'assets/templates/product.html'
                    },
                    'menulist@product': {
                        controller: 'ProductMenuCtrl',
                        templateUrl: 'assets/partials/product/menulist.html'
                    }
                }
            // The product tabs
            }).state('product.dashboard', {
              controller: 'DashboardCtrl',
              templateUrl: 'assets/partials/product/dashboard.html'
            }).state('product.clients', {
              controller: 'ClientCtrl',
              templateUrl: 'assets/partials/product/clients.html'
            }).state('product.addclients', {
              controller: 'AddClientsCtrl',
              templateUrl: 'assets/partials/product/addclients.html'

            }).state('product.search', {
              controller: 'ProductSearchCtrl',
              templateUrl: 'assets/partials/product/search.html'
            }).state('product.search.appearance', {
              templateUrl: 'assets/partials/product/search/appearance.html'
            }).state('product.search.basic', {
              templateUrl: 'assets/partials/product/search/basic.html'
            }).state('product.search.habits', {
              templateUrl: 'assets/partials/product/search/habits.html'
            }).state('product.search.horoscope', {
              templateUrl: 'assets/partials/product/search/horoscope.html'

            }).state('product.inbox', {
              controller: 'InboxCtrl',
              templateUrl: 'assets/partials/product/inbox.html'
            }).state('product.inbox.compose', {
              controller: 'ComposeCtrl',
              templateUrl: 'assets/partials/product/inbox/compose.html'
            }).state('product.inbox.inbox', {
              controller: 'InboxMessagesCtrl',
              templateUrl: 'assets/partials/product/inbox/inbox.html'
            }).state('product.inbox.sent', {
              controller: 'InboxMessagesCtrl',
              templateUrl: 'assets/partials/product/inbox/inbox.html'
            }).state('product.inbox.shortlisted', {
              controller: 'InboxMessagesCtrl',
              templateUrl: 'assets/partials/product/inbox/inbox.html'
             }).state('product.inbox.notinterested', {
              controller: 'InboxMessagesCtrl',
              templateUrl: 'assets/partials/product/inbox/inbox.html'
             }).state('product.inbox.trash', {
              controller: 'InboxMessagesCtrl',
              templateUrl: 'assets/partials/product/inbox/inbox.html'

            }).state('product.account', {
                controller: 'AccountCtrl',
                templateUrl: 'assets/partials/product/account.html'
            });

        }]).run(['$rootScope', '$timeout',
        function($rootScope, $timeout) {
            $rootScope.loginFormVisible = false;
            $rootScope.registrationFormVisible = false;
            $rootScope.hasUserLoggedIn = IS_VALID_SESSION;
            //Utility function to animate scroll to a section of a page
            $rootScope.scrollToSection = function(sectionId){
                if($(sectionId)){
                    $timeout(
                        function () {
                            $('html, body').animate({
                                scrollTop: $(sectionId).offset().top - 2
                            }, 1000);
                        }
                    );
                }
            };
        }]);