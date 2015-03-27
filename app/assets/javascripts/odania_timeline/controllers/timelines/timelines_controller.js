app.controller('OdaniaTimelineTimelinesController', ['$rootScope', '$scope', 'OdaniaTimelineTimelineResource', 'eventTypeProvider', '$location', function ($rootScope, $scope, OdaniaTimelineTimelineResource, eventTypeProvider, $location) {
	console.log("controller :: OdaniaTimelineTimelinesController");

	function loadTimelines() {
		OdaniaTimelineTimelineResource.get().$promise.then(function (data) {
			$scope.timelines = data.timelines;
		});
	}

	$scope.deleteTimeline = function (id) {
		OdaniaTimelineTimelineResource.delete({id: id}).$promise.then(function () {
			loadTimelines();
		});
	};
	$scope.timelines = [];

	loadTimelines();
}]);
