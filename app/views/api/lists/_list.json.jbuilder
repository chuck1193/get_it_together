json.id list.id
json.name list.name

json.tasks do
  json.array! list.tasks, partial: "api/tasks/task", as: :task
end

json.invited_guests do 
  json.array! list.users.each do |user|
    json.id user.id
    json.first_name user.first_name
    json.last_name user.last_name
  end
end

