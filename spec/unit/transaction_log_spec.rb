require 'transaction_log'

describe TransactionLog do
  describe '#store' do
    it 'adds a transaction to the log' do
      credit = 1000.00
      debit = 0.00
      date = '10-01-2012'
      balance = 1000.00

      transaction = {
        credit: credit,
        debit: debit,
        date: date,
        balance: balance
      }

      subject.store(credit, debit, date, balance)
      expect(subject.log).to include(transaction)
    end

    it 'returns a transaction' do
      credit = 1000.00
      debit = 0.00
      date = '10-01-2012'
      balance = 1000.00

      transaction = {
        credit: credit,
        debit: debit,
        date: date,
        balance: balance
      }

      expect(subject.store(credit, debit, date, balance)).to eq transaction
    end
  end
end
