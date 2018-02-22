require 'ttsttb/version'

module Ttsttb
  def self.find(date)
    require 'date'
    url = 'http://www.murc-kawasesouba.jp/fx/past/index.php?id=%s' % [date.strftime('%y%m%d')]

    rows = {}

    require 'open-uri'
    require 'nokogiri'

    doc = Nokogiri::HTML(open(url))
    doc.xpath('//table[1]/tr').each do |tr|
      tds = tr.xpath('.//td')

      next unless tds[0]

      rows[tds[2].content] = {
        'currency' => {
          'en' => tds[0].content,
          'ja' => tds[1].content
        },
        'code' => tds[2].content,
        'tts' => tds[3].content.strip.to_f,
        'ttb' => tds[4].content.strip.to_f
      }
    end

    rows
  end
end
