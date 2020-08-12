# frozen_string_literal: true

class CreateRatings < ActiveRecord::Migration[5.2]
    def change
        create_table :ratings do |t|
            t.string :rating
            t.timestamps null: false
        end
    end
end
