require 'spec_helper'

describe Location do
  before { @location = Location.new(code: "XYZ", name: "XYZ Branch") }
  
  subject { @locaction }
  
  it { should respond_to(:code) }
  it { should respond_to(:name) }

end
