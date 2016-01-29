class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string :user
      t.string :type
      t.string :message
      t.string :otheruser

      t.timestamps null: false
    end
  end
end
