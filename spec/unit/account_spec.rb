# frozen_string_literal: true

require 'account'

describe Account do
  let(:new_balance) { described_class::NEW_BALANCE }
  let(:date) { double :date }

  let(:transaction_log) { double :transaction_log, store: [] }
  let(:subject) { described_class.new(transaction_log) }

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

    it 'calls store on transaction log with credit amount' do
      amount = 1000.00
      expect(transaction_log).to receive(:store).with(amount, 0.0, date, amount)
      subject.deposit(amount, date)
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

    it 'calls store on transaction log with debit amount' do
      amount = 1000.00
      subject.deposit(amount, date)
      expect(transaction_log).to receive(:store).with(0.0, amount, date, 0.0)
      subject.withdraw(amount, date)
    end
  end
end
