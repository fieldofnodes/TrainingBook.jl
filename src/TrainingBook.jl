module TrainingBook

   using Revise
   using TrainingContent: TrainingTableData,contents_range

    export 
        TrainingTableData,
        generate_module_list,
        write_training_book_list_to_file

        function generate_chapter_input()
            return """
            \\input{TrainingBook/introduction.tex}
            """
        end


        function generate_input(module_number::Int)
            # Format the module number with leading zeros
            formatted_number = lpad(module_number, 2, "0")
            
            return "\\input{TrainingBook/module$formatted_number.tex}"
        end


        function generate_module_list(ttd::TrainingTableData)
            # Generate the list of modules
            module_list = ""
            for i in contents_range(ttd)
                module_list *= generate_input(i) * "\n"
            end
            join([generate_chapter_input(), module_list])
        end

        function write_training_book_list_to_file(filename::String,ttd::TrainingTableData)
            table = generate_module_list(ttd)
            open(filename, "w") do file
                write(file, table)
            end
        end
end
