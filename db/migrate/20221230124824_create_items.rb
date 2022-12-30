class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.string :name,             null: false, default: ""
      t.text :introduction,       null: false, default: ""

      t.timestamps
    end
  end
end
