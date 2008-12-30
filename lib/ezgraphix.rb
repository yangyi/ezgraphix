unless defined? Ezgraphix
  require 'builder'
  module Ezgraphix
    
    class Graphic
      
      attr_accessor :c_type, :w, :h, :id_name, :render_options
      
      COLORS = ['AFD8F8', 'F6BD0F', '8BBA00', 'FF8E46', '008E8E',
                'D64646', '8E468E', '588526', 'B3A00', 'B2FF66',
                'F984A1', 'A66EDD', 'B2FF66', '3300CC', '000033',
                '66FF33', '000000', 'FFFF00', '669966', 'FF3300']
      
      def initialize(options={})
        @render_options = options.merge!(self.defaults)
        @c_type = options[:c_type]
        @w = options[:w]
        @h = options[:y]
        @id_name = options[:id_name]
        @data = Hash.new
      end
      
      #c_type chart type, :w width, :h heigth
      def defaults
        {:c_type => 'bar3d', :w => 300, :h => 300, :id_name => 'basic_graph'}  
      end
      
      def rand_color
        return COLORS[rand(Graph::COLORS.size - 1)]
      end
      
      #builds the xml in order to feed and render the graph.
      def to_xml
        options = parse_options(self.render_options)
        g_xml = Builder::XmlMarkup.new
        g_xml.graph(options) do
          self.data.each{ |k,v|
            g_xml.set :value => v, :name => k, :color => g.rand_color 
          }
        end
        g_xml
      end
      
  end
end