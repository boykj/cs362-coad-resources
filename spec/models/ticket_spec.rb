require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it {should belong_to(:organization)}
  it {should belong_to(:region)}
  it {should belong_to(:resource_category)}
end
