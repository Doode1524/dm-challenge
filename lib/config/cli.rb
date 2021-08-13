
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
        sort_options(@delimiter)
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
        parse(delimiter, @sort_method)
    end

    def parse(delimiter, sort_method)
        data = parse_comma_data if delimiter === "1"
        data = parse_space_data if delimiter === "2"
        data = parse_pipe_data  if delimiter === "3"
        
        sort_by_gender_then_last_name(data) if sort_method === "1"
        sort_by_dob_then_last_name(data) if sort_method === "2"
        sort_by_last_name_descending(data) if sort_method === "3" 
    end

    def parse_comma_data
        file = File.open("lib/config/comma.txt")
        file_input = file.read
        parsed_input = file_input.split(", ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.push(e.slice!(3))}
        return reorder 
    end

    def parse_space_data
        file = File.open("lib/config/space.txt")
        file_input = file.read
        parsed_input = file_input.split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.slice!(2)}
        return reorder
    end

    def parse_pipe_data
        file = File.open("lib/config/pipe.txt")
        file_input = file.read 
        parsed_input = file_input.split("| ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| [e.slice!(2), e.push(e.slice!(3))]}
        return reorder
    end

    def sort_by_gender_then_last_name(data)
        formatted_data = data.each {|e| e[3] = e[3].split("-").join("/")} 
        sorted_data = formatted_data.sort_by {|e| [e[2], e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        print_data(output_data)
    end

    def sort_by_dob_then_last_name(data)
        formatted_data = data.each {|e| e[3] = e[3].split("-").join("/")} 
        sorted_data = formatted_data.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        print_data(output_data)
    end

    def sort_by_last_name_descending(data)
        formatted_data = data.each {|e| e[3] = e[3].split("-").join("/")}
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
    end
end

      # sort1 = "sort_by_gender_then_last_name"
        # sort2 = "sort_by_dob_then_last_name"
        # sort3 = "sort_by_last_name_descending"
        # parse("space", sort3)