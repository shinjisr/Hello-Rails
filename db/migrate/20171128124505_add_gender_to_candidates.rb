class AddGenderToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :gender, :integer
  end
end
