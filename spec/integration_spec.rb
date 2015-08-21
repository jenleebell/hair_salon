require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients for it') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('name', :with =>'Augustus Succesus')
    fill_in('phone', :with =>'5038696422')
    click_button('Go')
    expect(page).to have_content('The Hair Salon :: Success')
  end
end

describe('viewing all of the stylists', {:type => :feature}) do
  it('allows a user to see all of the stylists that have been created') do
    stylist = Stylist.new({:name => 'Augustus Succesus', :phone => '5038696422', :id => 1})
    stylist.save()
    visit('/')
    click_link('View All Stylists')
    expect(page).to have_content(stylist.name)
  end
end

# describe('seeing details for a single stylist', {:type => :feature}) do
#   it('allows a user to click a stylist to see the clients and details for it') do
#     test_stylist = Stylist.new({:name => 'Sharon', :id => 1})
#     test_stylist.save()
#     test_client = Client.new({:title => "Jeff", :stylist_id => test_stylist.id()})
#     test_client.save()
#     visit('/stylists')
#     click_link(test_stylist.name())
#     expect(page).to have_content(test_client.title())
#   end
# end
#
# describe('adding clients to a stylist', {:type => :feature}) do
#   it('allows a user to add a client to a stylist') do
#     test_stylist = Stylist.new({:name => 'Sharon', :id => 1})
#     test_stylist.save()
#     visit("/stylists/#{test_stylist.id()}")
#     fill_in("title", {:with => "Jeff"})
#     click_button("Add client")
#     expect(page).to have_content("Success")
#   end
# end
