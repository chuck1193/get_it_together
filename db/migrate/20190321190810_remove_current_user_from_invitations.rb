class RemoveCurrentUserFromInvitations < ActiveRecord::Migration[5.2]
  def change
    remove_column :invitations, :current_user, :integer
  end
end
