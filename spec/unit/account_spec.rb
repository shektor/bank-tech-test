# frozen_string_literal: true

require 'account'

describe Account do
  let(:new_balance) { described_class::NEW_BALANCE }
  let(:date) { :date }

  describe '#initialize' do
    it { expect(subject).to have_attributes(balance: new_balance) }
  end

  describe '#deposit' do
    it 'increases balance by amount' do
      amount = 1000.00

      expect { subject.deposit(amount, date) }.to change {
        subject.balance
      }.from(new_balance).to(amount)
    end
  end

  describe '#withdraw' do
    context 'amount available to withdraw' do
      it 'decreases balance by amount' do
        amount = 1000.00
        updated_balance = new_balance + amount
        available_amount = 400.00
        final_balance = updated_balance - available_amount

        subject.deposit(amount, date)

        expect { subject.withdraw(available_amount, date) }.to change {
          subject.balance
        }.from(updated_balance).to(final_balance)
      end
    end

    context 'amount unavailable to withdraw' do
      it 'returns an error' do
        into_negative = new_balance - new_balance + 1.00

        expect { subject.withdraw(into_negative, date) }.to raise_error('Insufficient funds')
      end
    end
  end
end
