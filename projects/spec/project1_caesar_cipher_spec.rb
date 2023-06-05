require_relative '../project1_caesar_cipher'

RSpec.describe 'Project: Caesar Cipher' do
  describe 'text with no shift factor' do
    context 'when no string is used as input' do
      it 'returns an error' do
        expect(caesar_cipher(123)).to eq('Error: input is not a string')
        expect(caesar_cipher([])).to eq('Error: input is not a string')
        expect(caesar_cipher({})).to eq('Error: input is not a string')
        expect(caesar_cipher(nil)).to eq('Error: input is not a string')
        expect(caesar_cipher(:symbol)).to eq('Error: input is not a string')
      end
    end

    it 'returns the text as it was entered' do
      text = 'Hello, world!'
      result = caesar_cipher(text)

      expect(result).to eq(text)
    end
  end

  describe 'text with a shift factor' do
    context 'when no valid number is used as input' do
      it 'returns an error' do
        expect(caesar_cipher('hello', 1.5)).to eq('Error: shift factor is not a valid number')
        expect(caesar_cipher('hello', '0')).to eq('Error: shift factor is not a valid number')
        expect(caesar_cipher('hello', [])).to eq('Error: shift factor is not a valid number')
        expect(caesar_cipher('hello', {})).to eq('Error: shift factor is not a valid number')
        expect(caesar_cipher('hello', nil)).to eq('Error: shift factor is not a valid number')
      end
    end

    context 'when no valid text is provided' do
      it 'returns an error' do
        expect(caesar_cipher(nil, 1.5)).to eq('Error: input is not a string')
      end
    end

    context 'when valid shift factor is provided' do
      it 'returns the encrypted text' do
        response = caesar_cipher("What a string!", 5)

        expect(response).to eq('Bmfy f xywnsl!')
      end
    end
  end
end