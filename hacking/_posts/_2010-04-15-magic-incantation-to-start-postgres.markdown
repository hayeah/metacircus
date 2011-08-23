---
layout: post
title: Restart Postgres On Mac, Easy
---

My MacBook shut itself down last night, so I had to restart
postgres. It wasn't hard at all. Just some magic incantations you
might not have thought of, and would not remember next time. In
theory, the .plist added for postgres would cause it to restart
automatically, but in reality, that doesn't happen.

The reason is I've set the allowable connection number to 50 (or
something), and on postgres startup, the server would try to allocate
shared system memory per connection. Problem is there's a limit placed
on the max amount of shared system memory a process can allocate. So
I had to first raise that.

    sudo sysctl -w kern.sysv.shmmax=1073741824
    kern.sysv.shmmax: 4194304 -> 1073741824
    sudo sysctl -w kern.sysv.shmall=1073741824
    kern.sysv.shmall: 1024 -> 1073741824

Then restart,

    sudo launchctl unload -w /Library/LaunchDaemons/org.macports.postgresql84-server.plist
    sudo launchctl load -w /Library/LaunchDaemons/org.macports.postgresql84-server.plist


See, not hard at all. I bet I'll forget again. Didn't Nietzsche say
something about Eternal Recurrence? That incldues stupidity.
