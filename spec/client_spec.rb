require('spec_helper')

describe(Client) do

  describe('#name') do
    it("returns the name of the client") do
      test_client = Client.new({:name => "Chewbacca", :phone => "9713335555", :stylist_id => 1, :id => nil})
      expect(test_client.name()).to(eq("Chewbacca"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds an client to the array of saved clients') do
      test_client = Client.new({:name => "Chewbacca", :phone => "9713335555", :stylist_id => 1, :id => nil})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#==") do
    it("is the same client if it has the same name") do
      test_client1 = Client.new({:name => "Chewbacca", :phone => "9713335555", :stylist_id => 1, :id => nil})
      test_client2 = Client.new({:name => "Chewbacca", :phone => "9713335555", :stylist_id => 1, :id => nil})
      expect(test_client1).to(eq(test_client2))
    end
  end

  describe('#update') do
    it ("lets you update clients in the database") do
      client = Client.new({:name => "Chewbacca", :phone => "9713335555", :stylist_id => 1, :id => nil})
      client.save()
      client.update({:name => "Chewy", :phone => "9713335555", :stylist_id => 1})
      expect(client.name()).to(eq("Chewy"))
    end
  end

  describe("#delete") do
   it('deletes a client from the database') do
     client = Client.new({:name => "Chewbacca", :phone => "9713335555", :stylist_id => 1, :id => nil})
     client.save()
     client.delete()
     expect(Client.all()).to(eq([]))
     end
   end

end
