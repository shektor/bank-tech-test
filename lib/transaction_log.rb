# frozen_string_literal: true

class TransactionLog
  attr_reader :log

  def initialize(transaction = Transaction)
    @log = []
    @transaction = transaction
  end

  def store(credit, debit, date, balance)
    add_to_log(new_transaction(credit, debit, date, balance))
    return_new_transaction
  end

  private

  def new_transaction(credit, debit, date, balance)
    @transaction.new(credit, debit, date, balance)
  end

  def add_to_log(transaction)
    @log.push(transaction)
  end

  def return_new_transaction
    @log.last
  end
end
