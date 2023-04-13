class ChangeUsers < ActiveRecord::Migration[7.0]
  def change
    remove_columns :users, :name, :email
    add_column :users, :username, :string, null: false, unique: true, default: "jon" #database constraint
  end
end
