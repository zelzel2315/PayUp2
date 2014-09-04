payupApp.factory('Bet', ['$resource', function($resource){
	return $resource('/bets/:id', {id: '@id'},{update: {method: 'PATCH'}});
}]);