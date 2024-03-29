require_relative '../../lib/ttsttb'

RSpec.describe Ttsttb do
  shared_examples 'valid' do |currency, type, date, value|
    it 'should return valid price' do
      rows = Ttsttb.find(date)
      expect(rows[currency][type]).to eq value
    end
  end
  shared_examples 'data is empty' do |currency, type, date, _value|
    it 'should raise NoMethodError' do
      expect do
        Ttsttb.find(date)[currency][type]
      end.to raise_error NoMethodError
    end
  end
  shared_examples 'data is not provided' do |currency, type, date, _value|
    it 'should raise RuntimeError' do
      expect do
        Ttsttb.find(date)[currency][type]
      end.to raise_error RuntimeError
    end
  end

  matrix = {
    'valid' => {
      # Very old data can be fetch only USD
      '1990-01-18' => {
        'USD' => {
          'tts' => 146.55,
          'ttb' => 144.55,
          'ttm' => 145.55
        }
      },
      # recent data
      '2019-10-18' => {
        'USD' => {
          'tts' => 109.71,
          'ttb' => 107.71,
          'ttm' => 108.71
        },
        'EUR' => {
          'tts' => 122.45,
          'ttb' => 119.45,
          'ttm' => 120.95
        }
      }
    },
    'data is empty' => {
      '1990-01-18' => {
        'EUR' => {
          'tts' => 146.55,
          'ttb' => 144.55,
          'ttm' => 145.55
        }
      }
    },
    # very far from MUFG range
    'data is not provided' => {
      '199-01-01' => {
        'USD' => {
          'tts' => 146.55,
          'ttb' => 144.55,
          'ttm' => 145.55
        }
      },
      # out of MUFG range
      '1890-01-18' => {
        'EUR' => {
          'tts' => 146.55,
          'ttb' => 144.55,
          'ttm' => 145.55
        }
      }
    }
  }

  matrix.each do |test_type, date_hash|
    date_hash.each do |date, currency_hash|
      context date do
        currency_hash.each do |currency, tt_hash|
          context currency do
            tt_hash.each do |tt, value|
              context tt do
                it_behaves_like test_type, currency, tt, Date.parse(date), value
              end
            end
          end
        end
      end
    end
  end
end
