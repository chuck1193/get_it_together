json.id list.id
json.name list.name

json.tasks do
  json.array! list.tasks, partial: "api/tasks/task", as: :task
end