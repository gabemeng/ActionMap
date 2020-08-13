# frozen_string_literal: true

Given(/the following representatives exist/) do |rep_table|
    rep_table.hashes.each do |rep|
        Representative.create rep
    end
end
