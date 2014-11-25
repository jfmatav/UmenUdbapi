class RemoveAcompanamientosFromAcompanamientos < ActiveRecord::Migration
  def change
    remove_column :acompanamientos, :acompanamientos, :text
  end
end
