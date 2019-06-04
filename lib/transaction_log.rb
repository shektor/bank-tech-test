# frozen_string_literal: true

class TransactionLog
  attr_reader :log

  def initialize(transaction = Transaction)
    @log = []
    @transaction = transaction
  end

  def store(credit, debit, date, balance)
    transaction = @transaction.new(credit, debit, date, balance)
    @log.push(transaction)
    transaction
  end
end
