
class Cli

    def start
        puts "--------------------------------------------------"
        puts "Which delimiter is your data separated by?"
        puts "--------------------------------------------------"
        delimiter_options
    end

    def get_input
        print "Enter option: "
        gets.chomp
    end
    
    def delimiter_options 
        puts "Press '1' for 'comma.'"
        puts "Press '2' for 'space.'"
        puts "Press '3' for 'pipe.'"
        puts "Type 'exit' to leave the program."
        delimiter_menu
    end

    def delimiter_menu
        @delimiter = get_input
        exit if @delimiter.downcase == "exit"
        if (@delimiter == "1" || @delimiter == "2" || @delimiter == "3") 
            sort_options(@delimiter)
        else
            delimiter_options
        end
    end

    def sort_options(delimiter)
        puts "--------------------------------------------------"
        puts "How would you like to sort your data?"
        puts "--------------------------------------------------"
        puts "Press '1' to sort by gender then by last name."
        puts "Press '2' to sort by DOB then by last name."
        puts "Press '3' to sort by last name descending."
        puts "Type 'exit' to leave the program."
        sort_menu(delimiter)
    end

    def sort_menu(delimiter)
        @sort_method = get_input
        exit if @sort_method.downcase === 'exit'
        if (@sort_method == "1" || @sort_method == "2" || @sort_method == "3") 
            get_output_data(delimiter, @sort_method)
        else
            sort_options(@delimiter)
        end
    end

    def get_output_data(delimiter, sort_method)
        data = parse_comma_data if delimiter === "1"
        data = parse_space_data if delimiter === "2"
        data = parse_pipe_data  if delimiter === "3"
        
        sort_by_gender_then_last_name(data) if sort_method === "1"
        sort_by_dob_then_last_name(data) if sort_method === "2"
        sort_by_last_name_descending(data) if sort_method === "3" 
    end

    def parse_comma_data
        file = File.open("lib/comma.txt")
        file_input = file.read
        parsed_input = file_input.split(", ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.push(e.slice!(3))}
        return reorder 
    end

    def parse_space_data
        file = File.open("lib/space.txt")
        file_input = file.read
        parsed_input = file_input.split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.slice!(2)}
        return reorder
    end

    def parse_pipe_data
        file = File.open("lib/pipe.txt")
        file_input = file.read 
        parsed_input = file_input.split("| ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| [e.slice!(2), e.push(e.slice!(3))]}
        return reorder
    end

    def format_data(data)
        formatted_data = data.each {|e| [e[3] = e[3].split("-").join("/"), 
            if e[2] == "M"
                e[2] = "Male"
            elsif e[2] == "F"
                e[2] = "Female"
            end
        ]}
        return formatted_data 
    end

    def sort_by_gender_then_last_name(data)
        formatted_data = format_data(data)
        sorted_data = formatted_data.sort_by {|e| [e[2], e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        print_data(output_data)
    end

    def sort_by_dob_then_last_name(data)
        formatted_data = format_data(data)
        sorted_data = formatted_data.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        print_data(output_data)
    end

    def sort_by_last_name_descending(data)
        formatted_data = format_data(data)
        sorted_data = formatted_data.sort_by {|e| e[0]}.reverse
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        print_data(output_data) 
    end

    def print_data(data)
        puts "---------------------------------------------"
        puts "Output"
        puts ""
        puts data
        puts "---------------------------------------------"
        puts "Would you like to run again?"
        end_options
    end

    def end_options
        puts "Press '1' for yes."
        puts "Press '2' for no."
        end_menu
    end

    def end_menu
        input = get_input
        if input == "1"
            start
        elsif input == "2"
            exit
        else
            end_options
        end
    end
end
