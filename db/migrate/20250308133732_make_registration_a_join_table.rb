class MakeRegistrationAJoinTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :registrations, :email, :string
    remove_column :registrations, :name, :string
    add_column :registrations, :user_id, :integer
    Registration.delete_all
  end
end
