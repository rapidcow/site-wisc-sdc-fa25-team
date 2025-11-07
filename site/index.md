# Welcome to our Team 17's Site!

## Quick Links

**Important** links:

*  GitHub.com: [project repository](https://github.com/SDC-Fall-2025/Team-17-Project.git) (Club Radar)
   -  Project idea page for [Club Radar](ideas/club-radar)
   -  [makeshift contribution/development guide](https://github.com/SDC-Fall-2025/Team-17-Project/blob/master/HACKING)
      (TODO)
   -  [clubradar.endfindme.com](https://clubradar.endfindme.com/): real web site deployment
   -  team.endfindme.com: [Persistent team web site for
      user and API documentations](https://team.endfindme.com/wisc/sdc/fa-25/public/)
      (source at [Codeberg](https://codeberg.org/rapidcow/site-wisc-sdc-fa25-team/src/branch/icmp/htdocs))
*  Discord.com: [Software Devel Club, #team-17 channel](https://discord.com/channels/1197375935033389087/1421600028681572463)
*  Discord.com: [Team 17](https://discord.com/channels/1428212879026552872)
*  Club meetings:
   -  [**Next Meeting: Saturday, November 08, 1-1:30 PM**](meetings/2025-11-08/)
   -  [Meeting Memo](meetings/)
   -  [Meeting Schedule](meeting/schedule)
*  GitHub.com: [Issues](https://github.com/SDC-Fall-2025/Team-17-Project/issues) and
   [Pull Requests](https://github.com/SDC-Fall-2025/Team-17-Project/pulls)
   -  list.rapidcow.org: [SDC Team mailing list archive](https://list.rapidcow.org/inbox/wisc-sdc-fa25-team/)

Obsolete links:

*  ~~[How to use this site](usage/)~~ (None of you have
   edited anything, so this link seems useless.)
*  ~~[Project ideas](ideas/)~~ (Obsolete)
*  ~~[Polls](polls/)~~ (All polls are closed.)

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
is strongly preferred) wrapped at 78 columns.

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
