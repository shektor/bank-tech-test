# frozen_string_literal: true

class Account
  NEW_BALANCE = 0.0

  attr_reader :balance

  def initialize(
    transaction_log = TransactionLog.new,
    transaction_statement = TransactionStatement.new
  )
    @balance = NEW_BALANCE
    @transaction_log = transaction_log
    @transaction_statement = transaction_statement
  end

  def deposit(amount, date)
    credit(amount)
    @transaction_log.store(amount, 0.0, date, @balance)
  end

  def withdraw(amount, date)
    raise 'Insufficient funds' if balance_less(amount).negative?

    debit(amount)
    @transaction_log.store(0.0, amount, date, @balance)
  end

  def statement
    @transaction_statement.print(@transaction_log.log)
  end

  private

  def credit(amount)
    @balance += amount
  end

  def debit(amount)
    @balance -= amount
  end

  def balance_less(amount)
    @balance - amount
  end
end
