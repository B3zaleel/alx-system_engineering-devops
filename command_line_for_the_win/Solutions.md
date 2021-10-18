# Solutions to the CMD challenge

+ 14 -> search_for_files_containing_string<br/>Print all files in the current directory, one per line (not the path, just the filename) that contain the string "500".
  ```powershell
  grep -sl 500 * .*
  ```
+ 15 -> <br/>Print the relative file paths, one path per line for all filenames that start with "access.log" in the current directory.
  ```
  find -type f -regex '.*/access.log.*'
  ```
+ 16 ->  search_for_string_in_files_recursive<br/>Print all matching lines (without the filename or the file path) in all files under the current directory that start with "access.log" that contain the string "500".
  ```powershell
  cat `find -type f -regex '.*/access.log.*' | tr \n ' '` | grep 500
  ```
+ 17 -> extract_ip_addresses<br/>Extract all IP addresses from files that start with "access.log" printing one IP address per line.
  ```powershell
  cat `find -type f -regex '.*/access.log.*' | tr '\n' ' '` | grep -oE '^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+'
  ```
+ 18 -> count_files<br/>Count the number of files in the current working directory. Print the number of files as a single integer.
  ```powershell
  find -type f -regex '.*' | wc -l
  ```
+ 19 -> simple_sort<br/>Print the contents of access.log sorted.
  ```powershell
  cat access.log | sort
  ```
+ 20 -> count_string_in_line<br/>Print the number of lines in access.log that contain the string "GET".
  ```powershell
  cat access.log | grep -o GET | wc -l
  ```
+ 21 -> split_on_a_char<br/>The file split-me.txt contains a list of numbers separated by a ; character.<br/>Split the numbers on the ; character, one number per line.
  ```powershell
  cat split-me.txt | tr ';' "\n"
  ```
+ 22 -> print_number_sequence<br/>Print the numbers 1 to 100 separated by spaces.
  ```powershell
  echo {1..9} {1..9}{0..9} 100
  ```
+ 23 -> replace_text_in_files<br/>This challenge has text files (with a .txt extension) that contain the phrase "challenges are difficult". Delete this phrase from all text files recursively.<br/>Note that some files are in subdirectories so you will need to search for them.
  ```powershell
  find -type f -regex '.*\.txt' -execdir bash -c 'cat "{}" | sed "s/challenges are difficult//g" > "{}"' \;
  ```
+ 24 -> sum_all_numbers<br/>The file sum-me.txt has a list of numbers, one per line. Print the sum of these numbers.
  ```powershell
  echo $((`cat sum-me.txt | tr '\n' '+' | rev | cut -c 2- | rev`))
  ```
+ 25 -> just_the_files<br/>Print all files in the current directory recursively without the leading directory path.
  ```powershell
  find -type f -regex '.*' -execdir bash -c 'echo {} | cut -c 3-' \;
  ```
+ 26 -> remove_extensions_from_files<br/>Rename all files removing the extension from them in the current directory recursively.
  ```powershell
  find -type f -regex '.*' -execdir bash -c 'mv {} `echo {} | sed -r "s/\.[^.\S]+$//g"`' \;
  ```
+ 27 -> replace_spaces_in_filenames<br/>The files in this challenge contain spaces. List all of the files (filenames only) in the current directory but replace all spaces with a '.' character.
  ```powershell
  find -type f -regex '.*' -execdir bash -c 'echo {} | sed -r "s/\s/./g" | cut -c 3-' \;
  ```
+ 28 -> dirs_containing_files_with_extension<br/>In this challenge there are some directories containing files with different extensions. Print all directories, one per line without duplicates that contain one or more files with a ".tf" extension.
  ```powershell
  find -type f -regex '.*\.tf$' -exec bash -c 'echo {} | grep -oE ".*/" | cut -c 3- | rev | cut -c 2- | rev' \; | sort | uniq
  ```
+ 28 -> foo<br/>
  ```powershell
  ```
