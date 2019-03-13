json.id user.id
json.first_name user.first_name
json.last_name user.last_name
json.email user.email

json.lists do
  json.array! user.lists, partial: 'api/lists/list', as: :list
end

# json.lists do
#   json.array! user.tasks.each do |list|
#     json.id list.id
#     json.name list.name
#   end
# end
