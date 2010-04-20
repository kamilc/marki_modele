class CreateMarkaModels < ActiveRecord::Migration
  def self.up
    create_table :marka_models do |t|
      t.string :marka
      t.string :model

      t.timestamps
    end
  end

  def self.down
    drop_table :marka_models
  end
end
