# frozen_string_literal: true

require 'account'

describe 'Client withdraw' do
  let(:new_balance) { Account::NEW_BALANCE }

  context 'account balance is greater than withdrawal' do
    it 'can withdraw money from an account' do
      amount = 1000.00
      available_amount = 400.00
      balance = (new_balance + amount) - available_amount

      account = Account.new
      account.deposit(amount)
      expect(account.withdraw(available_amount)).to eq balance
    end
  end

  context 'account balance is less than withdrawal' do
    it 'errors and cannot withdraw from account' do
      account = Account.new
      into_negative = new_balance - new_balance + 1.00
      expect { account.withdraw(into_negative) }.to raise_error('Insufficient funds')
    end
  end
end
