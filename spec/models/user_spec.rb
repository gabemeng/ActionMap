# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
    it 'is valid with valid attributes' do
        expect(User.new).to be_valid
    end

    it 'is not valid because name should be a string' do
        expect(User.new.name).to be_instance_of(String)
    end
end

RSpec.describe Representative, type: :model do
    it 'is valid with valid attributes' do
        expect(Representative.new).to be_valid
    end
end

RSpec.describe State, type: :model do
    it 'is valid with valid attributes' do
        expect(State.new).to be_valid
    end
end

RSpec.feature 'Check Routes', type: :feature do
    scenario 'User' do
        visit '/representatives'

        expect(page).to have_text('Search for a Representative')
    end

    scenario 'User' do
        visit '/representatives'

        expect(page).to have_text('Enter a location:')
    end

    scenario 'User' do
        visit '/login'
        expect(page).to have_text('Sign In')
    end

    scenario 'User' do
        visit '/'
        expect(page).to have_text('National Map')
    end
end

RSpec.feature 'More Routes', type: :feature do
    scenario 'User' do
        visit '/events'
        expect(page).to have_text('Add New Event')
    end

    scenario 'User' do
        visit '/logout'
        expect(page).to have_text('You have successfully logged out.')
    end

    scenario 'User' do
        visit '/login'
        expect(page).to have_text('Select an authentication provider below to login.')
    end

    scenario 'User' do
        visit ''
        expect(page).to have_text('National Map')
    end
end
