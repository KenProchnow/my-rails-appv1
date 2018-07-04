require 'rails_helper'

=begin
run a specific file
bin/rspec/path_to_test

run all tests
bin/rspec
=end
feature 'home page' do
  scenario 'welcome' do
    visit('/')
    expect(page).to have_content('Welcome')
  end
end

