json.id timeline.id
json.title timeline.title
json.language_id timeline.language_id
json.is_public timeline.is_public

json.timeline_contents timeline.timeline_contents.order('from_date DESC'), partial: 'protected/api/odania_timeline/timeline_contents/show', as: :timeline_content
