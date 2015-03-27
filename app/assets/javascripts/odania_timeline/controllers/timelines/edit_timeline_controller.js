app.controller('OdaniaTimelineEditTimelineController', ['$location', '$scope', '$rootScope', 'OdaniaTimelineTimelineResource', '$routeParams', 'eventTypeProvider', function ($location, $scope, $rootScope, OdaniaTimelineTimelineResource, $routeParams, eventTypeProvider) {
	console.log("controller :: OdaniaTimelineEditTimelineController");
	var timelineId = null;

	function loadTimeline(id) {
		OdaniaTimelineTimelineResource.get({id: id}).$promise.then(function (data) {
			$scope.timeline = data.timeline;
		});
	}

	function onSaveSuccess() {
		$location.path('/odania_timeline/timelines');
	}

	function onSaveError(data) {
		console.log("errors", data);
		$scope.errors = data.data.errors;
	}

	$scope.saveTimeline = function () {
		var data = {
			'title': $scope.timeline.title,
			'timeline_contents_attributes': $scope.timeline.timeline_contents
		};

		if (timelineId) {
			OdaniaTimelineTimelineResource.update({
				id: timelineId,
				timeline: data
			}).$promise.then(onSaveSuccess, onSaveError);
		} else {
			OdaniaTimelineTimelineResource.save({timeline: data}).$promise.then(onSaveSuccess, onSaveError);
		}
	};

	$scope.addEntryToTimeline = function () {
		$scope.timeline.timeline_contents.push({});
	};

	$scope.timeline = {
		'title': '',
		'timeline_contents': []
	};

	if ($routeParams.id) {
		timelineId = $routeParams.id;
		loadTimeline(timelineId);
	}
}]);
