require_relative '../lib/tasks/practice_test'

# to run all tests in this spec folder do this:
# bundle exec rspec or bin/rspec

describe PracticeTest do
  context 'when something happens' do
    # setup state for tests
    before do
      @p = PracticeTest.new
    end

    # or setup states for test like this
    # let(:p) {PracticeTest.new}

    it 'this will happen' do
      result = @p.add(1,2)
      expect(result).to equal(3)
    end

    it 'this wont happen' do
      result = @p.add(1,2)
      expect(result).to_not equal(2)
    end

  end
end