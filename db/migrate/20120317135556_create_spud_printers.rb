class CreateSpudPrinters < ActiveRecord::Migration
  def change
    create_table :spud_printers do |t|
      t.string :name
      t.string :access_token
      t.string :status
      t.boolean :active

      t.timestamps
    end
  end
end
