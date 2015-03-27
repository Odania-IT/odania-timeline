json.timeline do
	json.partial! partial: 'protected/api/odania_timeline/timelines/show', locals: {timeline: @timeline}
end
