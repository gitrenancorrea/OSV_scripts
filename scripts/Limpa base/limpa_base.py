output_lines = []

# Define a function to process a file and extract lines
def process_file(file_name):
    current_output_line = ""
    found = False
    with open(file_name, encoding="utf-8") as file:
        for line in file:
            line = line.strip()
            if "CS_SIP" in line:
                if current_output_line:
                    output_lines.append(current_output_line)
                current_output_line = line
                found = True
            elif found:
                current_output_line += " " + line
                if line == ";;":
                    output_lines.append(current_output_line)
                    current_output_line = ""
                    found = False

# Process both input files
process_file("base_CL1.txt")
process_file("base_CL2.txt")

# Save the combined results to "base_limpa.txt"
if output_lines:
    with open("base_limpa.txt", "w", encoding="utf-8") as output_file:
        output_file.write("\n".join(output_lines))
else:
    print("Valor não encontrado.")
