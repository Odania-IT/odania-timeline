app.controller('OdaniaTimelineTimelineController', ['$scope', 'OdaniaTimelineTimelineResource', '$routeParams', function ($scope, OdaniaTimelineTimelineResource, $routeParams) {
	console.log("controller :: OdaniaTimelineTimelineController");

	function loadTimeline(id) {
		OdaniaTimelineTimelineResource.get({id: id}).$promise.then(function (data) {
			$scope.timeline = data.timeline;
		});
	}

	loadTimeline($routeParams.id);
}]);
