class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :loggable,    polymorphic: true
      t.references :responsible, polymorphic: true
      t.text       :description
      t.datetime   :deleted_at

      t.timestamps null: false
    end

    add_index :logs, :deleted_at, where: "deleted_at IS NULL"
    add_index :logs, :loggable_id
  end
end