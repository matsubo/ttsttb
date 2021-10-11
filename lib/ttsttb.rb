require 'ttsttb/version'
require 'nokogiri'

# Scrape TTS and TTB data from MURC.
module Ttsttb
  # Execute scraping
  def self.find(date)
    # TODO
    raise 'Today is not supported yet.' if date == Date.today

    require 'date'

    begin
      url = format('http://www.murc-kawasesouba.jp/fx/past/index.php?id=%s', date.strftime('%y%m%d'))
      URI.open(url, :redirect => false)
    rescue OpenURI::HTTPRedirect => e
      url = format('http://www.murc-kawasesouba.jp/fx/past_3month_result.php?y=%s&m=%s&d=%s&c=',
                   date.strftime('%Y'),
                   date.strftime('%m'),
                   date.strftime('%d'),
                  )
    end

    

    require 'open-uri'

    begin
      doc = Nokogiri::HTML(URI.open(url, :redirect => false).read.encode('utf-8'))
      scrape(doc)
    rescue OpenURI::HTTPRedirect => e
      raise 'Data is not found on the MUFG page corresponding to the specificate date.'
    end
  end

  # parse document
  def self.scrape(doc)
    rows = {}
    doc.xpath('//table[1]/tr').each do |tr|
      tds = tr.xpath('.//td')

      next unless tds[0]

      rows[tds[2].content] = {
        'currency' => {
          'en' => tds[0].content,
          'ja' => tds[1].content
        },
        'code' => tds[2].content,
        'tts' => normalize(tds[3].content),
        'ttb' => normalize(tds[4].content),
        'ttm' => get_ttm(normalize(tds[3].content), normalize(tds[4].content))
      }
    end

    rows
  end

  # normalize string to float
  def self.normalize(value)
    value = value.strip
    return nil if value == 'unquoted'

    value.to_f
  end

  # calculate TTM
  def self.get_ttm(tts, ttb)
    require 'bigdecimal'

    return nil unless tts && ttb

    (BigDecimal(tts.to_s) + BigDecimal(ttb.to_s) / 2).round(2).to_f
  end
end
