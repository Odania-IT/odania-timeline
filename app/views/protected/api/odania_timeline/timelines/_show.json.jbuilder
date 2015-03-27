json.id timeline.id
json.title timeline.title
json.language_id timeline.language_id

json.timeline_contents timeline.timeline_contents, partial: 'protected/api/odania_timeline/timeline_contents/show', as: :timeline_content
