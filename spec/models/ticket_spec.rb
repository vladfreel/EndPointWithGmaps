require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it { should have_one(:excavator) }
end
