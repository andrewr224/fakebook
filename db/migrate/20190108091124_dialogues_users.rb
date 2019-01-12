class DialoguesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :dialogues_users, id: false do |t|
      t.references :user,     index: true, foreign_key: true
      t.references :dialogue, index: true, foreign_key: true
    end
  end
end
