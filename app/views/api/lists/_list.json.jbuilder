json.id list.id
json.name list.name

json.pending_tasks do
  json.array! list.tasks.pending, partial: "api/tasks/task", as: :task
end

json.complete_tasks do
  json.array! list.tasks.complete, partial: "api/tasks/task", as: :task
end

json.invited_guests do 
  json.array! list.users.each do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
  end
end

