# frozen_string_literal: true

require 'account'

describe 'Client deposit' do
  it 'can deposit money into account' do
    account = Account.new
    amount = 1000.00
    expect(account.deposit(amount)).to eq amount
  end
end
