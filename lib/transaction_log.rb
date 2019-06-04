class TransactionLog

  attr_reader :log

  def initialize
    @log = []
  end

  def store(credit, debit, date, balance)
    transaction = {
      credit: credit,
      debit: debit,
      date: date,
      balance: balance
    }
    @log.push(transaction)
    transaction
  end
end
