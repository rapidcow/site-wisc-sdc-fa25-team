# Self-check your ’puter knowledge!

Some basic stuff that is nice to know in general...

## Part 0: Know your system

Depending on your operating system, the commands you run may be different.
macOS (since OS X, which has been the case for quite some decades) and
Linux are Unix-likes, but Windows NT is a descendent of MS-DOS.  So in
terms of userspace interface, macOS and Linux are most similar.

For the purpose of simplification, I will assume that this team uses either
Windows, macOS, or any major Linux distribution, and that they are somewhat
recent.  If you are using an operating system not listed here, do let me
know so I can look into it (and I apologize for my ignorance in advance).

For Windows in particular, Windows 10 or newer would be nice since it ships
with a built-in OpenSSH client.

## Part 0.1: The Terminal / Console / Command-Line / Shell

*In this section, "Unix" means it applies to both modern macOS and Linux.
Unless explicitly noted, the text applies to Unix.*

The terminal is a device that lets you interact with programs by
  typing stuff into it.  It is one of the oldest computer interfaces,
  but also the most universal of them all.  Physical terminal devices
  (TTY) are rare these days, but typing is nice (you may debate that
  but, for the sake of my narrative, *don't*) so, in order to keep
  the same interface, people invented *pseudo*-terminals (PTY), where
  you get to do all the nice typing even without the mechanical stuff.
  A program that does this is called a *terminal emulator*.

In Windows, something similar happens except I don't get to use all
  these fancy terms; all I know is they do it somewhat differently.
  (Namely, they are still called terminal emulators, but Windows has
  no concept of TTY and PTY (not before [ConPTY][] at least).)

  [ConPTY]: https://devblogs.microsoft.com/commandline/windows-command-line-introducing-the-windows-pseudo-console-conpty/

Terminal (TTY) drivers by default operate in [cooked mode][].
  The analogy of our interest here is that when you type certain
  key combinations, the driver intercepts them instead of just
  passing them as raw control characters --- the "un-cooked"
  characters, so to speak.  (Get it?  Because cooked = not raw,
  ehh??? :D  I wonder who comes up with these terms... anyways.)

  Perhaps the most important control sequence you should know is
  Control-C (which I will denote as **^C** for brevity: that is,
  ^ stands for the control key):  ^C instructs your computer to
  send a [keyboard interrupt][] signal to the program that is
  running (also known in libc as [SIGINT][]).  Unless the
  program chooses to handle the signal, the kernel immediately
  terminates the program.
  
  Another useful control sequence is **^D**, which announces to
  the program (that's it, stop reading my mind!) by setting
  the end-of-file ([EOF][]) condition.  (We usually just call
  this *sending* or *feeding* EOF to a program for short.)

  [cooked mode]: https://stackoverflow.com/a/13104585/19411800
  [keyboard interrupt]: https://en.wikipedia.org/wiki/Keyboard_interrupt
<!-- Found a better link here: https://superuser.com/a/169055/2641288 -->
  [SIGINT]: https://en.wikipedia.org/wiki/Signal_%28IPC%29#SIGINT
  [EOF]: https://en.wikipedia.org/wiki/End-of-file
  
In Windows cmd.exe, you want to use **[&#94;Z][]** instead of ^D to generate EOF.[^2]

[&#94;Z]: https://superuser.com/a/291225/2641288
[^2]: Be careful as ^Z on *Unix* suspends the program by sending SIGTSTP.
    If you unintentionally that control sequence, you should run `fg` to
    resume the program in foreground.
    ([This][INT-TSTP-QUIT] can be a useful reference.)

[INT-TSTP-QUIT]: https://superuser.com/a/169057/2641288

## Part 0.1.1: The Prompt

Common in both Unix and Windows is something called a *prompt*.
You very likely have heard of this: it's the string of text
just before the cursor that *prompts* the user to type something.
The difference is that prompts in terminals don't usually look
like this:

```
Type something..... NOW!!! >>>> _
```

or this:

```
I am patiently waiting for you to enter something.  Please type
them below and feed your terminal a carriage return (^M or Enter),
so that I can receive it on my end and process it.  _
```

but usually something like this:

```
PS C:\Users\blablah> _  # This is PowerShell's prompt!
C:\WINDOWS\system32> _  & REM This is CMD.EXE's prompt
```

(Aside: for this reason, cmd.exe is also known as the **Command <u>Prompt</u>**.)

or

```
[user@a-puter ~]$ _     # this is a normal user's shell
[root@a-puter /]# _     # this is a SUPER user's shell!
```

even worse than that:

```
$ _
# _
```

(Yes, that `$` or `#` *is* a prompt!  Do not be fooled by its reticence!!!)

Prompts being distinct from the output also helps differentiate
the user *input* that I typed into the terminal from the *output*
returned by the program I invoked.  For example:

```
$ fortune | cowsay
 _______________________________________
/ Let's not complicate our relationship \
| by trying to communicate with each    |
\ other.                                /
 ---------------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

means that I typed `fortune | cowsay^M` (^M being the Enter key,
and note that I type **without** the `$` as that is the *prompt*)
into a Unix shell as an unprivileged user (i.e. no **sudo**(1)),
and received an output of this cow saying some delusional things.

Pay special attention to what *type* of prompt I am using: `$`
and `#` are Unix, `PS C:\>` is Windows PowerShell, and `C:\>`
is the Command Prompt (cmd.exe).  Also, take note of the comments:
just like the prompts, they are not meant to be typed literally.
So everything after `#`, `REM`, or `& REM` is to be left out
of your real command.[^8]

[^8]: Maybe you *could* given that they are technically comments,
    in their respective shells, but do not hold me accountable
    if they are syntactically invalid :x

(Also, for the sake of my sanity, please stick to a Bourne shell
like ash, dash, bash, or zsh.  **Do not use** csh or tcsh or fish
(unless you are willing to learn on your own; there is plenty
of resources) because I am too tired to teach people various
*very different shells*.  When I write "BASHISM", *only* use
bash or zsh.  (Note that Git-Bash, MinGW, and WSL would likely
satisfy both of these conditions.))

## Part 0.1.2: Changing Directories

Also common in both Unix and Windows is the concept of a *current
directory*.  (A directory is just a fancy term for a folder.)
This is commonly displayed as a part of the *prompt*, but
you can display it explicitly with the following commands:

```
#### cmd.exe
C:\> cd

#### PowerShell
PS C:\> Get-Location
PS C:\> pwd            # Unix compat

#### Bourne shell (macOS and Linux)
[user@puter ~]$ pwd
```

Sometimes it helps to see the contents of this directory
as if you have a file explorer open in front of you.
For that, list the contents like so:

```
#### cmd.exe
C:\> dir

#### PowerShell
PS C:\> Get-ChildItem
PS C:\> gci            # shorthand
PS C:\> ls             # Unix compat

#### Bourne shell (macOS and Linux)
[user@puter ~]$ ls
```

To list *all* contents:

```
#### cmd.exe
C:\> dir /a

#### PowerShell
PS C:\> Get-ChildItem -Force

#### Bourne shell (macOS and Linux)
[user@puter ~]$ ls -A
```

See
[cd](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/cd) (cmd.exe),
[Get-Location](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.management/get-location?view=powershell-7.5) (PowerShell 7.5),
[Get-ChildItem (gci)](https://stackoverflow.com/a/66269816/19411800),
[pwd](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/pwd.html),
[ls](https://pubs.opengroup.org/onlinepubs/9699919799/utilities/ls.html).

To change directory to a sub-directory named `child`, run one of these.
You can confirm that your directory has changed by any one of the above
commands or by reading the prompt.

```
### cmd.exe
C:\> cd child
C:\child> _

### PowerShell: either one of these:
PS C:\> Set-Location child
PS C:\> cd child
### ... would result in this:
PS C:\child> _

[user@puter ~]$ cd child
[user@puter ~/child]$ _
```

To move up a directory (from child to parent), use the special name "`..`".

```
### cmd.exe
C:\child> cd ..
C:\>

### PowerShell
PS C:\child> Set-Location ..
PS C:\>

### Bourne shell
[user@puter ~/child]$ cd ..
[user@puter ~]$ _
```

To move to an arbitrary file, join the names with the operating system's
path separator.  On Windows, this is the backslash, `"\"`.  On Unix,
this is the forward slash `"/"`.  (With PowerShell, it can be either.)

```
### cmd.exe
C:\> cd child\grandkid
C:\child\grandkid> cd ..\..\sibling
C:\sibling> cd %USERPROFILE%\project\web\src
C:\Users\NAME\project\web\src> _

### PowerShell
PS C:\> Set-Location child\grandkid
PS C:\child\grandkid> Set-Location ..\..\subling
PS C:\sibling> Set-Location ~\project\web\src
PS C:\Users\NAME\project\web\src> _

### Cygwin / MinGW
guy ~ $ cd child/grandkid
guy ~/grandkid $ cd ../../subling
guy ~/sibling $ cd "$(cygpath "$USERPROFILE")/project/web/src"
guy /c/Users/NAME/project/web/src $ _

### Bourne shell
[user@puter ~]$ cd child/grandkid
[user@puter ~/child/grandkid]$ cd ../../sibling
[user@puter ~/sibling]$ cd ~/project/web/src
[user@puter ~/project/web/src]$ _
```

For Windows, This assumes you are in the same volume.  If you are not,
[switch volume first][DOS-switcheroo].

[DOS-switcheroo]: https://superuser.com/a/135217/2641288 "better than i could have explained it"


## Part 0.2: Flavors of Text Files: CRLF, LF, CR

Let's return momentarily to our discussion of terminal devices
and cooked mode.  (I swear this is not a digression!)

*Again, unless specified, I'm talking about Unix.*

Remember how some control sequences are interpreted as
signals sent from the kernel?  In the previous section, we
looked at how ^C sends SIGINT, the keyboard interrupt signal;
and ^D sends EOF.  Notice how none of these sends any real
control character.  For instance, ^D is the [End-of-Transmission][]
character.  And while this is consistent with the semantics
of the control sequence, it does not get actually transmitted:
that is, the receiving end would never read a literal ^D
*character*!

However, a selection of control characters *are* sent literally:
the *line endings*.  But the process is a little bit more involved
than just passing along.  And it all starts with the *canonical*
end-of-line (EOL) sequence[^7] (both in terms of the ASCII
standard and Internet standard[^4]) being comprised of *two*
control characters:

[^7]: This guy has a bajilion names: end-of-line (EOL), line
    terminator / ending / separator / delimiter, newline.  You
    will see me use them interchangeably (although "newline"
    is a specific term, which we will get to when we talk
    about the Unix model of text file representation.)
    I personally prefer to call it either EOL sequence or
    line terminator / ending, since they emphasize the fact that
    all lines should end with one, *including* last line where
    there is no "new line" that comes after, or a line to
    separate / delimit this last line from.  In fact, as of
    late, I have come to the conclusion with CPython members
    that [their new email library API officially solely capable
    of modeling text files as lines of EOL-terminated strings
    *including* the last line][GH-121515].  It is best to
    accept that lines must be EOL-terminated and to treat
    text as lines of strings that *end* with EOL, rather
    than only *delimited* with EOLs between adjacent lines.

[^4]: See [RFC 158][] and [EOLstory.txt][].
[RFC 158]: https://www.rfc-editor.org/rfc/rfc158
[EOLstory.txt]: https://www.rfc-editor.org/old/EOLstory.txt "referenced by: https://stackoverflow.com/a/23235845/19411800"
[GH-121515]: https://github.com/python/cpython/issues/121515#issuecomment-2603100526

<!-- Typographically, the proportional "J" seems too narrow to me -->

* `^M` is **[carriage return][CR]** (CR, U+000D, `"\r"`), which returns
  the cursor to the beginning (hence the name carriage *return*).
  This is the character sent from your input device (keyboard)
  when you hit the Return or Enter key.[^3]  (*Or* you may do
  it by holding Control and pressing M.)
* `^J` is the **[line feed][LF]** (LF, U+000A, `"\n"`), which *feeds*
  a new line into the cursor by moving the virtual roll of
  paper upward (hence the name line *feed*).

Together you get the standard end-of-line sequence:
**CRLF**, or `"\r\n"`.  People were okay with this<!-- except possibly this guy:
https://www.reddit.com/r/programming/comments/1hbvik1/crlf_considered_harmful/ -->,
and we know protocols like FTP, SMTP, HTTP all talk
in the common language of CRLF.  No deviation with that.

The *real* deviation comes from how computers *store* lines
at home when they're not talking to different computers.

* MS-DOS (which evolved into Windows) took the safe way and just
  [followed the standards][DOS-WAY], CRLF.  Rather verbose, but
  definitely safe.

* Multics took just the last control character, LF
  ([because it was shorter to type][newline#history][^6])
  and assigned it a new role called *newline*, meant to represent
  the one true line terminator.  This is implemented in the
  standard C library (libc)'s model of text files, where a
  file pointer **fopen**(3)'d in text mode would have EOLs
  translated into `'\n'` on write, and have `'\n'` translated
  back into the EOL local to the platform; with `'\n'` being both
  the in-memory transient representation and the on-disk persistent
  representation when the program itself resides on a Unix computer.[^5]

  On the terminal, well -- going back to the topic of cooked mode,
  recall that pressing Enter / Return would literally emits a ^M,
  which moves the cursor back to the start of line without moving
  it down to a new line.  So what the drivers do is [translate ^M
  into CRLF][SNEAK-LF] *behind the scenes*, so you can still press
  just enter and it works just as you would expect.[^1]
  (Note that when text goes in the other direction, i.e. from
  a *program* to the terminal, the interpretation is done by
  the terminal emulator where a `"\n"` *always* resets the cursor
  back to the beginning, so that no funny staircase-looking text
  would result.)

* Mac OS (specifically *pre* OS X, when it wasn't Unix-based),
  which emerged later than *both* MS-DOS and Unix (though preceded
  Windows and Linux), decided that it wasn't going to follow CRLF
  as MS-DOS, nor follow LF as Unix, but instead picked CR and went
  with it.  Surely it wasn't a very logical choice given it came
  later (not to mention that CRLF itself is just MS-DOS following
  ASCII and Internet standards, which have existed for a *long*
  time before Mac OS did!)... but they made that choice anyways.

And honestly... [I don't know why][JOBSWAY].  They *did* decide
that it was a silly idea eventually, and with the release of
OS X, they switched their userspace to FreeBSD Unix and
finally left their relic `':'` path separator and `"\r"` line ending,
and joined the `'/'` LF gang like Linux and the rest of Unix.
But [the damage has been done](https://retrocomputing.stackexchange.com/q/21903)...
the world now has CRLF, LF, *and* CR to live with.

[^6]: Perhaps they didn't pick CR because it could stlil be used for
    overprinting text ("[the poor man's \033&#91;G][PM-ESC-G]", as one
    Reddit comment puts it).  Or perhaps they picked it so that [CRLF-delimited text
    would still appear as regular lines][UNIXWAY] (which I just so happened
    to [recently utilitize][ICON-CR]).  Of course this choice to deviate
    is [not without headaches][Bash-fail] (but that's kind of also
    why we're here!)

[^5]: This is inherited by both [Perl `"\n"`](https://perldoc.perl.org/perlport#Newlines)
    and [Python's Universal newline model](https://docs.python.org/3/glossary.html#term-universal-newlines "the term references PEP 278 &ldquo;Universal Newline Support&rdquo; and PEP 3116 &ldquo;Newline I/O&rdquo;").
    Compare this [newline][] model to EBCDIC's next line, [NL][]
    (which actually (I just learned) [got adopted][NEL] into
    the Unicode C1 control characters, by the way!))

[NL]: https://en.wikipedia.org/wiki/EBCDIC#NL
[newline]: https://en.wikipedia.org/wiki/Newline
[newline#history]: https://en.wikipedia.org/wiki/Newline#History
[NEL]: https://en.wikipedia.org/wiki/C0_and_C1_control_codes#NEL

[CR]: https://www.asciihex.com/character/control/13/0x0D/cr-carriage-return
[LF]: https://www.asciihex.com/character/control/10/0x0A/lf-line-feed
[DOS-WAY]: https://devblogs.microsoft.com/oldnewthing/20040318-00/?p=40193 "from https://stackoverflow.com/a/34797622/19411800"
[UNIXWAY]: https://web.archive.org/web/20040531194934/http://www.essenz.com/support/comp.unix.misc/Sep/20/40645.html "from https://stackoverflow.com/a/34797622/19411800"
[JOBSWAY]: https://www.reddit.com/r/ProgrammerHumor/comments/7mbbdl/comment/drtpif4/ "Ironically I found no memo regarding this rash decision either."
[ICON-CR]: https://github.com/eyzmeng/code-wisc-sdc-fa25-team/blob/cafa8f4849cb6ee1763138254ee5f203a30955c5/.gitignore#L102
[Bash-fail]: www.reddit.com/r/programming/comments/1hbvik1/comment/m1jbmjy/ "I suspect the &ldquo;nonsensical errors&rdquo; had to do with heredocs, where (I believe) Bash would be picky about whether you entered a EOF or EOF\r, but&hellip; I&rsquo;m not going to test it now. :P"
<!-- Thank you for still indexing this DuckDuckGo!!! QvQ -->
[End-of-Transmission]: https://www.asciihex.com/character/control/4/0x04/eot-end-of-transmission
[^3]: The key they send [can deviate][ret-vs-etr], but usually both keys send carriage return.
[ret-vs-etr]: https://unix.stackexchange.com/questions/253271/understanding-return-enter-and-stty-icrlf#comment436939_253273

(Huh.  Maybe EBCDIC wasn't so bad after all.  We stayed
true to the typewriters, but at what cost...)

[^1]: For the interested readers, consult the manual page
    of **stty(1)** in your system.  Example: [[linux](https://linux.die.net/man/1/stty)]
    [[macOS](https://leopard-adc.pepas.com/documentation/Darwin/Reference/ManPages/man1/stty.1.html)]

[SNEAK-LF]: https://news.ycombinator.com/item?id=13499577
[PM-ESC-G]: https://www.reddit.com/r/ProgrammerHumor/comments/7mbbdl/comment/drtbxrv/
<!-- [NORETURN]: https://www.reddit.com/r/todayilearned/comments/urf7sn/comment/i8y7kom/ -->

Anyways, for those on Windows: **please set core.autocrlf to true**
as our repository will store everything canonically as Unix
LF-separated files.  Please read [the Git setup tutorial](../install/git-vcs).


## Part 0.9: Resources for the Command-Line

This should get you started with the command-line
(and the good ol' days of computing...)

I would like to end with a few resources I can come up
off the top of my head for learning and practicing how
to use the terminal and all.

*  [Telehack](https://telehack.com/telehack.html)!
   [This](https://fcs-cs.github.io/cs1-2018/modules/06-the%20internet/telehack/)
   should get you started.
*  In-depth dives for the Bash shell (relevant to macOS/Linux Bash (*and* [Z Shell](https://zsh.sourceforge.io/ "zsh"), in many ways!)):
   -  [Bash Guide for Beginners](https://tldp.org/LDP/Bash-Beginners-Guide/html/), TLDP
   -  [Sh - the Bourne Shell](https://www.grymoire.com/Unix/Bourne.html), Bruce Barnett
   -  [GreyCat (Greg)'s Wiki](https://mywiki.wooledge.org/), in particular, BashGuide
   -  [Unix pipeline resources](pages.cs.wisc.edu/~emeng/cs400/piazza/unix/pipe.html) (link collection by *me*!)

["May the command line live forever..."](https://www.youtube.com/playlist?list=PL7nj3G6Jpv2G6Gp6NvN1kUtQuW8QshBWE)
