# frozen_string_literal: true

require 'transaction_log'

describe TransactionLog do
  let(:credit) { 1000.00 }
  let(:debit) { 0.00 }
  let(:date) { '10-01-2012' }
  let(:balance) { 1000.00 }

  let(:transaction) do
    double :transaction,
           redit: credit,
           debit: debit,
           date: date,
           balance: balance
  end
  let(:transaction_class) { double :transaction_class, new: transaction }
  let(:subject) { described_class.new(transaction_class) }

  describe '#store' do
    it 'creates a new transaction' do
      expect(transaction_class).to receive(:new).with(credit, debit, date, balance)
      subject.store(credit, debit, date, balance)
    end

    it 'adds a transaction to the log' do
      subject.store(credit, debit, date, balance)
      expect(subject.log).to include(transaction)
    end

    it 'returns a transaction' do
      expect(subject.store(credit, debit, date, balance)).to eq transaction
    end
  end
end
