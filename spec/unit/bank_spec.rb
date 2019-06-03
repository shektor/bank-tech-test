require 'bank'

describe Bank do
  describe '#deposit' do
    it 'adds amount to balance' do
      amount = 1000.00
      expect{subject.deposit(amount)}.to change{subject.balance}.from(0).to(amount)
    end
  end
end
