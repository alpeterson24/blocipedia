class CreateCollaborators < ActiveRecord::Migration[5.0]
  def change
    create_table :collaborators do |t|

      t.timestamps null: false
    end
  end
end
