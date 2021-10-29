
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

/**
 * infinite_while - Initializes an infinite while loop.
 *
 * Return: 0 if interrupted by a signal.
 */
int infinite_while(void)
{
	while (1)
	{
		sleep(1);
	}
	return (0);
}

/**
 * create_process - Creates a new process and \
 * prints the PID of the new process.
 */
void create_process(void)
{
	int rc = fork();

	if (rc == 0)
	{
		printf("Zombie process created, PID: %d\n", getpid());
		exit(0);
	}
}

/**
 * main - Creates 5 zombie processes.
 *
 * Return: 0 if successful
 */
int main(void)
{
	create_process();
	create_process();
	create_process();
	create_process();
	create_process();
	return (infinite_while());
}
