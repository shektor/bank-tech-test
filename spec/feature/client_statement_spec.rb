# frozen_string_literal: true

require 'account'

describe 'Client statement' do
  it 'prints account transactions' do
    account = Account.new
    account.deposit(1000.00, '10-01-2012')
    account.deposit(2000.00, '13-01-2012')
    account.withdraw(500.00, '14-01-2012')

    statement_string = 'date || credit || debit || balance ||'
    + '14/01/2012 || || 500.00 || 2500.00'
    + '13/01/2012 || 2000.00 || || 3000.00'
    + '10/01/2012 || 1000.00 || || 1000.00'
    expect(account.statement).to eq statement_string
  end
end
