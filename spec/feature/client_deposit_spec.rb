# frozen_string_literal: true

require 'account'

describe 'Client deposit' do
  it 'can deposit money into account' do
    amount = 1000.00
    date = '10-01-2012'

    account = Account.new
    transaction = account.deposit(amount, date)
    expect(transaction).to be_instance_of(Transaction)
    expect(transaction).to have_attributes(credit: amount, debit: 0.0, date: date, balance: amount)
  end
end
