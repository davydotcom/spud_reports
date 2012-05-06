class CreateSpudPrintJobs < ActiveRecord::Migration
  def change
    create_table :spud_print_jobs do |t|
      t.string :name
      t.integer :spud_printer_id
      t.integer :status
      t.integer :pages
      t.string :attachment_content_type
      t.integer :attachment_file_size
      t.string :attachment_file_name
      t.integer :user_id

      t.timestamps
    end
  end
end
