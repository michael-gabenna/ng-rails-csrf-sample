mod = angular.module( "MyModule", [ 'ngResource', 'ng-rails-csrf' ] )

mod.factory 'Invite', [ '$resource', ($resource) ->
        $resource '/invites/:id/:action', {},
        send_invite: { isArray: false, method: 'POST', params: { action: 'send_invite' } }
         ]

mod.controller 'InviteCtrl', [ '$scope', 'Invite', ($scope, Invite) ->
        $scope.initialize = () ->
                $scope.invites = Invite.query()
        
        $scope.sendInvite = () ->
                if true || $scope.content
                        $scope.loading = true
                        
                        Invite.send_invite {}, { invite: { content: $scope.content } }, (response) ->
                                $scope.content = ""
                                $scope.loading = false
                                $scope.invites = Invite.query()
                else
                        alert "Please enter something into the text field"
        ]