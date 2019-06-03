# frozen_string_literal: true

require 'account'

describe Account do
  let(:new_balance) { described_class::NEW_BALANCE }

  describe '#initialize' do
    it { expect(subject).to have_attributes(balance: new_balance) }
  end

  describe '#deposit' do
    it 'increases balance by amount' do
      amount = 1000.00
      expect { subject.deposit(amount) }.to change {
        subject.balance
      }.from(new_balance).to(amount)
    end
  end

  describe '#withdraw' do
    it 'decreases balance by amount' do
      put_amount = 1000.00
      updated_balance = new_balance + put_amount
      take_amount = 400.00
      final_balance = updated_balance - take_amount

      subject.deposit(put_amount)
      expect { subject.withdraw(take_amount) }.to change {
        subject.balance
      }.from(updated_balance).to(final_balance)
    end
  end
end
