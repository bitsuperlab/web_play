angular.module("app").controller "CreateWalletController", ($scope, $rootScope, $uibModal, $log, $location, Idle, RpcService, Wallet, Growl) ->
    $rootScope.splashpage = true

    Idle.unwatch()

    $scope.wallet_name = "default"
    $scope.spending_password = ""
    $scope.descriptionCollapsed = true

    $scope.submitForm = (isValid, password) ->
        if isValid
            promise = Wallet.create($scope.wallet_name, password, "")
            promise.then ->
                $location.path("/create/account")
            $rootScope.showLoadingIndicator promise
        else
            Growl.error "", "Unable to create a wallet. Please fill up the form below."

    $scope.$on "$destroy", ->
        $rootScope.splashpage = false
        $scope.startIdleWatch()
