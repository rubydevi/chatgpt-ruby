class CreateMessages < ActiveRecord::Migration[7.1]
  def change
    create_table :messages do |t|
      t.text :message
      t.text :reply
      t.references :user, null: false, foreign_key: true
      t.references :conversation, null: false, foreign_key: { to_table: :conversations }

      t.timestamps
    end
  end
end
