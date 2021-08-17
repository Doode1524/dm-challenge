
RSpec.describe Cli do
    
    context "Cli class" do
        
        it "exists" do
            expect{Cli.new}.to_not raise_error
        end
    end

    context "parse_comma_data" do

        before do
            def parse_comma_data
                file_input = "Abercrombie, Neil, Male, Tan, 2/13/1943
                Bishop, Timothy, Male, Yellow, 4/23/1967
                Kelly, Sue, Female, Pink, 7/12/1959"
                parsed_input = file_input.split(", ").join(" ").split("\n")
                parsed_input_array = parsed_input.map {|i| i.split(" ")}
                reorder = parsed_input_array.each {|e| e.push(e.slice!(3))}
                return reorder 
            end
        end

        it "has a parse_comma_data method" do
            expect{Cli.new.parse_comma_data}.to_not raise_error
        end

        it "correctly parses data" do
            expect(parse_comma_data).to eq([["Abercrombie", "Neil", "Male", "2/13/1943", "Tan"],
                ["Bishop", "Timothy", "Male", "4/23/1967", "Yellow"],
                ["Kelly", "Sue", "Female", "7/12/1959", "Pink"]])
        end
    end

    context "parse_space_data" do

        before do
            def parse_space_data
                file_input = "Kournikova Anna F F 6-3-1975 Red
                Hingis Martina M F 4-2-1979 Green
                Seles Monica H F 12-2-1973 Black"
                parsed_input = file_input.split("\n")
                parsed_input_array = parsed_input.map {|i| i.split(" ")}
                reorder = parsed_input_array.each {|e| e.slice!(2)}
                return reorder
            end
        end

        it "has a parse_space_data method" do
            expect{Cli.new.parse_space_data}.to_not raise_error
        end

        it "correctly parses data" do
            expect(parse_space_data).to eq([["Kournikova", "Anna", "F", "6-3-1975", "Red"], 
                ["Hingis", "Martina", "F", "4-2-1979", "Green"], 
                ["Seles", "Monica", "F", "12-2-1973", "Black"]])
        end
    end

    context "parse_pipe_data" do

        before do
            def parse_pipe_data
                file_input = "Smith | Steve | D | M | Red | 3-3-1985
                Bonk | Radek | S | M | Green | 6-3-1975
                Bouillon | Francis | G | M | Blue | 6-3-1975
                Grouillon | Francis | G | F | Blue | 6-3-1975"
                parsed_input = file_input.split("| ").join(" ").split("\n")
                parsed_input_array = parsed_input.map {|i| i.split(" ")}
                reorder = parsed_input_array.each {|e| [e.slice!(2), e.push(e.slice!(3))]}
                return reorder
            end
        end

        it "has a parse_pipe_data method" do
            expect{Cli.new.parse_pipe_data}.to_not raise_error
        end

        it "correctly parses data" do
            expect(parse_pipe_data).to eq([["Smith", "Steve", "M", "3-3-1985", "Red"], ["Bonk", "Radek", "M", "6-3-1975", "Green"], 
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

            def sort_by_dob_then_last_name(data)
                sorted_data = data.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
                parsed_data = sorted_data.map {|e| e.join(" ")}
                output_data = parsed_data.join("\n")
                return output_data
            end
        
            def sort_by_last_name_descending(data)
                sorted_data = data.sort_by {|e| e[0]}.reverse
                parsed_data = sorted_data.map {|e| e.join(" ")}
                output_data = parsed_data.join("\n")
                return output_data
            end
        end

        it "sorts data by gender then by last name" do
            expect(sort_by_gender_then_last_name(@data)).to eq("Grouillon Francis Female 6/3/1975 Blue\nBonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nSmith Steve Male 3/3/1985 Red")
        end

        it "sorts data by DOB then by last name" do
            expect(sort_by_dob_then_last_name(@data)).to eq("Bonk Radek Male 6/3/1975 Green\nBouillon Francis Male 6/3/1975 Blue\nGrouillon Francis Female 6/3/1975 Blue\nSmith Steve Male 3/3/1985 Red")
        end

        it "sorts data by last name, descending" do
            expect(sort_by_last_name_descending(@data)).to eq("Smith Steve Male 3/3/1985 Red\nGrouillon Francis Female 6/3/1975 Blue\nBouillon Francis Male 6/3/1975 Blue\nBonk Radek Male 6/3/1975 Green")
        end
    end

end
