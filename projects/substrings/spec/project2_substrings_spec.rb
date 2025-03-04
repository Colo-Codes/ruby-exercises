require_relative '../project2_substrings'

RSpec.describe 'Project: Substrings' do
  describe 'no valid arguments' do
    context 'when no arguments are provided' do
      it 'returns no argument error' do
        expect(substrings).to eq('Error: no arguments provided')
        expect(substrings('', [])).to eq('Error: no arguments provided')
        expect(substrings('', ['word'])).to eq('Error: no arguments provided')
        expect(substrings('word', [])).to eq('Error: no arguments provided')
      end
    end

    context 'when invalid arguments are provided' do
      it 'returns invalid arguments error' do
        expect(substrings(nil)).to eq('Error: invalid arguments provided')
        expect(substrings(nil, nil)).to eq('Error: invalid arguments provided')
        expect(substrings(5, [])).to eq('Error: invalid arguments provided')
        expect(substrings(5.5, [])).to eq('Error: invalid arguments provided')
        expect(substrings([], [])).to eq('Error: invalid arguments provided')
        expect(substrings({}, [])).to eq('Error: invalid arguments provided')
        expect(substrings(:symbol, [])).to eq('Error: invalid arguments provided')
        expect(substrings(['word'], [])).to eq('Error: invalid arguments provided')
        expect(substrings('word', {})).to eq('Error: invalid arguments provided')
        expect(substrings('word', 5)).to eq('Error: invalid arguments provided')
        expect(substrings('word', 'another word')).to eq('Error: invalid arguments provided')
      end
    end
  end

  describe 'valid arguments' do
    context 'when a word and a substrings dictionary are provided' do
      it 'returns a hash with substrings matching the word and the amount of repeated matches' do
        word = 'below'
        dictionary = %w[below down go going horn how howdy it i low own part
                        partner sit]
        return_hash = { 'below' => 1, 'low' => 1 }

        expect(substrings(word, dictionary)).to eq(return_hash)
      end

      context 'when the wor argument is actually a sentence that includes spaces' do
        it 'returns a hash with substrings matching the word and the amount of repeated matches' do
          sentence = "Howdy partner, sit down! How's it going?"
          dictionary = %w[below down go going horn how howdy it i low own part
                          partner sit]
          return_hash = { 'down' => 1, 'go' => 1, 'going' => 1, 'how' => 2, 'howdy' => 1, 'it' => 2, 'i' => 3,
                          'own' => 1, 'part' => 1, 'partner' => 1, 'sit' => 1 }

          expect(substrings(sentence, dictionary)).to eq(return_hash)
        end
      end
    end
  end
end
