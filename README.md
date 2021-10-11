# TTS TTB library

[![Gem Version](https://badge.fury.io/rb/ttsttb.svg)](https://badge.fury.io/rb/ttsttb)
![Gem](https://img.shields.io/gem/dt/ttsttb)
[![Maintainability](https://api.codeclimate.com/v1/badges/2f4736d38eaa5d261aae/maintainability)](https://codeclimate.com/github/matsubo/ttsttb/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2f4736d38eaa5d261aae/test_coverage)](https://codeclimate.com/github/matsubo/ttsttb/test_coverage)


[TTS and TTB value of Forex](http://www.murc-kawasesouba.jp/fx/past_3month.php) is  provided by MUFG. Major information provider of TTS and TTB is MUFG in Japan but the data is not provided by commonly used data format like CSV and JSON to handle by program for ease.

I created Ruby gem to get the TTS and TTB corresponding to the passed date. You can get hash of currency code key and value of TTS and TTB.



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ttsttb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ttsttb

## Usage


```ruby
% bin/console
irb(main):001:0> require 'pp'
true
irb(main):001:0> require 'date'
true
irb(main):003:0> pp Ttsttb.find(Date.new(2018, 3, 7))['USD']['tts']
106.62
irb(main):004:0> pp Ttsttb.find(Date.new(2018, 3, 1))
{"USD"=>
  {"currency"=>{"en"=>"US Dollar", "ja"=>"米ドル"},
   "code"=>"USD",
   "tts"=>107.73,
   "ttb"=>105.73,
   "ttm"=>160.6},
 "EUR"=>
  {"currency"=>{"en"=>"Euro", "ja"=>"ユーロ"},
   "code"=>"EUR",
   "tts"=>131.54,
   "ttb"=>128.54,
   "ttm"=>195.81},
 "CAD"=>
  {"currency"=>{"en"=>"Canadian Dollar", "ja"=>"カナダ・ドル"},
   "code"=>"CAD",
   "tts"=>84.71,
   "ttb"=>81.51,
   "ttm"=>125.47},
 "GBP"=>
  {"currency"=>{"en"=>"Pound Sterling", "ja"=>"英ポンド"},
   "code"=>"GBP",
   "tts"=>150.75,
   "ttb"=>142.75,
   "ttm"=>222.13},
 "CHF"=>
  {"currency"=>{"en"=>"Swiss Franc", "ja"=>"スイス･フラン"},
   "code"=>"CHF",
   "tts"=>113.78,
   "ttb"=>111.98,
   "ttm"=>169.77},
 "DKK"=>
  {"currency"=>{"en"=>"Danish Krone", "ja"=>"デンマーク・クローネ"},
   "code"=>"DKK",
   "tts"=>17.76,
   "ttb"=>17.16,
   "ttm"=>26.34},
 "NOK"=>
  {"currency"=>{"en"=>"Norwegian Krone", "ja"=>"ノルウェー・クローネ"},
   "code"=>"NOK",
   "tts"=>13.79,
   "ttb"=>13.19,
   "ttm"=>20.39},
 "SEK"=>
  {"currency"=>{"en"=>"Swedish Krona", "ja"=>"スウェーデン・クローネ"},
   "code"=>"SEK",
   "tts"=>13.27,
   "ttb"=>12.47,
   "ttm"=>19.51},
 "AUD"=>
  {"currency"=>{"en"=>"Australian Dollar", "ja"=>"オーストラリア・ドル"},
   "code"=>"AUD",
   "tts"=>84.6,
   "ttb"=>80.6,
   "ttm"=>124.9},
 "NZD"=>
  {"currency"=>{"en"=>"New Zealand Dollar", "ja"=>"ニュージーランド・ドル"},
   "code"=>"NZD",
   "tts"=>78.87,
   "ttb"=>74.87,
   "ttm"=>116.31},
 "HKD"=>
  {"currency"=>{"en"=>"Hong Kong Dollar", "ja"=>"香港ドル"},
   "code"=>"HKD",
   "tts"=>14.07,
   "ttb"=>13.21,
   "ttm"=>20.68},
 "MYR"=>
  {"currency"=>{"en"=>"Malaysian Ringgit", "ja"=>"マレーシア・リンギット"},
   "code"=>"MYR",
   "tts"=>nil,
   "ttb"=>nil,
   "ttm"=>nil},
 "SGD"=>
  {"currency"=>{"en"=>"Singapore Dollar", "ja"=>"シンガポール・ドル"},
   "code"=>"SGD",
   "tts"=>81.3,
   "ttb"=>79.64,
   "ttm"=>121.12},
 "SAR"=>
  {"currency"=>{"en"=>"Saudi Riyal", "ja"=>"サウジ・リアル"},
   "code"=>"SAR",
   "tts"=>29.31,
   "ttb"=>27.71,
   "ttm"=>43.17},
 "AED"=>
  {"currency"=>{"en"=>"UAE Dirham", "ja"=>"UAEディルハム"},
   "code"=>"AED",
   "tts"=>29.79,
   "ttb"=>28.43,
   "ttm"=>44.01},
 "CNY"=>
  {"currency"=>{"en"=>"Yuan Renminbi", "ja"=>"中国・人民元"},
   "code"=>"CNY",
   "tts"=>17.15,
   "ttb"=>16.55,
   "ttm"=>25.43},
 "THB"=>
  {"currency"=>{"en"=>"Baht", "ja"=>"タイ・バーツ"},
   "code"=>"THB",
   "tts"=>3.46,
   "ttb"=>3.3,
   "ttm"=>5.11},
 "INR"=>
  {"currency"=>{"en"=>"Indian Rupee", "ja"=>"インド・ルピー"},
   "code"=>"INR",
   "tts"=>1.8,
   "ttb"=>1.5,
   "ttm"=>2.55},
 "PKR"=>
  {"currency"=>{"en"=>"Pakistan Rupee", "ja"=>"パキスタン・ルピー"},
   "code"=>"PKR",
   "tts"=>1.12,
   "ttb"=>0.82,
   "ttm"=>1.53},
 "KWD"=>
  {"currency"=>{"en"=>"Kuwaiti Dinar", "ja"=>"クウェート・ディナール"},
   "code"=>"KWD",
   "tts"=>364.96,
   "ttb"=>348.96,
   "ttm"=>539.44},
 "QAR"=>
  {"currency"=>{"en"=>"Qatari Rial", "ja"=>"カタール・リヤル"},
   "code"=>"QAR",
   "tts"=>30.05,
   "ttb"=>28.69,
   "ttm"=>44.4},
 "IDR"=>
  {"currency"=>{"en"=>"Indonesia Rupiah", "ja"=>"インドネシア・ルピア"},
   "code"=>"IDR",
   "tts"=>0.9,
   "ttb"=>0.66,
   "ttm"=>1.23},
 "MXN"=>
  {"currency"=>{"en"=>"Mexican Peso", "ja"=>"メキシコ・ペソ"},
   "code"=>"MXN",
   "tts"=>6.66,
   "ttb"=>4.66,
   "ttm"=>8.99},
 "KRW"=>
  {"currency"=>{"en"=>"Won", "ja"=>"韓国ウォン"},
   "code"=>"KRW",
   "tts"=>10.05,
   "ttb"=>9.65,
   "ttm"=>14.88},
 "PHP"=>
  {"currency"=>{"en"=>"Philippine Peso", "ja"=>"フィリピン・ペソ"},
   "code"=>"PHP",
   "tts"=>2.21,
   "ttb"=>1.93,
   "ttm"=>3.18},
 "ZAR"=>
  {"currency"=>{"en"=>"Rand", "ja"=>"南アフリカ･ランド"},
   "code"=>"ZAR",
   "tts"=>10.55,
   "ttb"=>7.55,
   "ttm"=>14.33},
 "CZK"=>
  {"currency"=>{"en"=>"Czech Koruna", "ja"=>"チェコ・コルナ"},
   "code"=>"CZK",
   "tts"=>5.24,
   "ttb"=>5.0,
   "ttm"=>7.74},
 "RUB"=>
  {"currency"=>{"en"=>"Russian Ruble", "ja"=>"ロシア・ルーブル"},
   "code"=>"RUB",
   "tts"=>2.15,
   "ttb"=>1.65,
   "ttm"=>2.98},
 "HUF"=>
  {"currency"=>{"en"=>"Hungarian Forint", "ja"=>"ハンガリー・フォリント"},
   "code"=>"HUF",
   "tts"=>0.43,
   "ttb"=>0.39,
   "ttm"=>0.63},
 "PLN"=>
  {"currency"=>{"en"=>"Polish Zloty", "ja"=>"ポーランド・ズロチ"},
   "code"=>"PLN",
   "tts"=>32.35,
   "ttb"=>29.95,
   "ttm"=>47.33},
 "TRY"=>
  {"currency"=>{"en"=>"Turkish Lira", "ja"=>"トルコ・リラ"},
   "code"=>"TRY",
   "tts"=>30.56,
   "ttb"=>25.56,
   "ttm"=>43.34}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).


### Tests


```
% bundle exec rspec
```

### Publis a new version

Create a tag to be released and push to the github reopsitory. Github actions workflow proceeds ruby gem publish process.
```
% git switch master
% vim lib/ttsttb/version.rb
% git commit lib/ttsttb/version.rb -m 'bump version'
% git tag <v0.0.0>
% git push --tags
```


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matsubo/ttsttb.
