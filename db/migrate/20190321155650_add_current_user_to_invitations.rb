class AddCurrentUserToInvitations < ActiveRecord::Migration[5.2]
  def change
    add_column :invitations, :current_user, :integer
  end
end
