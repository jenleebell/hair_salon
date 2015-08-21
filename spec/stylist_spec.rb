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

  describe('#save') do
    it('adds an stylist to the array of saved stylists') do
      test_stylist = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => 1})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe("#==") do
    it("is the same stylist if it has the same name") do
      test_stylist1 = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => nil})
      test_stylist2 = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => nil})
      expect(test_stylist1).to(eq(test_stylist2))
    end
  end

end
