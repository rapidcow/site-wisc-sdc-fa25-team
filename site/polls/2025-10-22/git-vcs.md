# Poll Survey: Git VCS

[[Today's Polls](.)] [[All polls](..)]

| **Opened**  | Thu, 23 Oct 2025 03:46 -0500    |
| **Ended**   | N/A      |
| **URL**     | <https://discord.com/channels/1428212879026552872/1430837025061474314/1430839905780498432> |

## Provisional Results

As of Wednesday 10PM we've observed the following votes:

```
#  NAME
2  (A) I know how to clone/fetch/pull the project repository.
2  (B) I know how to push to the project repository.
1  (C) I know how to keep an existing clone up-to-date.
1  (D) I know how to interpret metachars in manpage SYNOPSIS.
0  (E) I know what a SHA / object ID (oid) / hash is.
0  (F) I know how to obtain a permanent GitHub commit link.
1  (G) I know how to inspect 2 branches' symmetric difference.
```

I have no idea what to conclude from this.  (I thought the club
had you guys watch GitHub tutorials or something like that?)
Anyways, we will go over basic Git operations in the next meeting.


## Choices

This is a survey of everyone's familiarity with the Git
version control system.  Choices are not exclusive.
Note that you do not have to use Git to participate if you know
how to create and send unified diff patches to the mailing list.

I apologize if you come from SVN or Mercurial.  If it helps,
I am here if you need any help with Git.

*Partially based on [my mailing list questions for Team 11](https://list.rapidcow.org/inbox/wisc-sdc-fa25-team/1759626667.1796322.df64AEa1052d0@e.rapidcow.org/)*.
You are *not* expected to know most of these
(except for the first three, and also the sixth
I guess, depending on our workflow).

I know how to clone/fetch/pull the project repository.
:   You can clone `https://github.com/SDC-Fall-2025/Team-17-Project.git`
    **or** `git@github.com:SDC-Fall-2025/Team-17-Project.git`
    with Public Key Authentication.  For the latter, I know how to
    [add my SSH public key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)
    to my GitHub account, and I know how to test that it works using
    `ssh -T git@github.com` (the `-T` flag disables pseudo-terminal
    allocation, which we typically set in anticipation of Gitwebs
    that do not grant Git shell access.)

I know how to push to the project repository.
:   You can push to `https://github.com/SDC-Fall-2025/Team-17-Project.git`
    with Basic Authentication **or** `git@github.com:SDC-Fall-2025/Team-17-Project.git`
    with Public Key Authentication.  For the former, I know how to
    [create a Personal Access Token](https://github.com/settings/tokens)
    and use it as the HTTP password.  For the latter, see above.

I know how to keep an existing clone up-to-date.
:   *Tip*: Use `git push -u REMOTE [branch]` or `git branch -u REMOTE [branch]`.

I know how to interpret boldface words and meta-characters in the
SYNOPSIS section of a manpage.
:   See [man-pages(7)](https://manpages.debian.org/trixie/manpages/man-pages.7.en.html#SYNOPSIS~2)
    and [Utility Argument Syntax](https://pubs.opengroup.org/onlinepubs/9799919799/basedefs/V1_chap12.html)
    (and possibly [EBNF](https://en.wikipedia.org/wiki/Extended_Backus%E2%80%93Naur_form)).
    This is optional if you won't be using Git on the
    command-line any time in the near future.

I know what a SHA / object ID (oid) / hash is.
:   See [object identifier (oid)](https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-objectidentifieroid).
    *FYI*: Git is a content-addressable key-value store, with
    key being the cryptographic hash of `<type> SP <size> NUL <payload>`
    (where `SP` is space `0x20` and `NUL` is the null byte `0x00`)
    written in hex, and value being the payload stored somewhere in
    the `$GITDIR/objects` directory (known as the [object database](https://git-scm.com/docs/gitglossary#def_object_database)).
    The cryptographic hash function employed by Git comes from the Secure
    Hash Algorithms (SHA) family, published by the National Institute of
    Standards and Technology (NIST), hence the colloquial alias of
    an object ID: a *SHA*.  The object database is equipped with the
    read operation `git cat-file -t <type> KEY > VALUE` and write
    operation `git hash-object -t <type> -w VALUE > KEY`.  The traditional
    SHA algorithm is SHA-1 (which is the one we are using we well
    (out of choice too, since GitHub doesn't really support SHA-256
    *yet*...)), although modern Git repositories are adapting SHA-256
    from the SHA-2 family.

I know how to obtain a permanent GitHub link to a commit, tree, or blob.
:   Either a tag or a SHA will do.  Note that branches are *not*
    immutable by nature, and you should not link to a branch in
    a code review.

I know how to inspect the symmetric difference of two diverging branches.
:   `git rev-list --left-right --count A...B` for a number
    and `git log --left-right --graph A...B`.  (The triple-dot
    notation is the symmetric difference; see [gitrevisions(7)](https://git-scm.com/docs/gitrevisions#Documentation/gitrevisions.txt-Thethree-dotSymmetricDifferenceNotation).)
    Or find yourself a [Git prompt][git-prompt.sh]
    that can display the numbers for you (but you still need
    `git log` to figure out *who* those commits are!)

    There is a [clarification posted below](#clarification-symmetric-difference).

I understand that including "@" followed by a name in my Git commit message will ping the user in GitHub with that name, no matter how hard I try to scream at GitHub not to do that.
:   In particular, try not to describe Javadoc tags literally
    in your commits.  I'm not saying you *couldn't*... but just so
    you don't accidentally embarrass yourself
    [like I did](https://github.com/eyzmeng/TAP-for-Java/commit/4fcafe735d3b684e0b5e268d152c1c875b713154).


## Clarification: Symmetric Difference

Regarding "symmetric difference"... it may be the first time you have
heard of it being called this way.  But basically, it's a measure of how
different the histories of any two given branches are.  The conventional
order used by Git itself is to start with the commits **you** have but
they don't, followed by the commits **they** have but you don't.  If both
differences are zero, then you and they have the exact same commits.
Else if the number of either of these differences is zero, it means you
can push (you give them your new commits they don't have) or pull (they
give you new commits you don't have), in a process called [fast-forwarding](https://git-scm.com/docs/gitglossary#Documentation/gitglossary.txt-fast-forward)
where neither of you lose any commits.

If the number of these differences is nonzero, then each of you have
something the other doesn't, and we have a problem: the naive push/pull
would be impossible.  The branches starting at these two commits are
therefore said to *diverge*.  **If you understand what it means for
branches to diverge when the counts of the symmetric difference are
both nonzero**, you can check that option.

I say it helps to have a Git prompt such as
[git-prompt.sh][] or [gitstatus from Powerlevel10k](https://github.com/romkatv/gitstatus)
because they usually display the count on each side of the
symmetric difference.  Git shows something similar to these
prompts when you and your upstream diverges, though only when
you run some specific commands (such as **git-checkout**(1)
or **git-switch**(1)).  Here is a hypothetical scenario that
I sent to the group due to [this Reddit post](https://old.reddit.com/r/git/comments/8ixdg2/how_to_clean_up_your_branch_diverged_message/):

```
xtian@spaceghost> git checkout dev                        
Switched to branch 'dev'
Your branch and 'MyParser/dev' have diverged,
and have 3 and 1 different commits each, respectively.
  (use "git pull" to merge the remote branch into yours)
```

Using `__git_ps1` from git-prompt.sh, you would get the
same numbers:

```
(main|u+3-1)$
```

In this hypothetical scenario, you could check the 3
commits **you** (`dev`) have but they don't and the 1
commit **they** (`MyParser/dev`) have but you don't have
by running:

```
git log --left-right dev...MyParser/dev
```

which would annotate your commits with `<` and annotate
their commits with `>`, like so:

```
< my commit #3
< my commit #2
< my commit #1
> their commit #1
```

[git-prompt.sh]: https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
