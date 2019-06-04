# frozen_string_literal: true

require 'account'

describe 'Client statement' do
  it 'prints account transactions' do
    account = Account.new
    account.deposit(1000.00, '10-01-2012')
    account.deposit(2000.00, '13-01-2012')
    account.withdraw(500.00, '14-01-2012')
    expect{ account.statement }.to output("date || credit || debit || balance\n10-01-2012 || 1000.00 ||  || 1000.00\n13-01-2012 || 2000.00 ||  || 3000.00\n14-01-2012 ||  || 500.00 || 2500.00\n").to_stdout
  end
end
