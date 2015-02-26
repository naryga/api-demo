require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should belong_to(:app) }
end
