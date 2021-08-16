
RSpec.describe Cli do
    before do
        @cli = Cli.new
    end

    context "Cli class" do
        
        it "exists" do
            expect{Cli.new}.to_not raise_error
        end
    end

    context "parse_comma_data" do

        it "has a parse_comma_data method" do
            expect{Cli.new.parse_comma_data}.to_not raise_error
        end

        it "correctly parses data" do
            expect(Cli.new.parse_comma_data).to eq([["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"],
                ["Bishop", "Timothy", "Male", "4/23/1967", "Yellow"],
                ["Kelly", "Sue", "Female", "7/12/1959", "Pink"]])
        end
    end

end
