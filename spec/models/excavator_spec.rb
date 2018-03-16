require 'rails_helper'

RSpec.describe Excavator, type: :model do
  it { should belong_to(:ticket) }
end
