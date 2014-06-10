---
layout: post
title: NodeSchool Chengdu Wrap-up
---

<img src="http://i.imgur.com/ALzQfMRl.jpg" width="500"/>

NodeSchool Chengdu had 40 people showing up, and 6 coaches. The attendents learned some NodeJS, and asked for follow up events. We used [Learn You Node](http://nodeschool.io/#learn-you-node).

[Chengdu](http://en.wikipedia.org/wiki/Chengdu) is a metrapolis in central China, pop. 14 million, known for pandas, silk, and its fiery cuisine. Nowadays it has a vibrant and growing gaming industry. Come visit!

I am writing this wrap-up so next time I can avoid the same noob mistakes. Perhaps other organizers in China can use my plan as a starting point.

## Attendents

By professions (`vagrant` is a joke category... ):

<img src="https://www.evernote.com/shard/s20/sh/edee86dd-88f5-4996-a059-f06b6f474244/76a039039f9645fb84e48a8aff106030/deep/0/professional-background.png" width="600"/>

By tech background:

<img src="https://www.evernote.com/shard/s20/sh/7ca6a6ab-b3ba-4bb0-afa6-c62cc06b9d1a/dd777ba35b68adb04931aacea115b8da/deep/0/tech-background.png" width="600"/>


## The Venue

We borrowed Hoolai Games' office space in software park.

+ Plenty of chairs and table space
+ Lots of power plugs
+ Air conditioned and well-lit
+ Whiteboard & projector available
+ Wifi

## Preparation

We asked attendents to install NodeJS and NodeSchool before the event. We also told them that if they don't know how, don't worry about it. Just come and we'll help them setup.

As other NodeSchool evenets had warned, we expected wifi to be flaky at best. So I made the followings available on a USB drive:

+ VirtualBox installers for Windows and OSX.
+ Virtual Machine with NodeSchool and Sublime editor (ubuntu 12.04).
  + Built with VirtualBox.
  + Exported to ".ova" format, which is compatible with VirtualBox and VMWare.
  + The exported VM image is about 1G.
  + The running image requires 512MB of RAM.
+ Screencast explaining how to use the Virtual Machine.

Also, following Max Ogden's idea, I made a static website running on local network with basic information about NodeSchool. The USB drive's content is available for download via the static site as well.

If you want the VM image, email me. I'll find a place to upload it. The screencast I made is in Chinese.

## The Schedule

+ 1:45pm - Arrival
+ 2:00pm -> 2:10pm - Introduction to event and coaches.
+ 2:10pm -> 2:40pm - Lightning Talks.
+ 2:40pm -> 3:00pm - NodeSchool Demo
+ 3:00pm -> 3:15pm - Attendents Pairing
+ 3:15pm -> 5:00pm - NodeSchool
+ 5:00pm -> 5:30pm - Wrap-up

## Problems

Stupid mistakes were made...

+ No Mac adapter for projector... so the talks and demo (except one) were canceled.
+ Brought home-baked cookies, but forgot to hand them out.
+ Event was initially announced with a different venue. Confusion and frantic notifications days before the event.
+ Email delivery to Chinese mail services (QQ, NetEase, etc.) is flaky.

## Things To Improve

+ Don't change venue (duh).
+ Should've asked for phone numbers, and send SMS for reminders.
+ Use multiple channels to send reminders: email, sms, wechat group.
+ Bring more USB drives in a file system format that both Mac and Windows can read.
+ Although we encouraged pairing, most people didn't. Only people who came with real-life friends or co-worker paired.
+ It would've been helpful to record screencasts that solves the first 2 challenges, to show people how to interact with the nodeschool program.
+ Didn't close the event well. Haphazardly said, "ok guys, event's over. Feel free to stay or chat."
+ Some people didn't interact with their table mates much.
+ Would be nice to have schwags to hand out...
+ Would be nice to showcase some cool nodejs projects, because while many people have heard of "high-concurrency" and "async", they don't know what to build with NodeJS.

## Checklist

Here's a checklist I'd use next time for hosting NodeSchool:

### Pre-Planning

+ Go through this [thread](https://github.com/nodeschool/discussions/issues/93) to learn from other NodeSchool organizers
+ Add your event to the NodeSchool [spreadsheet](https://docs.google.com/a/github.com/spreadsheet/ccc?key=0AuOjlXjUrSbAdE1XRFJkeEJZQ1NSelhILUR0NXdBWUE#gid=0)

### Choose a venue

+ Does the projector work?
+ Enough power plugs?
+ Wifi?
+ Enough chairs and tables?
+ How many people can it fit?
+ Is the venue publicly accessible? (keycard?)
+ Are there other things going on? (Cafe? People working?)

### Announcement - (2 weeks in advance)

+ Create event announcement
  + Date and time
  + Contact info of organizer
  + Venue
  + Fee (or say "free")
  + Event size limit
  + Level of experience required (or say "none")
  + Equipment required (laptop. Mac or Windows)
  + The announcement: [gist](https://gist.github.com/hayeah/319aa17754093c05002e)
+ Sign up form should ask for:
  + Name
  + email
  + Phone number
  + Level of NodeJS experience
  + Level of JavaScript experience
  + Why do you want to attend (interesting insight here)
+ Ask local community to retweet event
+ Find volunteers to help

### Preparation

+ NodeSchool VM
+ Screencast to demo how to use VM
+ Screencast to demo NodeSchool
+ VM & videos on USB drives

### Reminder - (2 days in advance)

+ Ask attendents to install NodeSchool
+ Direction/Map to event venue
+ Reminder of event time
+ Ask attendents to arrive 15 minutes early
+ Invitation to join a chat group of some sort (WeChat in China)

### Day of Event

+ Arrive 30 minutes earlier
+ Post wifi & password on the wall
+ Post local IP of event web site
+ Give out cards for people to write their names on
+ Help early arrivers to install environment if necessary
+ Demo NodeSchool live
  + show how to run an exercise
  + show how to debug
  + show how to open documentation locally
  + show how to use dependencies preinstalled by learnyounode
+ Announce that screencasts are available on event site

### Wrap up

+ Take a group photo
+ Encourage people to stay around and chat

# Thanks

Thanks to all the attendents who came, and the coaches for their time and patience:

+ Lite
+ [Luin](http://zihua.li/)
+ [邓淼江](http://miaoo.in/)
+ 吴东强
+ [杨雄](https://github.com/heroicyang)
+ [Alsotang](https://github.com/alsotang)
+ Hoolai Games