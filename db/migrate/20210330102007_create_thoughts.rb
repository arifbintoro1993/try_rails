class CreateThoughts < ActiveRecord::Migration[6.1]
  def change
    create_table :thoughts do |t|
      t.string :idea
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
