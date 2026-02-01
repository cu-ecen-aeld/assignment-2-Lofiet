#include <stdint.h>
#include <syslog.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>

int main(int argc, char **argv)
{
    const char* usage[] = {
        "writer WRITEFILE WRITESTR\n",
        "WRITEFILE Path to a file to write to\n",
        "WRITESTR A text string to write to a file to\n",
        NULL
    }; 
    int fd = 0;
    ssize_t write_size = 0;
    int close_status = 0;

    openlog(argv[0], LOG_PID | LOG_ODELAY | LOG_PERROR, LOG_USER);
    /*check for two command line arguments*/
    if (argc != 3) {
        syslog(LOG_ERR, "Need to have 2 Arguments not %d", argc);
        syslog(LOG_ERR, "writer WRITEFILE WRITESTR");
        syslog(LOG_ERR, "WRITEFILE Path to a file to write to");
        syslog(LOG_ERR, "WRITESTR A text string to write to a file to");
        return 1;
    }

    char* write_file = argv[1];
    char* write_str = argv[2];

    fd = open(write_file, O_CREAT | O_WRONLY, 0664);
    if (fd < 0) {
        syslog(LOG_ERR, "Error opening the file (%s) for writing: \n%m", write_file);
        return 1;
    }
    /* Make sure write_file */
    syslog(LOG_DEBUG, "Writing %s to %s", write_str, write_file);
    write_size = write(fd, write_str, strlen(write_str));
    
    if (write_size < 0) {
        syslog(LOG_ERR, "File was not written: \n%m");
    }

    close_status = close(fd);

    if (close_status == -1) {
        syslog(LOG_ERR, "Error Closing file %s(%d): \n%m", write_file, fd);
    }

    return 0;
}