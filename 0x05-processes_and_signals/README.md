# Processes and Signals

This project contains __Shell__ tasks for learning about Linux processes and signals using **bash**.

## Tasks To Complete

+ [x] 0\. What is my PID <br/>_**[0-what-is-my-pid](0-what-is-my-pid)**_ contains a Bash script that displays its own PID.
+ [x] 1\. List your processes <br/>_**[1-list_your_processes](1-list_your_processes)**_ contains a Bash script that displays a list of currently running processes.
+ [x] 2\. Show your Bash PID <br/>_**[2-show_your_bash_pid](2-show_your_bash_pid)**_ contains a Bash script that displays lines containing the `bash` word.
+ [x] 3\. Show your Bash PID made easy <br/>_**[3-show_your_bash_pid_made_easy](3-show_your_bash_pid_made_easy)**_ contains a Bash script that displays the PID, along with the process name, of processes whose name contain the word `bash` without using `ps`.
+ [x] 4\. To infinity and beyond <br/>_**[4-to_infinity_and_beyond](4-to_infinity_and_beyond)**_ contains a Bash script that displays `To infinity and beyond` indefinitely and sleeps for 2 seconds in each iteration of the loop.
+ [x] 5\. Don't stop me now! <br/>_**[5-dont_stop_me_now](5-dont_stop_me_now)**_ contains a Bash script that stops a [4-to_infinity_and_beyond](4-to_infinity_and_beyond) process using `kill`.
+ [x] 6\. Stop me if you can <br/>_**[6-stop_me_if_you_can](6-stop_me_if_you_can)**_ contains a Bash script that stops a [4-to_infinity_and_beyond](4-to_infinity_and_beyond) process without using `kill` or `killall`.
+ [x] 7\. Highlander <br/>_**[7-highlander](7-highlander)**_ contains a Bash script that displays `To infinity and beyond` indefinitely, sleeps for 2 seconds in each iteration of the loop, and displays `I am invincible!!!` when receiving a `SIGTERM` signal.<br/>_**[67-stop_me_if_you_can](67-stop_me_if_you_can)**_ is a copy of the [6-stop_me_if_you_can](6-stop_me_if_you_can) Bash script that kills the [7-highlander](7-highlander) process instead of the [4-to_infinity_and_beyond](4-to_infinity_and_beyond) process.
+ [x] 8\. Beheaded process <br/>_**[8-beheaded_process](8-beheaded_process)**_ contains a Bash script that kills the process [7-highlander](7-highlander).
+ [x] 9\. Process and PID file <br/>_**[100-process_and_pid_file](100-process_and_pid_file)**_ contains a Bash script that:
  + Creates the file `/var/run/myscript.pid` containing its PID.
  + Displays `To infinity and beyond` indefinitely.
  + Displays `I hate the kill command` when receiving a SIGTERM signal.
  + Displays `Y U no love me?!` when receiving a SIGINT signal.
  + Deletes the file `/var/run/my.pid` and terminates itself when receiving a SIGQUIT or SIGTERM signal.
+ [x] 10\. Manage my process <br/>_**[manage_my_process](manage_my_process)**_ contains a Bash script that indefinitely writes `I am alive!` to the file `/tmp/my_process` and sleeps for 2 seconds in each iteration of the loop. <br/>_**[101-manage_my_process](101-manage_my_process)**_ is a Bash script that manages [manage_my_process](manage_my_process).
  + When passing the argument `start`:
    + Starts `manage_my_process`.
    + Creates a file containing its PID in `/var/run/my_process.pid`.
    + Displays `manage_my_process started`.
  + When passing the argument `stop`:
    + Stops `manage_my_process`.
    + Deletes the file `/var/run/my_process.pid`.
    + Displays `manage_my_process stopped`.
  + When passing the argument `restart`:
    + Stops `manage_my_process`.
    + Deletes the file `/var/run/my_process.pid`.
    + Starts `manage_my_process`.
    + Creates a file containing its PID in `/var/run/my_process.pid`.
    + Displays `manage_my_process restarted`.
  + Displays `Usage: manage_my_process {start|stop|restart}` if any other argument or no argument is passed.
+ [x] 11\. Zombie <br/>_**[102-zombie.c](102-zombie.c)**_ contains a C program that creates 5 zombie processes and displays `Zombie process created, PID: ZOMBIE_PID` for every zombie process created.
