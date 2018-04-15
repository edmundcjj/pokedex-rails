class CreatePokemons < ActiveRecord::Migration[5.2]
  def change
    create_table :pokemons, {:id => false} do |t|
      t.integer :id, primary_key: true
      t.string :num
      t.string :name
      t.string :img
      t.string :height
      t.string :weight
      t.string :candy
      t.string :candy_count
      t.string :egg
      t.string :avg_spawns
      t.string :spawn_time

      t.timestamps
    end
  end
end
