# Team 17/11 Information Site

**This project is closed.**

Everything will be archived at [SDC-Fall-2025/Team-17.git](https://github.com/SDC-Fall-2025/Team-17-Club-Radar).
Other than [the repository](https://github.com/rapidcow/site-wisc-sdc-fa25-team)
this GitHub pages is deployed from and [the public-inbox
repository](https://github.com/rapidcow/list-wisc-sdc-fa25-team),
all repositories will be removed.

Review my infrastructure notes at [guide/hacker/infra.txt](guide/hacker/infra.txt)
if you want to make use of the archive.  If you are a *real*
hacker, you can read the version that I will actually update
in the blob at the refspec `refs/info/view:info/hier`:
read it with **git-show**(1) or **git-cat-file**(1) or whatever.

This is impossible to view on GitHub with a URL that changes
automatically as the ref gets updated but if you want to a
link to view it on the web anyways, run:

```sh
echo https://github.com/SDC-Fall-2025/Team-17/blob/$(git ls-remote https://github.com/SDC-Fall-2025/Team-17.git | awk -F'\t' '$2 == "refs/info/view" {print $1}')/info/hier
```

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
   [[commit]](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/commit/cfb765f56e4408a9accbea295c55cc0fd52df565)).
*  [Polls](polls/)  (No polls are active.)

The (unofficial) announcements for the team will be posted to the mailing list.
Announcements have email subjects with the prefix `[PSA]` or `Re: [PSA]`.
No one will have write access to the list, and you are discouraged to
access my web site for that.

 * List archive database: <https://github.com/rapidcow/list-wisc-sdc-fa25-team>

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
