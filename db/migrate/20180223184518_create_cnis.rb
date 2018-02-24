class CreateCnis < ActiveRecord::Migration[5.1]
  def change
    create_table :cnis do |t|
      t.string :name
      t.string :secondName
      t.string :numeroRecepisse

      t.timestamps
    end
  end
end
