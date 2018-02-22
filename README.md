# TTS TTB library

[TTS and TTB value of Forex](http://www.murc-kawasesouba.jp/fx/past_3month.php) is  provided by MUFG. Major information provider of TTS and TTB is MUFG in Japan but the data is not provided by commonly used data format like CSV and JSON to handle by program for ease.

I created Ruby gem to get the TTS and TTB corresponding to the passed date. You can get hash of currency code key and value of TTS and TTB.

__Caution__ : This library has no test and exception handling is not tested to cover all the source data.


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
irb(main):003:0> pp Ttsttb.find(Date.new(2018, 1, 7))['USD']['tts']
108.52
irb(main):004:0> pp Ttsttb.find(Date.new(2018, 1, 1)); nil
{"USD"=>
  {"currency"=>{"en"=>"US Dollar", "ja"=>"米ドル"},
   "code"=>"USD",
   "tts"=>108.52,
   "ttb"=>106.52},
 "EUR"=>
  {"currency"=>{"en"=>"Euro", "ja"=>"ユーロ"},
   "code"=>"EUR",
   "tts"=>133.41,
   "ttb"=>130.41},
 "CAD"=>
  {"currency"=>{"en"=>"Canadian Dollar", "ja"=>"カナダ・ドル"},
   "code"=>"CAD",
   "tts"=>86.23,
   "ttb"=>83.03},
 "GBP"=>
  {"currency"=>{"en"=>"Pound Sterling", "ja"=>"英ポンド"},
   "code"=>"GBP",
   "tts"=>153.49,
   "ttb"=>145.49},
 "CHF"=>
  {"currency"=>{"en"=>"Swiss Franc", "ja"=>"スイス･フラン"},
   "code"=>"CHF",
   "tts"=>115.36,
   "ttb"=>113.56},
 "DKK"=>
  {"currency"=>{"en"=>"Danish Krone", "ja"=>"デンマーク・クローネ"},
   "code"=>"DKK",
   "tts"=>18.01,
   "ttb"=>17.41},
 "NOK"=>
  {"currency"=>{"en"=>"Norwegian Krone", "ja"=>"ノルウェー・クローネ"},
   "code"=>"NOK",
   "tts"=>13.96,
   "ttb"=>13.36},
 "SEK"=>
  {"currency"=>{"en"=>"Swedish Krona", "ja"=>"スウェーデン・クローネ"},
   "code"=>"SEK",
   "tts"=>13.61,
   "ttb"=>12.81},
 "AUD"=>
  {"currency"=>{"en"=>"Australian Dollar", "ja"=>"オーストラリア・ドル"},
   "code"=>"AUD",
   "tts"=>85.83,
   "ttb"=>81.83},
 "NZD"=>
  {"currency"=>{"en"=>"New Zealand Dollar", "ja"=>"ニュージーランド・ドル"},
   "code"=>"NZD",
   "tts"=>80.63,
   "ttb"=>76.63},
 "HKD"=>
  {"currency"=>{"en"=>"Hong Kong Dollar", "ja"=>"香港ドル"},
   "code"=>"HKD",
   "tts"=>14.17,
   "ttb"=>13.31},
 "MYR"=>
  {"currency"=>{"en"=>"Malaysian Ringgit", "ja"=>"マレーシア・リンギット"},
   "code"=>"MYR",
   "tts"=>0.0,
   "ttb"=>0.0},
 "SGD"=>
  {"currency"=>{"en"=>"Singapore Dollar", "ja"=>"シンガポール・ドル"},
   "code"=>"SGD",
   "tts"=>81.96,
   "ttb"=>80.3},
 "SAR"=>
  {"currency"=>{"en"=>"Saudi Riyal", "ja"=>"サウジ・リアル"},
   "code"=>"SAR",
   "tts"=>29.52,
   "ttb"=>27.92},
 "AED"=>
  {"currency"=>{"en"=>"UAE Dirham", "ja"=>"UAEディルハム"},
   "code"=>"AED",
   "tts"=>29.91,
   "ttb"=>28.55},
 "CNY"=>
  {"currency"=>{"en"=>"Yuan Renminbi", "ja"=>"中国・人民元"},
   "code"=>"CNY",
   "tts"=>17.25,
   "ttb"=>16.65},
 "THB"=>
  {"currency"=>{"en"=>"Baht", "ja"=>"タイ・バーツ"},
   "code"=>"THB",
   "tts"=>3.49,
   "ttb"=>3.33},
 "INR"=>
  {"currency"=>{"en"=>"Indian Rupee", "ja"=>"インド・ルピー"},
   "code"=>"INR",
   "tts"=>1.82,
   "ttb"=>1.52},
 "PKR"=>
  {"currency"=>{"en"=>"Pakistan Rupee", "ja"=>"パキスタン・ルピー"},
   "code"=>"PKR",
   "tts"=>1.13,
   "ttb"=>0.83},
 "KWD"=>
  {"currency"=>{"en"=>"Kuwaiti Dinar", "ja"=>"クウェート・ディナール"},
   "code"=>"KWD",
   "tts"=>367.6,
   "ttb"=>351.6},
 "QAR"=>
  {"currency"=>{"en"=>"Qatari Rial", "ja"=>"カタール・リヤル"},
   "code"=>"QAR",
   "tts"=>30.27,
   "ttb"=>28.91},
 "IDR"=>
  {"currency"=>{"en"=>"Indonesia Rupiah", "ja"=>"インドネシア・ルピア"},
   "code"=>"IDR",
   "tts"=>0.91,
   "ttb"=>0.67},
 "MXN"=>
  {"currency"=>{"en"=>"Mexican Peso", "ja"=>"メキシコ・ペソ"},
   "code"=>"MXN",
   "tts"=>6.71,
   "ttb"=>4.71},
 "KRW"=>
  {"currency"=>{"en"=>"Won", "ja"=>"韓国ウォン"},
   "code"=>"KRW",
   "tts"=>10.16,
   "ttb"=>9.76},
 "PHP"=>
  {"currency"=>{"en"=>"Philippine Peso", "ja"=>"フィリピン・ペソ"},
   "code"=>"PHP",
   "tts"=>2.22,
   "ttb"=>1.94},
 "ZAR"=>
  {"currency"=>{"en"=>"Rand", "ja"=>"南アフリカ･ランド"},
   "code"=>"ZAR",
   "tts"=>10.71,
   "ttb"=>7.71},
 "CZK"=>
  {"currency"=>{"en"=>"Czech Koruna", "ja"=>"チェコ・コルナ"},
   "code"=>"CZK",
   "tts"=>5.33,
   "ttb"=>5.09},
 "RUB"=>
  {"currency"=>{"en"=>"Russian Ruble", "ja"=>"ロシア・ルーブル"},
   "code"=>"RUB",
   "tts"=>2.14,
   "ttb"=>1.64},
 "HUF"=>
  {"currency"=>{"en"=>"Hungarian Forint", "ja"=>"ハンガリー・フォリント"},
   "code"=>"HUF",
   "tts"=>0.44,
   "ttb"=>0.4},
 "PLN"=>
  {"currency"=>{"en"=>"Polish Zloty", "ja"=>"ポーランド・ズロチ"},
   "code"=>"PLN",
   "tts"=>32.77,
   "ttb"=>30.37},
 "TRY"=>
  {"currency"=>{"en"=>"Turkish Lira", "ja"=>"トルコ・リラ"},
   "code"=>"TRY",
   "tts"=>30.83,
   "ttb"=>25.83}}
=> nil
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/matsubo/ttsttb.
