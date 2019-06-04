# frozen_string_literal: true

require 'account'

describe 'Client deposit' do
  it 'can deposit money into account' do
    amount = 1000.00

    account = Account.new
    expect(account.deposit(amount, '10-01-2012')).to eq amount
  end
end
