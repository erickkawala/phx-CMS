find / -name pg_upgrade_server.log

/*
You may encounter the following error:

*failure*
Consult the last few lines of "pg_upgrade_server.log" for
the probable cause of the failure.

There seems to be a postmaster servicing the new cluster.
Please shutdown that postmaster and try again.
Failure, exiting
 
This means you have at least one PG server running. So go back to the beginning of this section and make real sure you shut down all your servers.

You can also check this pg_upgrade_server.log file to be certain of the issue. It should be located in /usr/local/var/log/pg_upgrade_server.log but you can always use the find command to locate it:

*/
