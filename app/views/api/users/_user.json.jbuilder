json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.email user.email

json.my_lists do
  json.array! user.lists, partial: 'api/lists/list', as: :list
end

json.invited_lists do
  json.array! user.invited_lists, partial: 'api/lists/list', as: :list
end

json.tasks do
  json.array! user.tasks, partial: 'api/tasks/task', as: :task
end

json.invitations do
  json.array! user.invitations, partial: 'api/invitations/invitation', as: :invitation
end

# json.status tasks.status.complete.count

