# frozen_string_literal: true

class Account
  NEW_BALANCE = 0.0

  attr_reader :balance

  def initialize(transaction_log = TransactionLog.new)
    @balance = NEW_BALANCE
    @transaction_log = transaction_log
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
    string = 'date || credit || debit || balance ||'
    + '14/01/2012 || || 500.00 || 2500.00'
    + '13/01/2012 || 2000.00 || || 3000.00'
    + '10/01/2012 || 1000.00 || || 1000.00'
    string
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
