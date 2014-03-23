class CreateGistEdits < ActiveRecord::Migration
  def change
    create_table :gist_edits do |t|

      t.references(:user)
      t.references(:gist)
      t.string :summary

      t.timestamps
    end
    add_index(:gist_edits, ['user_id', 'gist_id'])
  end
end
