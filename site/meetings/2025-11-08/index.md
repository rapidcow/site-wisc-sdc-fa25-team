# Meeting of Saturday, November 8

In this meeting I answered some FAQs.  YMMV, but by "frequently",
I meant asked by the sole person who attended the meeting (and
actually discussed anything related to the project after
[the meeting](../2025-10-16/) before this) which is frequent
enough by my standards since I usually receive zero from the team.

## FAQ: Software Stack

I was told that people might appreciate knowing the *exact*
framework we will be using.  Since you all apparently hate
make choices and form opinions, I have rashly decided for
all of you that we will be using:

* Frontend: [SvelteKit](https://svelte.dev/docs/kit)
* Backend: Python runtime
    - [Flask](https://flask.palletsprojects.com/) for WSGI
    - [SQLAlchemy](https://docs.sqlalchemy.org/) for SQL database connectivity

(Re-posted from [this message](https://discord.com/channels/1428212879026552872/1428214247938064384/1436802400911360111) in the #important-info channel)

To install, you *must* use the following:

* [Node.js](https://nodejs.org/en/download/current) 22  (check with `node --version`)
    - [pnpm](https://pnpm.io/installation) 10  (check with `pnpm --version`)
* [Python](https://www.python.org/downloads/) 3.12 or newer  (check with `<py> --version` where `<py>` may be `python`, `python3`, `py3` depending on where your system installs it)
    - [Poetry](https://python-poetry.org/docs/) 2  (check with `poetry --version`)

For collaboration you also need to install Git.
See the [installation guide](../../guide/install/git-vcs)
and [the following section](#faq-git-expectations).

Note that you *can* technically use Node.js 20.
If you use Node.js 23, it would be too new to contain
corepack, and you should [install it separately](https://github.com/nodejs/corepack?tab=readme-ov-file#how-to-install).

If you have a package manager, you should try letting
the package manager install pnpm.  You should *not*
have to `sudo npm install -g <anything>`, but feel
free to resort to it if you must.

Once you are done installing, read [HACKING](github.com/SDC-Fall-2025/Team-17-Club-Radar/blob/master/HACKING#L32)
from here.  Running the backend and frontend can be
boiled down to running the following commands:

```shell
cd web
pnpm install   # ONCE
pnpm run dev

cd api
poetry install # ONCE
poetry run python -m app
```

If you don't know what the heck commands are or where you
should type them into, familiarize yourself with the command-line
introduction I wrote in the
[everything-you-should-know checklist](../../guide/gentle/check#part-01-the-terminal--console--command-line--shell)
(starting from Part 0.1).

Visual Studio Code users: open the terminal with <kbd>Control-`</kbd>
(that is Control followed by a backtick ([on a US/UK keyboard](https://en.wikipedia.org/wiki/Backtick)
that would be the key to the left of the number <kbd>1</kbd>); <!-- ` -->
on a macOS computer, use Command instead of Control.)  See [Terminal Basics](https://code.visualstudio.com/docs/terminal/basics)
for VS Code's own guide to it.

If you want to make your terminal pretty, look into:

*  [Oh my Bash](https://ohmybash.nntoan.com/)  <!-- XXX: Is this supposed to redirect from ohmybash.github.io ? -->
   -  If you like something more primitive: [git-prompt.sh](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
*  [Oh my Zsh](https://ohmyz.sh/)
   -  Apparently very popular with the [Powerlevel10k](https://github.com/romkatv/powerlevel10k) plugin.


## FAQ: Git expectations

Set **core.autocrlf** to true *unless* you are not on Windows.
(I forgot to say this in the meeting, but this point still holds valid.)
I have written in the [installation guide](../../guide/install/git-vcs)
for how you should set that, and check if it is properly set.

Regarding commits, my expectations are not *that* strict.
But I still have some standards.

Commits should follow this format:

```
Short (50-70 columns long) summary

Optional longer description wrapped to 70-76 columns.  For
example, that was wrapped just before 60 columns.  And this is wrapped
at 70 columns.  (You will notice that I say columns because East Asian
characters such as Chinese are wide characters that take up 2 columns.
So the character count would not translate exactly to column width.)
```

(It's just not a recommendation from me,  by the way:
your commit would get squashed on one giant line by
**git-log**(1) if you do not separate your commit summary
with a blank line, and they would get truncated in GitHub
if they exceed the 70-character mark.)

Unlike Tim Pope's popular [Note about Git Commit Messages](https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html),
I do not reinforce capitalization is important (I myself don't
follow it :)  However, do use imperative voice (add, fix, edit,
remove, rollback) in your commit summary.  Tenses are weird when
you think of commits as actions describing a means of change
from a past version to the present version: you don't say "fixed"
the bug because the bug *was*, in fact, not fixed until you
commit the fix.  (And for goodness sake, don't even think about
third-person, this isn't Javadoc.... =n=)

Commit subjects in general do not need to follow any format (and even
less so the commit description).  But for commits that modify a
*specific* frontend page/layout or a backend API, please start the
commit message with the name of the route followed by the real
summary.  A few examples are the commits:

*   [route / layout: inject footer](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/commit/ac4d50cff4c02a976dd05c476fbd83a727318bce)
*   [route / page: change to something more meaningful](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/commit/a3dfcac9b8a90ebf0e394864c8e8edc8485e62ee)
*   [/api/v1/greet: add ok param](https://github.com/SDC-Fall-2025/Team-17-Club-Radar/commit/fcdb38f3a99af92defc123c4494f30641aeb604e)

In the case of API endpoints, the URI path itself is
self-documenting, and thus do not require the prefix "route".
And note that, despite the very informal tone, I consistently
used a verb with imperative voice.

Just like [the Git project](https://git-scm.com/docs/SubmittingPatches#separate-commits),
I expect commits to be atomic.  Your Git commits are *not* your
Google Docs revision history!  Do not commit as you work on
things by the hour (but do commit when you find yourself needing
to use two verbs to describe your changes, like "add this and
fix that"... that's a good sign that you should be breaking up
your changes!)  Learn to stage files partially using `git add -p`
or `git commit -ap`.  Commit test files before your bug fix even
if you wrote test and fixed bugs simultaneously.  Your commit
history should not have to stay true to your real workflow in
chronological order: what matters more is that commits make
*logical* sense.


## FAQ: Game plan

It has been debated whether it is possible to obtain data from
<https://win.wisc.edu/>.  Upon a preliminary inspection of the
website, it appears that trying to contact the adminstrator for
internal API access is futile.  Seeing the stagnation of this
project over the past month, and less than a month before it is
due for presentation, it has therefore been decided that we will
be primarily focusing on a *static view* rendered from a
read-only, hard-coded SQLite database of clubs.

We would still be connecting to the database *as if* it were
backed by an arbitrary database backend (engine, as they
are called) using SQLAlchemy, just because I think it is helpful
to learn a backend-agonistic way of connecting to a database.

(You do not want to learn how, in the company I interned at this
summer, we had to *generate* different JDBC boilerplate code just
for connecting to MySQL and Oracle... it's a nightmare if you
have to re-learn almost the same thing, but not *quite* the same
thing, from SQLite to MySQL then PostgreSQL... anyway, we should
be grateful to have SQLAlchemy. :)

**For this reason I also recommend that we publish our project
under a permissive license such as MIT**, just so that it is
possible for someone else to pick it up and turn it into the
real thing we couldn't make due to limited time and energy.
We could discuss this later though.
