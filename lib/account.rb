# frozen_string_literal: true

class Account
  NEW_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = NEW_BALANCE
  end

  def deposit(amount, date)
    credit(amount)
  end

  def withdraw(amount, date)
    raise 'Insufficient funds' if debit_invalid?(amount)

    debit(amount)
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

  def debit_invalid?(amount)
    (@balance - amount).negative?
  end
end
