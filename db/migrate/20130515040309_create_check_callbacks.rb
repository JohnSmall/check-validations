class CreateCheckCallbacks < ActiveRecord::Migration
  def change
    create_table :check_callbacks do |t|
      t.string :name

      t.timestamps
    end
  end
end
