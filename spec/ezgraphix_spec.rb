#using rspec 1.1.11
require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + '/../lib/ezgraphix/ezgraphix'

include Ezgraphix

describe Graphic do
  
  before do
    @g = Graphic.new
  end
    
  it do
    @g.should be_an_instance_of(Graphic)
  end
  
  it do
    @g.should have(4).defaults
  end
  
  it "should have right defaults" do
    @g.defaults.values_at(:c_type, :w, :h, :div_name).should == ['col3d', 300, 300, 'basic_graph']
  end
  
  before do
    @g = Graphic.new(:c_type => 'bar2d', :w => 200, :caption => 'ezgraphix spec')
  end
  
  it "should merge defaults and options" do
    @g.render_options.values_at(:c_type, :w, :h, :div_name, :caption).should == ['bar2d', 200, 300, 'basic_graph', 'ezgraphix spec']
  end
  
  it "should have chart type, width, height and div_name" do
    @g.c_type.should == 'bar2d'
    @g.w.should == 200
    @g.h.should == 300
    @g.div_name.should == 'basic_graph'
  end  
  
  it "should have colors"  do
    Graphic::COLORS.should_not be_empty
  end
  
  it "should have valid colors" do
    @g.rand_color.should be_instance_of(String)
    @g.rand_color.length.should == 6
    
  end
  
end
