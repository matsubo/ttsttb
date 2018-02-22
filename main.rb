require 'bundler'

Bundler.require(:default)

require 'open-uri'


class Tssttb

  def self.find(date)
    # example
    # http://www.murc-kawasesouba.jp/fx/past/index.php?id=180221

    url = 'http://www.murc-kawasesouba.jp/fx/past/index.php?id=%s'%[date.strftime('%y%m%d')]

    rows = {}

    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[1]/tr').each do |tr|

      row = {}
      tds = tr.xpath('.//td')

      next unless tds[0]

      rows[tds[2].content] =  {
        'currency' => {
          'en' => tds[0].content,
          'ja' => tds[1].content
        },
        'code' => tds[2].content,
        'tts' => tds[3].content.strip.to_f,
        'ttb' => tds[4].content.strip.to_f
      }

    end

    return rows
  end
end

puts Tssttb.find(Date.new(2018,1,1))

