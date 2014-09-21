class AddFoodInstructionsToPets < ActiveRecord::Migration
  def change
    add_column :pets, :food_instructions, :text
  end
end
