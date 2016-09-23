class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :price
    end
  end
end
