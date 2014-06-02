angular.module("app").controller "CreateWalletController", ($scope, $modal, $log, RpcService, ErrorService, Wallet) ->
  #Uncomment when we start supporting brain wallets
  #$scope.isCollapsed = true
  $scope.wallet_name = "default"
  $scope.submitForm = (isValid) ->
    alert isValid
    if isValid
      Wallet.create($scope.wallet_password, $scope.spending_password).success ->
        window.location.href = "/"
    else
      ErrorService.set "Please fill up the form below"
      return
{"id": 1, "result": [
  {"block_num": 574, "trx_num": 0, "trx_id": "c221246182bd73cb80a76d2749eeb6bdd6f50acb", "created_time": 0, "received_time": 1401732930, "amount": {"amount": 10000000, "asset_id": 0}, "fees": 0, "to_account": "", "from_account": "XTS8JkhkfPQSxPd7VUiqdDDx9SiPALrbrUFyptFbCMHoAYaLSicPy", "memo_message": "Some millions       "}
]}


{"id": 1, "result": [
  {"block_num": 574, "trx_num": 0, "trx_id": "c221246182bd73cb80a76d2749eeb6bdd6f50acb", "created_time": 0, "received_time": 1401732930, "amount": {"amount": 10000000, "asset_id": 0}, "fees": 0, "to_account": "", "from_account": "XTS8JkhkfPQSxPd7VUiqdDDx9SiPALrbrUFyptFbCMHoAYaLSicPy", "memo_message": "Some millions"}
]}