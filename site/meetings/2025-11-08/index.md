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

Once you are done installing, read [HACKING](github.com/eyzmeng/code-wisc-sdc-fa25-team/blob/master/HACKING#L32)
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

There are no Git requirements otherwise.  Write your commits
in whatever format you like.


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
