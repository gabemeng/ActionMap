# frozen_string_literal: true

class Ratings < ApplicationRecord
    belongs_to :news_item
    belongs_to :user
end
