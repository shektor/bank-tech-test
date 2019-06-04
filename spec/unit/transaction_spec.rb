require 'transaction'

describe Transaction do
  let(:subject) { described_class.new(1.00, 2.00, '01-01-2012', 5.00) }

  describe '#initialize' do
    it 'returns a Transaction object' do
      expect(subject).to be_instance_of(Transaction)
    end
  end

  describe '#credit' do
    it 'returns credit amount of transaction' do
      expect(subject.credit).to eq 1.0
    end
  end

  describe '#debit' do
    it 'returns debit amount of transaction' do
      expect(subject.debit).to eq 2.0
    end
  end

  describe '#date' do
    it 'returns date of transaction' do
      expect(subject.date).to eq '01-01-2012'
    end
  end

  describe '#balance' do
    it 'returns updated balance as a result of transaction' do
      expect(subject.balance).to eq 5.0
    end
  end
end
