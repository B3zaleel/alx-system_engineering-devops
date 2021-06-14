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
+ [ ] 7\. It is a good file that cuts iron without making a noise<br/>_**7-file**_ creates a file named exactly `\*\\'"Holberton School"\'\\*$\?\*\*\*\*\*:)` containing the text `Holberton School` ending by a new line.
+ [x] 8\. Save current state of directory<br/>_**8-cwd_state**_ writes into the file `ls_cwd_content` the result of the command `ls -la`. If the file `ls_cwd_content` already exists, it is overwritten. If the file `ls_cwd_content` does not exist, it is created.
+ [x] 9\. Duplicate last line<br/>_**9-duplicate_last_line**_ duplicates the last line of the file `iacta` which will be in the working directory.
+ [x] 10\. No more javascript<br/>_**10-no_more_js**_ deletes all the regular files (not the directories) with a `.js` extension that are present in the current directory and all its subfolders.
+ [ ] 11\.  Don't just count your directories, make your directories count<br/>_**11-directories**_ counts the number of directories and sub-directories in the current directory.<br/>&bullet;The current and parent directories should not be taken into account<br/>&bullet;Hidden directories should be counted.
+ [ ] 12\. What’s new<br/>_**12-newest_files**_ displays the 10 newest files in the current directory.<br/>Requirements:<br/>    &bullet;One file per line<br/>    &bullet;Sorted from the newest to the oldest
+ [x] 13\. Being unique is better than being perfect<br/>_**13-unique**_ takes a list of words as input and prints only words that appear exactly once.<br/>&bullet;Input format: One line, one word<br/>&bullet;Output format: One line, one word<br/>&bullet;Words should be sorted.
+ [x] 14\. It must be in that file<br/>_**14-findthatword**_ displays lines containing the pattern “root” from the file `/etc/passwd`.
+ [x] 15\. Count that word<br/>_**15-countthatword**_ displays the number of lines that contain the pattern “bin” in the file `/etc/passwd`.
+ [x] 16\. What's next?<br/>_**16-whatsnext**_ displays lines containing the pattern “root” and 3 lines after them in the file `/etc/passwd`.
+ [ ] 17\. I hate bins<br/>_**17-hidethisword**_ displays all the lines in the file `/etc/passwd` that do not contain the pattern “bin”.
+ [x] 18\. Letters only please<br/>_**18-letteronly**_ displays all lines of the file `/etc/ssh/sshd_config` starting with a letter including capital letters as well.
+ [ ] 19\. A to Z<br/>_**19-AZ**_ replaces all characters `A` and `c` from input to `Z` and `e` respectively.
+ [ ] 20\. Without C, you would live in hiago<br/>_**20-hiago**_ removes all letters `c` and `C` from input.
+ [ ] 21\. esreveR<br/>_**21-reverse**_ reverses its input.
+ [ ] 22\. DJ Cut Killer<br/>_**22-users_and_homes**_ displays all users and their home directories, sorted by users. The script is based on the the `/etc/passwd` file.
