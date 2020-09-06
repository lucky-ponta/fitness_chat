class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
    t.string "name"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false

    end
  end
end
