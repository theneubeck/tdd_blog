require 'spec_helper'

describe Post do
  it { should validate_presence_of(:title) }
  it { should_not allow_value("blah").for(:body) }
  it { should allow_value("a"*50).for(:body) }
end
