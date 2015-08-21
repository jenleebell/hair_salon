class Client
  attr_reader(:name, :phone, :client_id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @client_id = attr.fetch(:client_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      phone = client.fetch("phone")
      client_id = client.fetch("client_id").to_i()
      clients.push(Client.new({:name => name, :phone => phone, :client_id => client_id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, phone, client_id) VALUES ('#{@name}', '#{@phone}', #{@client_id});")
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end

  define_method(:update) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @client_id = self.client_id()

    if @name != "" && @phone != ""
      DB.exec("UPDATE clients SET name = '#{@name}', phone = '#{@phone}' WHERE client_id = #{@client_id};")
    elsif @phone != ""
      DB.exec("UPDATE clients SET phone = '#{@phone}' WHERE client_id = #{@client_id};")
    else
      DB.exec("UPDATE clients SET name = '#{@name}' WHERE client_id = #{@client_id};")
    end
  end

  define_method(:delete) do
   DB.exec("DELETE FROM clients WHERE client_id = #{self.client_id()};")
  end

end
