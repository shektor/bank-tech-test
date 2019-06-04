# frozen_string_literal: true

require 'account'

describe 'Client withdraw' do
  let(:new_balance) { Account::NEW_BALANCE }
  let(:transaction_log) { :transaction_log }

  context 'account balance is greater than withdrawal' do
    it 'can withdraw money from an account' do
      amount = 1000.00
      available_amount = 400.00
      balance = (new_balance + amount) - available_amount

      date = '14-01-2012'
      transaction = {
        credit: 0.0,
        debit: available_amount,
        date: date,
        balance: balance
      }

      account = Account.new
      account.deposit(amount, '10-01-2012')
      expect(account.withdraw(available_amount, date)).to eq transaction
    end
  end

  context 'account balance is less than withdrawal' do
    it 'errors and cannot withdraw from account' do
      into_negative = new_balance - new_balance + 1.00

      account = Account.new
      expect { account.withdraw(into_negative, '14-01-2012') }.to raise_error('Insufficient funds')
    end
  end
end
