class TransactionLog

  attr_reader :log

  def initialize
    @log = []
  end

  def store(credit, debit, date, balance)
    @log.push({
      credit: credit,
      debit: debit,
      date: date,
      balance: balance
    })
  end
end
