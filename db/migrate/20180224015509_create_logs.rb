class CreateLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :logs do |t|
      t.string :browser
      t.string :address
      t.string :controller
      t.string :action
      t.string :requestAt

      t.timestamps
    end
  end
end
