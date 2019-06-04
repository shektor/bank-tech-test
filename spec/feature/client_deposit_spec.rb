# frozen_string_literal: true

require 'account'

describe 'Client deposit' do
  it 'can deposit money into account' do
    amount = 1000.00
    date = '10-01-2012'
    transaction = {
      credit: amount,
      debit: 0.0,
      date: date,
      balance: amount
    }

    account = Account.new
    expect(account.deposit(amount, date)).to eq transaction
  end
end
