# Shell Redirections

This project contains _Shell_ related tasks.

## Tasks Completed

+ [x] 0\. Hello World<br/>_**0-hello_world**_ prints “Hello, World”, followed by a new line to the standard output.
+ [x] 1\. Confused smiley<br/>_**1-confused_smiley**_ displays a confused smiley `"(Ôo)'`.
+ [x] 2\. Let's display a file<br/>_**2-hellofile**_ displays the content of the `/etc/passwd` file.
+ [x] 3\. What about 2?<br/>_**3-twofiles**_ displays the content of `/etc/passwd` and `/etc/hosts`.
+ [x] 4\. Last lines of a file<br/>_**4-lastlines**_ displays the last 10 lines of `/etc/passwd`.
+ [x] 5\. I'd prefer the first ones actually<br/>_**5-firstlines**_ displays the first 10 lines of `/etc/passwd`.
+ [x] 6\. Line #2<br/>_**6-third_line**_ displays the third line of the file `iacta` which will be in the working directory without using `sed`.
+ [x] 7\. It is a good file that cuts iron without making a noise<br/>_**7-file**_ creates a file named exactly `\*\\'"Holberton School"\'\\*$\?\*\*\*\*\*:)` containing the text `Holberton School` ending by a new line.
+ [x] 8\. Save current state of directory<br/>_**8-cwd_state**_ writes into the file `ls_cwd_content` the result of the command `ls -la`. If the file `ls_cwd_content` already exists, it is overwritten. If the file `ls_cwd_content` does not exist, it is created.
+ [x] 9\. Duplicate last line<br/>_**9-duplicate_last_line**_ duplicates the last line of the file `iacta` which will be in the working directory.
+ [x] 10\. No more javascript<br/>_**10-no_more_js**_ deletes all the regular files (not the directories) with a `.js` extension that are present in the current directory and all its subfolders.
+ [x] 11\. Don't just count your directories, make your directories count<br/>_**11-directories**_ counts the number of directories and sub-directories in the current directory.<br/>    &bullet;The current and parent directories should not be taken into account<br/>    &bullet;Hidden directories should be counted.
+ [x] 12\. What’s new<br/>_**12-newest_files**_ displays the 10 newest files in the current directory.<br/>Requirements:<br/>    &bullet;One file per line<br/>    &bullet;Sorted from the newest to the oldest
+ [x] 13\. Being unique is better than being perfect<br/>_**13-unique**_ takes a list of words as input and prints only words that appear exactly once.<br/>    &bullet;Input format: One line, one word<br/>    &bullet;Output format: One line, one word<br/>    &bullet;Words should be sorted.
+ [x] 14\. It must be in that file<br/>_**14-findthatword**_ displays lines containing the pattern “root” from the file `/etc/passwd`.
+ [x] 15\. Count that word<br/>_**15-countthatword**_ displays the number of lines that contain the pattern “bin” in the file `/etc/passwd`.
+ [x] 16\. What's next?<br/>_**16-whatsnext**_ displays lines containing the pattern “root” and 3 lines after them in the file `/etc/passwd`.
+ [x] 17\. I hate bins<br/>_**17-hidethisword**_ displays all the lines in the file `/etc/passwd` that do not contain the pattern “bin”.
+ [x] 18\. Letters only please<br/>_**18-letteronly**_ displays all lines of the file `/etc/ssh/sshd_config` starting with a letter including capital letters as well.
+ [x] 19\. A to Z<br/>_**19-AZ**_ replaces all characters `A` and `c` from input to `Z` and `e` respectively.
+ [x] 20\. Without C, you would live in hiago<br/>_**20-hiago**_ removes all letters `c` and `C` from input.
+ [x] 21\. esreveR<br/>_**21-reverse**_ reverses its input.
+ [x] 22\. DJ Cut Killer<br/>_**22-users_and_homes**_ displays all users and their home directories, sorted by users. The script is based on the the `/etc/passwd` file.
+ [x] 23\. Empty casks make the most noise<br/>_**100-empty_casks**_ finds all empty files and directories in the current directory and all sub-directories.<br/>    &bullet;Only the names of the files and directories should be displayed (not the entire path)<br/>    &bullet;Hidden files should be listed<br/>    &bullet;One file name per line<br/>    &bullet;The listing should end with a new line<br/>    &bullet;You are not allowed to use `basename`, `grep`, `egrep`, `fgrep` or `rgrep`.
+ [x] 24\. A gif is worth ten thousand words<br/>_**101-gifs**_ lists all the files with a `.gif` extension in the current directory and all its sub-directories.<br/>    &bullet;Hidden files should be listed<br/>    &bullet;Only regular files (not directories) should be listed<br/>    &bullet;The names of the files should be displayed without their extensions<br/>    &bullet;The files should be sorted by byte values, but case-insensitive (file `aaa` should be listed before file `bbb`, file `.b` should be listed before file `a`, and file `Rona` should be listed after file `jay`)<br/>    &bullet;One file name per line<br/>    &bullet;The listing should end with a new line<br/>    &bullet;You are not allowed to use `basename`, `grep`, `egrep`, `fgrep` or `rgrep`
+ [x] 25\. Acrostic<br/>_**102-acrostic**_ decodes acrostics that use the first letter of each line.<br/>    &bullet;The ‘decoded’ message has to end with a new line<br/>    &bullet;You are not allowed to use `grep`, `egrep`, `fgrep` or `rgrep`
+ [x] 26\. The biggest fan<br/>_**103-the_biggest_fan**_ parses web servers logs in TSV format as input and displays the 11 hosts or IP addresses which did the most requests.<br/>    &bullet;Order by number of requests, most active host or IP at the top<br/>    &bullet;You are not allowed to use `grep`, `egrep`, `fgrep` or `rgrep`
