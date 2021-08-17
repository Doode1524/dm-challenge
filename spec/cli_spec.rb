
RSpec.describe Cli do
    
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

    context "parse_space_data" do

        it "has a parse_space_data method" do
            expect{Cli.new.parse_space_data}.to_not raise_error
        end

        it "correctly parses data" do
            expect(Cli.new.parse_space_data).to eq([["Kournikova", "Anna", "F", "6-3-1975", "Red"], 
                ["Hingis", "Martina", "F", "4-2-1979", "Green"], 
                ["Seles", "Monica", "F", "12-2-1973", "Black"]])
        end
    end

    context "parse_pipe_data" do

        it "has a parse_pipe_data method" do
            expect{Cli.new.parse_pipe_data}.to_not raise_error
        end

        it "correctly parses data" do
            expect(Cli.new.parse_pipe_data).to eq([["Smith", "Steve", "M", "3-3-1985", "Red"], ["Bonk", "Radek", "M", "6-3-1975", "Green"], 
                ["Bouillon", "Francis", "M", "6-3-1975", "Blue"], 
                ["Grouillon", "Francis", "F", "6-3-1975", "Blue"]])
        end
    end

    context "format_data" do
        before do
            @data = [["Kournikova", "Anna", "F", "6-3-1975", "Red"]]
        end
        
        it "has a format_data method that takes in one argrument" do
            expect{Cli.new.format_data(@data)}.to_not raise_error
        end

        it "correctly formats data (full gender name, and proper date format) " do
            expect(Cli.new.format_data(@data)).to eq([["Kournikova", "Anna", "Female", "6/3/1975", "Red"]])
        end
    end

    context "sort methods" do
        before do 
            @data = [["Smith", "Steve", "Male", "3/3/1985", "Red"], ["Bonk", "Radek", "Male", "6/3/1975", "Green"], 
            ["Bouillon", "Francis", "Male", "6/3/1975", "Blue"], 
            ["Grouillon", "Francis", "Female", "6/3/1975", "Blue"]]

            def sort_by_gender_then_last_name(data)
                sorted_data = data.sort_by {|e| [e[2], e[0]] }
                parsed_data = sorted_data.map {|e| e.join(" ")}
                output_data = parsed_data.join("\n")
                return output_data
            end
        end

        it "sorts data by gender then by last name" do
            expect(sort_by_gender_then_last_name(@data)).to eq("Grouillon Francis Female 6/3/1975 Blue\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nSmith Steve Male 3/3/1985 Red")
        end
    end

end
