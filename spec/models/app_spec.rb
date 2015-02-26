require 'rails_helper'

describe App, type: :model do
  it { should have_many(:categories) }
  it { should accept_nested_attributes_for(:categories) }
end
