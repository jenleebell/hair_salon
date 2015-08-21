require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get("/stylists/new") do
  erb(:stylist_form)
end

post('/stylists') do
  name = params.fetch('name')
  phone = params.fetch('phone')
  stylist = Stylist.new({:name => name, :phone => phone, :id => nil})
  stylist.save()
  erb(:success)
end

get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist)
end

post("/clients") do
  name = params.fetch("name")
  phone = params.fetch('phone')
  client_id = params.fetch("client_id").to_i()
  @stylist = Stylist.find(client_id)
  @client = Client.new({:name => name, :phone => phone, :client_id => client_id})
  @client.save()
  erb(:success)
end

get("/stylists/:id/edit") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:stylist_edit)
end

patch("/stylists/:id") do
  name = params.fetch("name")
  phone = params.fetch("phone")
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.update({:name => name, :phone => phone})
  erb(:stylist)
end

delete("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  @stylist.delete()
  @stylists = Stylist.all()
end
