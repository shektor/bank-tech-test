# frozen_string_literal: true

class Account
  NEW_BALANCE = 0

  attr_reader :balance

  def initialize
    @balance = NEW_BALANCE
  end

  def deposit(amount)
    credit(amount)
  end

  private

  def credit(amount)
    @balance += amount
  end
end
