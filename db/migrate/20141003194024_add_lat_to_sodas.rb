class AddLatToSodas < ActiveRecord::Migration
  def change
    add_column :sodas, :lat, :float
  end
end
