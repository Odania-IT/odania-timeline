app.factory('OdaniaTimelineTimelineResource', ['$resource', function ($resource) {
	var basePath = config.getApiPath('odania_timeline/timelines/:id');

	return $resource(basePath, {
		'id': '@id'
	}, {
		'update': {
			'method': 'PUT'
		}
	});
}]);
