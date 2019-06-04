# frozen_string_literal: true

require 'account'

describe 'Client withdraw' do
  let(:new_balance) { Account::NEW_BALANCE }

  context 'account balance is greater than withdrawal' do
    it 'can withdraw money from an account' do
      account = Account.new
      account.deposit(1000.00, '10-01-2012')
      transaction_return = account.withdraw(400.00, '14-01-2012')
      expect(transaction_return).to be_instance_of(Transaction)
      expect(transaction_return).to have_attributes(
        credit: 0.0,
        debit: 400.0,
        date: '14-01-2012',
        balance: 600.0
      )
    end
  end

  context 'account balance is less than withdrawal' do
    it 'errors and cannot withdraw from account' do
      account = Account.new
      expect { account.withdraw(1.00, '14-01-2012') }.to raise_error('Insufficient funds')
    end
  end
end
