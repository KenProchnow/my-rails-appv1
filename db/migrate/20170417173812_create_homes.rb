class CreateHomes < ActiveRecord::Migration[5.0]
  def up
    create_table :homes do |t|
      t.string :title
      t.string :note

      t.timestamps
    end
  end

  def down
    drop_table :homes
  end
end
