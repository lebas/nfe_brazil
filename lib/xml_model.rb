module XmlModel
  require 'nokogiri'
  

  ##### file:///Users/eduardo/Desktop/Manual_de_Orientacao_Contribuinte_v_6.00.pdf
  class v1
    def initialize 
      @xml = nil
    end

    # format [{:name=>"n5", :partnumber=>"p5"}, {:name=>"n3", :partnumber=>"p3"}, {:name=>"n1", :partnumber=>"p1"}] 
    def set_products(list = [])
      @xml = Nokogiri::XML::Builder.new do |xml|
        xml.enviNFe('xmlns' => 'http://www.portalfiscal.inf.br/nfe' ) do 
          xml.products{
            list.each do |item|
              xml.product {
                xml.name_         item[:name]
                xml.partnumber_   item[:partnumber]
              }
            end
          }
        end
      end
    end

    def print_xml
      unless @xml.nil?
        fl = File.new("nfe.xml", "w")
        fl.write(@xml.to_xml)
        fl.close
      end
    end
  end
end
