require 'rails_helper'

RSpec.describe Point, type: :model do
  it { should belong_to(:ticket) }

end
