require 'account'

describe 'Client withdraw' do
  it 'can withdraw money from an account' do
    put_amount = 1000.00
    take_amount = 400.00
    balance = (Account::NEW_BALANCE + put_amount) - take_amount

    account = Account.new
    account.deposit(put_amount)
    expect(account.withdraw(take_amount)).to eq balance
  end
end
