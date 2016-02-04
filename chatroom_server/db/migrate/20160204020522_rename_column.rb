class RenameColumn < ActiveRecord::Migration
  def change
    rename_column :events, :highfives, :highfives_count
  end
end
