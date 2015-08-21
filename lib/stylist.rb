class Stylist
  attr_reader(:name, :phone, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @id = attr.fetch(:id, nil)
  end

  define_singleton_method(:all) do
    returned_stylists = DB.exec("SELECT * FROM stylists;")
    stylists = []
    returned_stylists.each() do |stylist|
      name = stylist.fetch("name")
      phone = stylist.fetch("phone")
      id = stylist.fetch("id").to_i()
      stylists.push(Stylist.new({:name => name, :phone => phone, :id => id}))
    end
    stylists
  end

  define_method(:save) do
    DB.exec("INSERT INTO stylists (name, phone, id) VALUES ('#{@name}', '#{@phone}', '#{@id}');")
  end

  define_method(:==) do |another_stylist|
    self.name().==(another_stylist.name())
  end

  define_method(:update) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @id = self.id()

    if @name != "" && @phone != ""
      DB.exec("UPDATE stylists SET name = '#{@name}', phone = '#{@phone}' WHERE id = #{@id};")
    elsif @phone != ""
      DB.exec("UPDATE stylists SET phone = '#{@phone}' WHERE id = #{@id};")
    else
      DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
    end
  end

  define_method(:delete) do
   DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  define_method(:clients) do
  stylist_clients = []
  clients = DB.exec("SELECT * FROM clients WHERE id = #{self.id()};")
  clients.each() do |stylist|
    name = stylist.fetch("name")
    phone = stylist.fetch("phone")
    client_id = stylist.fetch("client_id")
    id = stylist.fetch("id").to_i()
    stylist_clients.push(Stylist.new({:name => name, :phone => phone, :client_id => client_id, :id => id}))
  end
  stylist_clients
end

end
