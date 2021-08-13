
class Cli

    def start
        # parse_by_comma_sort_1
        # parse_by_comma_sort_2
        # parse_by_comma_sort_3
        # parse_by_space_sort_1
        # parse_by_space_sort_2
        # parse_by_space_sort_3
        # parse_by_pipe_sort_1
        # parse_by_pipe_sort_2
        # parse_by_pipe_sort_3
        parse("comma", "sort_by_dob_then_last_name")
    end

    def parse(delimiter, sort_method)
        data = parse_comma_data if delimiter === "comma"
        data = parse_space_data if delimiter === "space"
        data = parse_pipe_data  if delimiter === "pipe"

        if sort_method === "sort_by_dob_then_last_name"
            sort_by_dob_then_last_name(data)
        end
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

    def sort_by_dob_then_last_name(data)
        formatted_data = data.each {|e| e[3] = e[3].split("-").join("/")} 
        sorted_data = formatted_data.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
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

    def parse_by_comma_sort_1
        file = File.open("lib/config/comma.txt")
        file_input = file.read
        parsed_input = file_input.split(", ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.push(e.slice!(3))}
        sorted_data = reorder.sort_by {|e| [e[2], e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 1  (parse by comma)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_comma_sort_2
        file = File.open("lib/config/comma.txt")
        file_input = file.read 
        parsed_input = file_input.split(", ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.push(e.slice!(3))}
        sorted_data = reorder.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 2  (parse by comma)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end
    
    def parse_by_comma_sort_3
        file = File.open("lib/config/comma.txt")
        file_input = file.read 
        parsed_input = file_input.split(", ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.push(e.slice!(3))}
        sorted_data = reorder.sort_by {|e| e[0]}.reverse
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 3  (parse by comma)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_space_sort_1
        file = File.open("lib/config/space.txt")
        file_input = file.read
        parsed_input = file_input.split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.slice!(2)}
        formatted_data = reorder.each {|e| e[3] = e[3].split("-").join("/")} 
        sorted_data = formatted_data.sort_by {|e| [e[2], e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 1  (parse by space)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_space_sort_2
        file = File.open("lib/config/space.txt")
        file_input = file.read
        parsed_input = file_input.split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.slice!(2)}
        formatted_data = reorder.each {|e| e[3] = e[3].split("-").join("/")} 
        sorted_data = formatted_data.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 2  (parse by space)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_space_sort_3
        file = File.open("lib/config/space.txt")
        file_input = file.read
        parsed_input = file_input.split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| e.slice!(2)}
        formatted_data = reorder.each {|e| e[3] = e[3].split("-").join("/")}
        sorted_data = formatted_data.sort_by {|e| e[0]}.reverse
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 3  (parse by comma)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_pipe_sort_1
        file = File.open("lib/config/pipe.txt")
        file_input = file.read 
        parsed_input = file_input.split("| ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| [e.slice!(2), e.push(e.slice!(3))]}
        formatted_data = reorder.each {|e| e[3] = e[3].split("-").join("/")}
        sorted_data = formatted_data.sort_by {|e| [e[2], e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 1  (parse by pipe)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_pipe_sort_2
        file = File.open("lib/config/pipe.txt")
        file_input = file.read 
        parsed_input = file_input.split("| ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| [e.slice!(2), e.push(e.slice!(3))]}
        formatted_data = reorder.each {|e| e[3] = e[3].split("-").join("/")}
        sorted_data = formatted_data.sort_by {|e| [e[3].split("/")[2].to_i, e[0]] }
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 2  (parse by pipe)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end

    def parse_by_pipe_sort_3
        file = File.open("lib/config/pipe.txt")
        file_input = file.read 
        parsed_input = file_input.split("| ").join(" ").split("\n")
        parsed_input_array = parsed_input.map {|i| i.split(" ")}
        reorder = parsed_input_array.each {|e| [e.slice!(2), e.push(e.slice!(3))]}
        formatted_data = reorder.each {|e| e[3] = e[3].split("-").join("/")}
        sorted_data = formatted_data.sort_by {|e| e[0]}.reverse
        parsed_data = sorted_data.map {|e| e.join(" ")}
        output_data = parsed_data.join("\n")
        puts "---------------------------------------------"
        puts "Output 3  (parse by pipe)"
        puts ""
        puts output_data
        puts "---------------------------------------------"
    end 

end