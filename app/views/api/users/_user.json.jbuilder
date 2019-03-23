json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.email user.email

json.lists do
  json.array! user.lists, partial: 'api/lists/list', as: :list
end

json.tasks do
  json.array! user.tasks, partial: 'api/tasks/task', as: :task
end




