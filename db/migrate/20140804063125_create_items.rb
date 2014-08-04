class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name, null: false, default: ''
      t.attachment :picture

      t.timestamps
    end
  end
end
