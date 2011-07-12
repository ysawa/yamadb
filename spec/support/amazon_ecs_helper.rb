module AmazonEcsHelper
  # TODO: it's not raw xml. fix it to use raw whole xml from amazon
  def amazon_item_xml
    Nokogiri::XML(<<-EOS)/'Item'
<?xml version="1.0" encoding="UTF-8"?>
<Item>
  <ASIN>B000B8PP8S</ASIN>
  <DetailPageURL>http://www.amazon.co.jp/EPI-%E3%82%A4%E3%83%BC%E3%83%94%E3%83%BC%E3%82%A2%E3%82%A4-C-5201-EPI%E3%82%A2%E3%83%AB%E3%83%9F3%E7%82%B9%E9%A3%9F%E5%99%A8%E3%82%BB%E3%83%83%E3%83%88/dp/B000B8PP8S%3FSubscriptionId%3DAKIAJPQEWR6DKZ6L4HIQ%26tag%3Dyamadb-22%26linkCode%3Dxm2%26camp%3D2025%26creative%3D165953%26creativeASIN%3DB000B8PP8S</DetailPageURL>
  <SmallImage>
    <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL75_.jpg</URL>
    <Height Units=\"pixels\">61</Height>
    <Width Units=\"pixels\">75</Width>
  </SmallImage>
  <MediumImage>
    <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL160_.jpg</URL>
    <Height Units=\"pixels\">130</Height>
    <Width Units=\"pixels\">160</Width>
  </MediumImage>
  <LargeImage>
    <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL.jpg</URL>
    <Height Units=\"pixels\">247</Height>
    <Width Units=\"pixels\">304</Width>
  </LargeImage>
  <ImageSets>
    <ImageSet Category=\"primary\">
      <SwatchImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL30_.jpg</URL>
        <Height Units=\"pixels\">24</Height>
        <Width Units=\"pixels\">30</Width>
      </SwatchImage>
      <SmallImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL75_.jpg</URL>
        <Height Units=\"pixels\">61</Height>
        <Width Units=\"pixels\">75</Width>
      </SmallImage>
      <MediumImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL160_.jpg</URL>
        <Height Units=\"pixels\">130</Height>
        <Width Units=\"pixels\">160</Width>
      </MediumImage>
      <LargeImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL.jpg</URL>
        <Height Units=\"pixels\">247</Height>
        <Width Units=\"pixels\">304</Width>
      </LargeImage>
    </ImageSet>
    <ImageSet Category=\"swatch\">
      <SwatchImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL30_.jpg</URL>
        <Height Units=\"pixels\">24</Height>
        <Width Units=\"pixels\">30</Width>
      </SwatchImage>
      <SmallImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL75_.jpg</URL>
        <Height Units=\"pixels\">61</Height>
        <Width Units=\"pixels\">75</Width>
      </SmallImage>
      <MediumImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL._SL160_.jpg</URL>
        <Height Units=\"pixels\">130</Height>
        <Width Units=\"pixels\">160</Width>
      </MediumImage>
      <LargeImage>
        <URL>http://ecx.images-amazon.com/images/I/31143DRSWYL.jpg</URL>
        <Height Units=\"pixels\">247</Height>
        <Width Units=\"pixels\">304</Width>
      </LargeImage>
    </ImageSet>
  </ImageSets>
  <ItemAttributes>
    <Binding>&#x30B9;&#x30DD;&#x30FC;&#x30C4;&#x7528;&#x54C1;</Binding>
    <Brand>EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;)</Brand>
    <EAN>4945244111975</EAN>
    <Label>EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;)</Label>
    <ListPrice>
      <Amount>1050</Amount>
      <CurrencyCode>JPY</CurrencyCode>
      <FormattedPrice>&#xFFE5; 1,050</FormattedPrice>
    </ListPrice>
    <Manufacturer>EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;)</Manufacturer>
    <Model>C-5201</Model>
    <PackageDimensions>
      <Height Units=\"hundredths-inches\">299</Height>
      <Length Units=\"hundredths-inches\">543</Length>
      <Weight Units=\"hundredths-pounds\">53</Weight>
      <Width Units=\"hundredths-inches\">543</Width>
    </PackageDimensions>
    <ProductGroup>Sports</ProductGroup>
    <Publisher>EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;)</Publisher>
    <Studio>EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;)</Studio>
    <Title>EPI(&#x30A4;&#x30FC;&#x30D4;&#x30FC;&#x30A2;&#x30A4;) EPI&#x30A2;&#x30EB;&#x30DF;3&#x70B9;&#x98DF;&#x5668;&#x30BB;&#x30C3;&#x30C8; C-5201</Title>
  </ItemAttributes>
</Item>
EOS
  end
end


