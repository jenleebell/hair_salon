class Client
  attr_reader(:name, :phone, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @id = attr.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each() do |client|
      name = client.fetch("name")
      phone = client.fetch("phone")
      id = client.fetch("id").to_i()
      clients.push(Client.new({:name => name, :phone => phone, :id => id}))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, phone, id) VALUES ('#{@name}', '#{@phone}', '#{@id}');")
  end

  define_method(:==) do |another_client|
    self.name().==(another_client.name())
  end

  define_method(:update) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
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

end
