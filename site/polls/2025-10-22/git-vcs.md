# Poll Survey: Git VCS

[[Today's Polls](.)] [[All polls](..)]

| **Opened**  | N/A      |
| **Ended**   | N/A      |
| **URL**     |          |

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
    and `git log --left-right --graph A...B`.  Or find yourself
    a [Git prompt](https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh)
    that can display the numbers for you (but you still need
    `git log` to figure out *who* those commits are!)

I understand that including "@" followed by a name in my Git commit message will ping the user in GitHub with that name, no matter how hard I try to scream at GitHub not to do that.
:   In particular, try not to describe Javadoc tags literally
    in your commits.  I'm not saying you *couldn't*... but just so
    you don't accidentally embarrass yourself
    [like I did](https://github.com/eyzmeng/TAP-for-Java/commit/4fcafe735d3b684e0b5e268d152c1c875b713154).
