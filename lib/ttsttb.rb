require 'ttsttb/version'
require 'nokogiri'
require 'open-uri'
require 'date'

# Scrape TTS and TTB data from MURC.
module Ttsttb
  # Execute scraping
  def self.find(date)
    # TODO
    raise 'Today is not supported yet.' if date == Date.today

    begin
      doc = Nokogiri::HTML(URI.open(url(date), :redirect => false).read.encode('utf-8'))
      scrape(doc)
    rescue OpenURI::HTTPRedirect
      raise 'Data is not found on the MUFG page corresponding to the specificate date.'
    end
  end

  def self.url(date)
    url = format('http://www.murc-kawasesouba.jp/fx/past/index.php?id=%<ymd>s',
           { :ymd => date.strftime('%y%m%d') })
    URI.open(url, :redirect => false)
    return url
  rescue OpenURI::HTTPRedirect
    return format('http://www.murc-kawasesouba.jp/fx/past_3month_result.php?y=%<y>s&m=%<m>s&d=%<d>s&c=',
           {
             :y => date.strftime('%Y'),
             :m => date.strftime('%m'),
             :d => date.strftime('%d')
           })
  end

  # parse document
  def self.scrape(doc)
    rows = {}
    doc.xpath('//table[1]/tr').each do |tr|
      tds = tr.xpath('.//td')

      next unless tds[0]

      tts = normalize(tds[3].content)
      ttb = normalize(tds[4].content)

      rows[tds[2].content] = {
        'currency' => {
          'en' => tds[0].content,
          'ja' => tds[1].content
        },
        'code' => tds[2].content,
        'tts' => tts,
        'ttb' => ttb,
        'ttm' => get_ttm(tts, ttb)
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

    ((BigDecimal(tts.to_s) + BigDecimal(ttb.to_s)) / 2).round(2).to_f
  end
end
