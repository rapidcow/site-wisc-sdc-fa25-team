# Welcome to the Team 17/11 Information Site!

Quick setup:

```
git clone https://github.com/SDC-Fall-2025/Team-17-Club-Radar.git
```

For the *one* of you who uses SSH key: <!-- Yes Bridget, I am talking to you -->

```
git clone git@github.com:SDC-Fall-2025/Team-17-Club-Radar.git
```

**READ READ READ** before you start!!!

*  Windows users, set `core.autocrlf` to true!  See [Git install guide notes](guide/install/git-vcs).
*  For setting up the project, read [HACKING](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/blob/master/HACKING#L32).

(All versions I pinned are *important*!  I have tried with older
versions and they either forbid you to install or fail in strange ways!
<!-- In particular, Poetry 2.x is a completely different beast from Poetry 1.x. -->
Double check if you have the up-to-date versions for everything we use
(triple check if you must)!!!

Our **one and only** GitHub project repository is [SDC-Fall-2025](https://github.com/SDC-Fall-2025/Team-17-Club-Radar).
Participation in *any* other repository is **optional, OPTIONAL, OPTIONAL!!!**
(If you are confused by the repositories I have shared in the past,
read my [infrastructure notes](guide/hacker/infra.txt).)

Meeting notes:

*  [October 16, Morgridge Hall 2525](meetings/2025-10-16/)
*  [November 8, On-Line](meetings/2025-11-08/)

Site map of obsolete links:

*  [Meeting schedule](meeting/schedule)  (One person showed
   up and only one person bothered to explain why they didn't
   show up; and everyone else did not even fill out the
   When2meet.  Does anyone even read any group message?!?
   This page is dead to you and me anyways.)
*  [Usage](usage/)  (It was my hope that people could edit this page
   as a wiki, but I seem to be wrong about this.)
*  [Project ideas](ideas/)  (Project decision has been made.
   The rationale is summarized in Pull#1.  The message can
   be found in any one of the following locations:
   [[github]](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/pull/1)
   [[mailing list](https://list.rapidcow.org/inbox/wisc-sdc-fa25-team/1762451972.pull.1.v1+a3dfcac@x.rapidcow.org/)]
   [[commit]](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/commit/cfb765f56e4408a9accbea295c55cc0fd52df565)).
*  [Polls](polls/)  (No polls are active.)

The (unofficial) announcements for the team will be posted to the mailing list.
Announcements have email subjects with the prefix `[PSA]` or `Re: [PSA]`.

 * List archive over HTTP: <https://list.rapidcow.org/inbox/wisc-sdc-fa25-team/>
 * List archive database: <https://github.com/rapidcow/list-wisc-sdc-fa25-team>
 * Post to the list: <mailto:wisc-sdc-fa25-team@list.rapidcow.org>
 * Subscribe to list: <mailto:wisc-sdc-fa25-team+subscribe@list.rapidcow.org>
 * Un-subscribe to list: <mailto:wisc-sdc-fa25-team+unsubscribe@list.rapidcow.org>

**Note about posting**: For those of you who voted "I know how to send
plain text emails" in the [Collab survey](polls/2025-10-22/hacking),
please send your email with `Content-Type: text/plain; charset="UTF-8"`
(other encodings are fine, but [UTF-8](https://datatracker.ietf.org/doc/html/rfc3629)
is strongly preferred) wrapped at 78 columns.  Some more guidelines
and recommendations are in [guide/hacker/mx101](guide/hacker/mx101).

If you send HTML email, your message *will* be reduced to plain text
for archival.  If you fail to wrap your lines, your message *will*
be wrapped using [`fold(1)`](https://man.openbsd.org/fold.1).  Please
understand if your message has been processed for archival for any of
the above reasons.  (Of course, participation in the mailing list is
optional, and sensitive information is to be redacted as well.)

For reference, here is a full list of MIME types rejected by public-inbox:

```perl
# Copyright (C) 2016-2021 all contributors <meta@public-inbox.org>
# License: AGPL-3.0+ <https://www.gnu.org/licenses/agpl-3.0.txt>
#
# base class for creating per-list or per-project filters
package PublicInbox::Filter::Base;

sub No ($) { "*** We only accept plain-text mail, No $_[0] ***" }

our %DEFAULTS = (
  reject_suffix => [ qw(exe bat cmd com pif scr vbs cpl zip swf swfl) ],
  reject_type => [ 'text/html:'.No('HTML'), 'text/xhtml:'.No('HTML'),
    'application/vnd.*:'.No('vendor-specific formats'),
    'image/*:'.No('images'), 'video/*:'.No('video'),
    'audio/*:'.No('audio') ],
);
```

The mailing list will be important because patches and code
review are expected to go on there as well.
