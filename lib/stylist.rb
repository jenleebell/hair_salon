class Stylist
  attr_reader(:name, :phone, :id)

  define_method(:initialize) do |attr|
    @name = attr.fetch(:name)
    @phone = attr.fetch(:phone)
    @id = attr.fetch(:id)
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

end
