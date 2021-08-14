
RSpec.describe Cli do
    before do
        @cli = Cli.new
    end

    it "exists" do
        expect{Cli.new}.to_not raise_error
    end

end
