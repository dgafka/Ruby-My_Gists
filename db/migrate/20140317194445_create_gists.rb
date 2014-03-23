class CreateGists < ActiveRecord::Migration
  def change
    create_table :gists do |t|
      t.text :snippet
      t.references(:language)
      t.string :description

      t.timestamps
    end
  end
end
