# If you get the following message it’s possible that you have PG in launchctl which may prevent you from stopping the server:

# pg_ctl: server does not shut down

# In that case let’s remove PG from launchctl for now, you can add it back later by following the instructions given on brew info postgres:

launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist;
rm ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist

# Then try stopping the server again:

# pg_ctl -D /usr/local/var/postgres stop -m fast
 
# This would be good news:

# pg_ctl: PID file "/usr/local/var/postgres/postmaster.pid" does not exist
# Is server running?
