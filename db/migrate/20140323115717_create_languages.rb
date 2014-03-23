class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|

      t.string "name", :null => false, :limit => 30;
      t.integer "difficulty", :limit => 2;

      t.timestamps
    end
  end
end
