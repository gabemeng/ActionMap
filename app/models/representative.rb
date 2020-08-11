# frozen_string_literal: true

class Representative < ApplicationRecord
    has_many :news_items, dependent: :delete_all

    def self.civic_api_to_representative_params(rep_info)
        reps = []

        rep_info.officials.each_with_index do |official, index|
            ocdid_temp = ''
            title_temp = ''
            temp_street = ''
            temp_city = ''

            rep_info.offices.each do |office|
                if office.official_indices.include? index
                    title_temp = office.name
                    ocdid_temp = office.division_id
                end
            end

            rep = get_data(official, title_temp, ocdid_temp, temp_street, temp_city)
            reps.push(rep)
        end

        reps
    end

    def self.get_data(official, title, temp_id, temp_street, temp_city)
        temp_state = ''
        temp_zip = ''
        # official.address returns a list
        return no_address(official, title, temp_id) if official.address.nil?

        official.address.each do |addy|
            temp_street = addy.line1
            temp_city = addy.city
            temp_state = addy.state
            temp_zip = addy.zip
        end
        Representative.create!({ name: official.name, ocdid: temp_id,
                    title: title, party: official.party, photo: official.photo_url,
                    street: temp_street, city: temp_city, state: temp_state,
                    zip: temp_zip })
    end

    def self.no_address(official, title, temp_id)
        Representative.create!({ name: official.name, ocdid: temp_id,
                    title: title, party: official.party, photo: official.photo_url,
                    street: '', city: '', state: '',
                    zip: '' })
    end
end
