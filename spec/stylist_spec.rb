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
    it('adds an stylist to the database') do
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

  describe('#update') do
    it ("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => 1})
      stylist.save()
      stylist.update({:name => "Han Skywalker", :phone => "8088675309"})
      expect(stylist.name()).to(eq("Han Skywalker"))
    end
  end

  describe("#delete") do
   it('deletes a stylist from the database') do
     stylist = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => 1})
     stylist.save()
     stylist.delete()
     expect(Stylist.all()).to(eq([]))
     end
   end

   describe("#clients") do
    it("returns an array of clients for that stylist") do
      test_stylist = Stylist.new({:name => "Han Solo", :phone => "5038675309", :id => nil})
      test_stylist.save()
      test_client1 = Client.new({:name => "Chewbacca", :phone => "9713335555", :client_id => test_stylist.id()})
      test_client1.save()
      test_client2 = Client.new({:name => "Princess Leia", :phone => "5038696400", :client_id => test_stylist.id()})
      test_client2.save()
      expect(test_stylist.clients()).to(eq([test_client1, test_client2]))
    end
  end

end
