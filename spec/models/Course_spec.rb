require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '#initialize' do
    it 'has a name' do
      course = Course.new(name: 'french')
      expect(course.name.present?).to eq(true)
    end
  end
end
