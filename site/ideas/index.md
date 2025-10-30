# Project ideas

## Status

We are down to the **final three projects** (from the [poll](../polls/2025-10-22/project))!
As of Wednesday 10 PM:

*   [Club radar](club-radar) has received 3 votes;
*   [Minecraft with Computer Vision](minecraft-cv) has received 3 votes;
*   [Task Manager](task-manager) has received 2 votes.

In our next team meeting we will pick among the finalists
and do some work at last!!!

*Note*:  Edit this page if you want, but
new project ideas will not be considered.  (You had plenty
of time to propose one if you really wanted to, sorry.)


## Description

Task Manager

:   ethan> A general-purpose task manager that remembers **deadlines** within
    seconds of precision (so when I say most Canvas homework is due at 23:59:00,
    I mean it is due at the beginning of the 1439th minute of the day,
    not the end of it); understands metadata (such as the URL to the Canvas
    submission page, or the URL to the assignment requirements page);
    understands task dependency (as a graph) and composition (for partial
    completion); task urgency; and interoperable with other FOSS task
    managers (such as TaskWarrior).  Bonus points if Canvas integration and
    can import Canvas tasks directly into the app.  Bonus points if it is
    cross platform (Windows, macOS, X11 Unix, iOS).  Extra bonus points if
    we can release it under a FOSS license.

    For a full pitch, visit [task-manager](task-manager)!

Bookkeeping/Finance

:   deyan> Create a finance app that tracks your expenses and creates graphs based on the data.

    ethan> A double-entry, currency and account agonistic bookkeeping extension/interface
    to any one of the well-known plain text accounting apps (ledger, hledger,
    beancount), that (again) supports metadata: **in particular** the date of
    transaction (down to seconds precision, again; though it should take note
    of significance when the ledgers from banks do not offer such precision),
    date of posting, transaction ID.  And understands budgets.  Bonus point
    if it is general-purposed enough to be re-used for any kind of exchange
    (such as time in exchange of money; or in-game tokens in exchange of other
    in-game resources).  Bonus point if (as Deyan proposes above) it can
    draw pretty graphs.  Extra bonus points again if it is FOSS too.

    Details in [graphical-ledger](graphical-ledger).

From the [October 16 meeting](../meetings/2025-10-16/#project-brainstorm) we've seen some good ideas too 6ᴗ6

Climate Analyzer

:   Use data science and machine learning libraries to analyze US climate.
    See [climate-analyzer](climate-analyzer).

Minecraft Computer Vision

:   Using computer vision to control Minecraft.  See [minecraft-cv](minecraft-cv).

Club Discover

:   Dubbed "Club Radar" tentatively.  *Most people favored this at the
    club meeting.*  See [club-radar](club-radar).

## Ethan's projects (help is appreciated :)

E-mail on the phone

:   Plain text MUA Aerc/Mutt... but on the phone.  Bonus point if with
    [OpenKeychain](https://www.openkeychain.org/) integration.  (A good
    reference implementation would be Thunderbird on Android.  There isn't
    such an app on iOS last I checked!)

Synctree

:   A repository manager, capable of understanding most popular VCS repositories
    (such as Git, SVN, Mercury), and backing them up with arbitrary fidelity and
    selectivity.  For Git in particular, it should understand branches, tags,
    commit notes (`refs/notes/commits`); symbolic refs like HEAD and remote HEADs;
    namespace refs, and more.  It should have different models for valid updates
    fit for automatic synchronization, namely fast-forwarding a branch, and
    respecting the immutability of a tag.  It should understand how to update
    refs of a "remote" Git repository given a "local" Git repository, be it a
    bare repository (easy) or a non-bare repository (hard), or on-the-network
    over a certain Git remote protocol (easy?  But think about network failures
    and trust models.  Might as well be hard in its own way.)  Bonus point if
    it can also manage large files between Git-annex remotes.
    (Why the heck would any of this appealing?  Well, imagine a Google Drive,
    but without Google... distributed, auditable, and free....)

    The project will be called **synctree**, which is created in tandem with
    my **hashtree** script/format for representing a checksum on an entire
    directory.  More details on that in my [Perl 5 library homepage](https://www.rapidcow.org/lib/perl5/).
    Something *very* similar to this can be found in an Asciinema cast
    I did demonstrating how I manage the monstrously large repository
    I had for CS400, with each branch containing an entirely separate
    worktree for each assignment: [[part 1]](https://asciinema.org/a/717309) [[part 2]](https://asciinema.org/a/717308)
