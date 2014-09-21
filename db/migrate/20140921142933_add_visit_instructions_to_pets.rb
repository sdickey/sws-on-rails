class AddVisitInstructionsToPets < ActiveRecord::Migration
  def change
    add_column :pets, :visit_instructions, :text
  end
end
