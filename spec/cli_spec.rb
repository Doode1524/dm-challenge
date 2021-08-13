
RSpec.describe Cli do
    before do
        @cli = Cli.new
        data = "Abercrombie, Neil, Male, Tan, 2/13/1943
        Bishop, Timothy, Male, Yellow, 4/23/1967
        Kelly, Sue, Female, Pink, 7/12/1959"
    end
    it "works" do
        expect (@cli.parse("1", "1")).to output ("Kelly Sue Female 7/12/1959 Pink
            Abercrombie Neil Male 2/13/1943 Tan
            Bishop Timothy Male 4/23/1967 Yellow").to_stdout
    end
end