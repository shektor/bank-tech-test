# frozen_string_literal: true

class Transaction
  attr_reader :credit, :debit, :date, :balance

  def initialize(credit, debit, date, balance)
    @credit = credit
    @debit = debit
    @date = date
    @balance = balance
  end
end
