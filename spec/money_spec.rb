require 'spec_helper'

describe Money do

  context 'should give the expected sum ' do
    it 'the amount should add up to Rs. 2 , 50p for amounts Rs 1, 20 p and Rs 1,30p  ' do
      expect(Money.new(1, 20) + Money.new(1, 30)).to eq(Money.new(2, 50))
    end
    it 'the amount should be Rs.1, 25p for Rs. 3, 45p and Rs. 2, 20p' do
      expect(Money.new(3, 45) - Money.new(2, 20)).to eq(Money.new(1, 25))
    end
    it 'the amount should be Rs.-1, 25p for Rs. 2, 20p and Rs. 3, 45p' do
      expect(Money.new(2, 20) - Money.new(3, 45)).to eq(Money.new(-1, -25))
    end

    context "Equality checks" do
      let(:money) do
        Money.new(1, 2)
      end
      it "should be equal for same object id" do
        expect(money).to eq(money)
      end

      it "should not be null" do
        expect(money).to_not eq(nil)
      end

      it "should not be equal for different type" do
        object = Object.new
        expect(money).to_not eq(object)
      end

      it "should have same hash code" do
        money1 = Money.new(1, 2)
        money2 = Money.new(1, 2)
        expect(money1.hash).to eq(money2.hash)
      end

      it "symmetric property" do
        money1 = Money.new(1, 2)
        money2 = Money.new(1, 2)
        expect(money1).to eq(money2) and expect(money2).to eq(money1)
      end

      it "transitive property" do
        money1 = Money.new(1, 2)
        money2 = Money.new(1, 2)
        money3 = Money.new(1, 2)
        expect(money1).to eq(money2) and expect(money2).to eq(money3) and expect(money3).to eq(money1)
      end
    end
  end
  context 'print' do
    it '"2 Rs. 50 p." if money is Rs 2 50p' do
      money = Money.new(2, 50)
      expect(money.to_s).to eq("2 Rs. 50 p.")
    end
  end

  context 'sort' do
    it "returns sorted money list for Rs 2 25p, Rs 1 2p and Rs 1 and 25p " do

      money1 = Money.new(2, 25)
      money2 = Money.new(1, 2)
      money3 = Money.new(1, 25)
      expect([money1, money2, money3].sort).to eq([money2, money3, money1])
    end
    it "returns wrong sorted money list for Rs 2 25p, Rs 1 2p and Rs 1 and 25p " do

      money1 = Money.new(2, 25)
      money2 = Money.new(1, 2)
      money3 = Money.new(1, 25)
      expect([money1, money2, money3].sort).to_not eq([money1, money2, money3])
    end
  end


  context '#<=> comparison' do
    let(:money1) { Money.new(1, 2) }
    let(:money2) { Money.new(2, 2) }

    it "should return -1 for Money(1,1) <=> Money(2,2)" do
      expect(money1<=>money2).to eq(-1)
    end

    it "should return 1 for Money(2,2) <=> Money(1,1)" do
      expect(money2 <=> money1).to eq(1)
    end

    it "should return 0 for Money(1,1) <=> Money(1,1)" do
      expect(money1 <=> money1).to eq(0)
    end

    it "should return nil for Money(1,1) <=> Object" do
      expect(money1<=>Object.new).to eq(nil)
    end

  end
  context 'less than and greater Comparison' do
    it 'Rs 2 50p is less than Rs 3 50p' do
      money1 = Money.new(2, 50)
      money2 = Money.new(3, 50)
      expect(money1).to be < (money2)
    end
    it 'Rs 2 50p is not less than Rs 3 50p' do
      money1 = Money.new(2, 50)
      money2 = Money.new(3, 50)
      expect(money2 < money1).to eq(false)
    end
    it 'Rs 2 50p is greater than Rs 3 50p' do
      money1 = Money.new(3, 50)
      money2 = Money.new(2, 50)
      expect(money1).to be > (money2)
    end
    it 'Rs 2 50p is not greater than Rs 3 50p' do
      money1 = Money.new(2, 50)
      money2 = Money.new(3, 50)
      expect(money1 > money2).to eq(false)
    end
  end
end

