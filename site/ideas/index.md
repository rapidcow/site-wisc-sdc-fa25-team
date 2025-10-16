# Project ideas

Create a finance app that tracks your expenses and creates graphs based on the data.

:)

## ethan's ideas!

(所谓的拉队友下水 projects :)


* A general-purpose task manager that remembers deadlines within seconds
  of precision (so when I say most Canvas homework is due at 23:59:00,
  I mean it is due at the beginning of the 1439th minute of the day,
  not the end of it); understands metadata (such as the URL to the Canvas
  submission page, or the URL to the assignment requirements page);
  understands task dependency; and interoperable with other FOSS task
  managers (such as TaskWarrior).  Bonus points if Canvas integration and
  can import Canvas tasks directly into the app.  Bonus points if it is
  cross platform (Windows, macOS, X11 Unix, iOS).  Extra bonus points if
  we can release it under a FOSS license.
* A double-entry, currency and account agonistic bookkeeping extension/interface
  to any one of the well-known plain text accounting apps (ledger, hledger,
  beancount), that (again) supports metadata: **in particular** the date of
  transaction (down to seconds precision, again; though it should take note
  of significance when the ledgers from banks do not offer such precision),
  date of posting, transaction ID.  And understands budgets.  Bonus point
  if it is general-purposed enough to be re-used for any kind of exchange
  (such as time in exchange of money; or in-game tokens in exchange of other
  in-game resources).  Bonus point if (as Bridget proposes above) it can
  draw pretty graphs.  Extra bonus points again if it is FOSS too.

The following are very selfish ambitions you might want to look away from.

* Plain text MUA Aerc/Mutt... but on the phone.  Bonus point if with
  [OpenKeychain](https://www.openkeychain.org/) integration.  (A good
  reference implementation would be Thunderbird on Android.)
* A repository manager, capable of understanding most popular VCS repositories
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
