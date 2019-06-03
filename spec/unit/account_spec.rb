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
end
