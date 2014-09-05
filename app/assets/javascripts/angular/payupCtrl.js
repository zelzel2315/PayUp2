payupApp.controller('payupCtrl', [
	'$scope', 'Bet',
	 function($scope, Bet){
	$scope.test = 'does this work?';
	$scope.bets = {};

	$scope.newBet = new Bet();

	Bet.query(function(json){
		$scope.bets = json;
	});

	$scope.addBet = function(){
			if($scope.betForm.$pristine !== true){
				$scope.newBet.$save(function(){
					$scope.bets.push($scope.newBet);
					$scope.newBet = new Bet ();
					$scope.betForm.$pristine = true;
			});
		}
	};

	}
	
	function Cntrl ($scope,$location) {
        $scope.changeView = function(view){
            $location.path(view); // path not hash
        }
    };

	// $scope.destroyBet = function(bet){
	// 	bet.$delete(function(){
	// 		var position = $scope.bets.indexOf(bet);
	// 		$scope.bets.splice(position, 1);
	// 	});
	// };
]);

