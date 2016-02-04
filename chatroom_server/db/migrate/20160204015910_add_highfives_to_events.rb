class AddHighfivesToEvents < ActiveRecord::Migration
  def change
    add_column :events, :highfives, :integer
  end
end
