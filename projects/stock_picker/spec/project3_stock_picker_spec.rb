require_relative '../project3_stock_picker'

RSpec.describe 'Project: Stock Picker' do
  describe 'no valid arguments' do
    it 'returns invalid input' do
      expect(stock_picker([])).to eq('Error: Invalid input')
      expect(stock_picker('')).to eq('Error: Invalid input')
      expect(stock_picker('10,20,20')).to eq('Error: Invalid input')
      expect(stock_picker(10)).to eq('Error: Invalid input')
      expect(stock_picker(nil)).to eq('Error: Invalid input')
      expect(stock_picker(%w[10 20 30])).to eq('Error: Invalid input')
    end
  end

  describe 'valid arguments' do
    it 'returns array of days with highest spread of wins' do
      expect(stock_picker([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1, 4])
      expect(stock_picker([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq([0, 8])
      expect(stock_picker([1, 4, 2, 5, 3, 6, 2, 7, 1, 8])).to eq([0, 9])
      expect(stock_picker([10, 7, 15, 6, 8, 13, 5, 11])).to eq([1, 2])
      expect(stock_picker([4, 1, 3, 2, 5, 2, 4])).to eq([1, 4])
      expect(stock_picker([2, 2, 2, 2, 2])).to eq([0, 4])
    end

    it 'returns array of days with the lowest spread of losses' do
      expect(stock_picker([9, 8, 7, 6, 5, 4, 3, 2, 1])).to eq([7, 8])
    end
  end
end
