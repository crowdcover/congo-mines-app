class CreateCategories < ActiveRecord::Migration
  def change

    create_table :categories do |t|
      t.integer :position
      t.string :name
      t.string :aasm_state
      t.integer :parent_id

      t.timestamps null: false
    end

=begin
    current_category = nil
    current_second_tier = nil
    File.open("#{Rails.root}/db/Categories 26.3.txt").each_line do |l|

      if l !~ /^\s+/
        current_category = Category.create(name: l.strip)
        puts current_category
      else
        parts = l.split(/\t/)
        if parts[1].present?
          current_second_tier = current_category.children.create(name: l.strip)
        else
          current_second_tier.children.create(name: l.strip)
        end
      end
    end
=end
  end
end
