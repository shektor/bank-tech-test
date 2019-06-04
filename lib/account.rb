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
