class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.references :payment, index: true
      t.json :signature

      t.timestamps
    end
  end
end
