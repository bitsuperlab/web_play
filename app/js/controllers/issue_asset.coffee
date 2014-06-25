angular.module("app").controller "IssueAssetController", ($scope, $location, $stateParams, RpcService, Wallet, Growl, Shared, BlockchainAPI, Utils, Blockchain) ->
    $scope.issue_asset = 
        amount : 0.0
        symbol : ""
        to : Shared.contactName
        memo : ""

    $scope.issue = ->
        RpcService.request('wallet_asset_issue', [$scope.issue_asset.amount, $scope.issue_asset.symbol, $scope.issue_asset.to, $scope.issue_asset.memo]).then (response) ->
          $scope.issue_asset.amount = 0.0
          $scope.issue_asset.to = Shared.contactName
          $scope.issue_asset.memo = ""
          Growl.notice "", "Transaction broadcasted (#{JSON.stringify(response.result)})"
          Wallet.refresh_transactions_on_update()

    $scope.utils = Utils

    Blockchain.get_config().then (config) ->
        $scope.memo_size_max = config.memo_size_max

    

    # TODO, for init the default symbol, have to do two rpc calls, refactor this
    BlockchainAPI.list_registered_assets("", -1).then (result) =>
            asset_ids = []
            for asset in result
                asset_ids.push [asset.issuer_account_id]

            RpcService.request("batch", ["blockchain_get_account_record_by_id", asset_ids]).then (response) ->
                accounts = response.result
                for i in [0...accounts.length]
                    if accounts[i] and accounts[i].name == $scope.$parent.name
                        $scope.issue_asset.symbol = result[i].symbol
                        break
