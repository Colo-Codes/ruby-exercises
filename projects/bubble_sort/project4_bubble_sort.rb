# Build a method #bubble_sort that takes an array and returns a sorted array.
# It must use the bubble sort methodology (using #sort would be pretty
# pointless, wouldn’t it?).
# > bubble_sort([4,3,78,2,0,2])
# => [0,2,2,3,4,78]

# Initial analysis:
# -----------------
# 1. Iteration k=0:
#   1.1. Compare array[0] with array[1]
#   1.2. If array[0] > array[1], swap array[0] with array[1]
#   1.3. Move on to the next element and repeat comparison and swap
# 2. Iteration k=1:
#   2.1. Compare array[0] with array[1]
#   2.2. If array[0] > array[1], swap array[0] with array[1]
#   2.3. Move on to the next element and repeat comparison and swap
#        except for the last element (n-k)

def bubble_sort(array)
  return 'Error: Invalid input' unless valid_input? array

  iteration = 1
  n = array.length

  loop do
    elements_swapped = false

    # (n - 1).times do |index| # <- this is less efficient
    (n - iteration).times do |index|
      if array[index] > array[index + 1]
        array[index], array[index + 1] = array[index + 1], array[index]
        elements_swapped = true
      end
    end

    break unless elements_swapped

    iteration += 1
  end

  array
end

def valid_input?(input)
  input.is_a?(Array) && !input.empty? && input.all?(Numeric)
end
