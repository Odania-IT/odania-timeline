app.controller('OdaniaTimelineEditTimelineController', ['$location', '$scope', '$rootScope', 'OdaniaTimelineTimelineResource', '$routeParams', 'eventTypeProvider', function ($location, $scope, $rootScope, OdaniaTimelineTimelineResource, $routeParams, eventTypeProvider) {
	console.log("controller :: OdaniaTimelineEditTimelineController");
	var timelineId = null;

	function loadTimeline(id) {
		OdaniaTimelineTimelineResource.get({id: id}).$promise.then(function (data) {
			$scope.timeline = data.timeline;

			var contents;
			for (var i=0 ; i<$scope.timeline.timeline_contents.length ; i++) {
				contents = $scope.timeline.timeline_contents[i];
				contents.from_date = new Date(parseInt(contents.from_date));
				contents.to_date = new Date(parseInt(contents.to_date));
			}
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
			'is_public': $scope.timeline.is_public,
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
