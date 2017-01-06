class CreateUsersAndWikis < ActiveRecord::Migration[5.0]
  def change
    add_column :collaborators, :user_id, :integer
    add_column :collaborators, :wiki_id, :integer

    add_index :collaborators, :id, unique: true
    add_index :collaborators, :user_id
    add_index :collaborators, :wiki_id
  end
end
