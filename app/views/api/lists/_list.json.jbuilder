# json.user_id task. user_id
json.id list.id
json.name list.name

json.tasks do
  json.array! list.tasks.each do |task|
    json.id task.id
    json.name task.name
    json.content task.content
    json.priority task.priority
    json.status task.status
    json.list_id task.list_id
  end
end