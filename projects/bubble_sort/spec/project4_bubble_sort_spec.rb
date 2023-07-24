require_relative '../project4_bubble_sort'
require 'benchmark'

RSpec.describe 'Project: Bubble Sort' do
  describe 'no valid arguments' do
    it 'returns invalid input' do
      expect(bubble_sort([])).to eq('Error: Invalid input')
      expect(bubble_sort('')).to eq('Error: Invalid input')
      expect(bubble_sort('10,20,20')).to eq('Error: Invalid input')
      expect(bubble_sort(10)).to eq('Error: Invalid input')
      expect(bubble_sort(nil)).to eq('Error: Invalid input')
      expect(bubble_sort(%w[10 20 30])).to eq('Error: Invalid input')
    end
  end

  describe 'valid arguments' do
    it 'returns sorted array' do
      expect(bubble_sort([4, 3, 78, 2, 0, 2])).to eq([0, 2, 2, 3, 4, 78])
      expect(bubble_sort([9, 2, 5, 1, 7, 4, 8, 3, 6])).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(bubble_sort([1, 2, 3, 4, 5, 6, 7, 8, 9])).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(bubble_sort([9, 8, 7, 6, 5, 4, 3, 2, 1])).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9])
      expect(bubble_sort([4, 2, 6, 4, 1, 4, 7, 3, 6])).to eq([1, 2, 3, 4, 4, 4, 6, 6, 7])
    end
  end

  describe 'benchmark runtime' do
    it 'returns the the runtime of the method' do
      Benchmark.bm do |bubble|
        bubble.report('bubble_sort') do
          bubble_sort(5_000.downto(0).to_a)
        end
      end
    end
  end
end
