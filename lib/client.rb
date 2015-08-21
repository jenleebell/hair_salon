class Client
  attr_reader(:name, :phone, :stylist_id, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @stylist_id = attr.fetch(:stylist_id)
    @id = attr.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      phone = client.fetch("phone")
      stylist_id = client.fetch("stylist_id")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :phone => phone, :stylist_id => stylist_id, :id => id}))
    end
    clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, phone, stylist_id) VALUES ('#{@name}', '#{@phone}', #{@stylist_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end

  define_method(:update) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @stylist_id = attr.fetch(:stylist_id)
    @id = self.id()

    if @name != "" && @phone != ""
      DB.exec("UPDATE clients SET name = '#{@name}', phone = '#{@phone}' WHERE id = #{@id};")
    elsif @phone != ""
      DB.exec("UPDATE clients SET phone = '#{@phone}' WHERE id = #{@id};")
    else
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    end
  end

  define_method(:delete) do
   DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

#   define_method(:stylist) do
#   client_stylist = []
#   stylist = DB.exec("SELECT * FROM stylist WHERE client_id = #{self.id()};")
#   stylist.each() do |client|
#     name = client.fetch("name")
#     phone = client.fetch("phone")
#     client_id = client.fetch("client_id").to_i()
#     client_stylist.push(Animal.new({:name => name, :phone => phone, :type => type, :breed => breed, :admit_date => admit_date, :client_id => client_id}))
#   end
#   client_stylist
# end

end
