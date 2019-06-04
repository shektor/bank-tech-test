require 'transaction_statement'

describe TransactionStatement do
  let(:transaction) do
    double :transaction,
           credit: 1.0,
           debit: 0.0,
           date: '10-01-2012',
           balance: 1.0
  end

  describe '#print' do
    it 'outputs log entries to console' do
      log = [transaction]
      expect{ subject.print(log) }.to output("date || credit || debit || balance\n10-01-2012 || 1.0 || 0.0 || 1.0\n").to_stdout
    end
  end
end
