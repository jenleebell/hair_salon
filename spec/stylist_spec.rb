require('spec_helper')

describe(Stylist) do

  describe('#name') do
    it("returns the name of the stylist") do
      test_stylist = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => nil})
      expect(test_stylist.name()).to(eq("Han Solo"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

end
