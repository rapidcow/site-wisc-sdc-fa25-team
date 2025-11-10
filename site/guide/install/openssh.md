# Shell + encryption setup

We will set up the terminal emulator and generate SSH keys in this document.

## Terminal Emulator

On Windows, if you don't already have anything better than `cmd.exe`,
download Windows Terminal through [here](https://apps.microsoft.com/detail/9n0dx20hk701?hl=en-US&gl=US),
or open up your Command Prompt / PowerShell and [run](https://winget.run/pkg/Microsoft/WindowsTerminal):

```cmd
winget install -e --id Microsoft.WindowsTerminal
```

On macOS Terminal.app is good enough but you can
download [iTerm2](https://iterm2.com/).

On Linux, use whatever terminal that comes with your
distribution.  If it doesn't come with one, [Xterm](https://wiki.archlinux.org/title/Xterm)
is nice (but that is assuming you are using X11).


**NOTE:** The following section is obsolete now that we have
decided to develop a primitive program which interacts with
static data only.  You do not need a pair of SSH keys.


## OpenSSH Client

If you are on macOS, you already have this.  If you are on Linux,
you either already have this or know how to install it with your
package manager.  If you are on Windows 10 or newer, you also
have this.  In any case, you should have it pre-installed.
If you don't, you should let me know.

Have your terminal emulator open because I will have you run
some commands.


### Generate SSH keys

*Ignore me if you already have an RSA ssh key.*  (RSA is necessary
since it is the only key algorithm that is capable of encryption.)

Run:

```
ssh-keygen
ssh-keygen -t rsa
ssh-keygen -C 'name@computer' -t rsa
```

(Usually RSA is the default so you can leave `-t` out.)
It should prompt you for a few things:

```
Generating public/private rsa key pair.
Enter file in which to save the key (.../.ssh/id_rsa): 
```

The default file location is fine.  If you put it elsewhere,
ssh might not be able to find it, so this is recommended.
Press enter without typing anything in.

```
Enter passphrase for ".../.ssh/id_rsa" (empty for no passphrase): 
Enter same passphrase again: 
```

<!--
You may or may not use a passphrase.  Note that the passphrase is only used
to unlock the private key on your computer.  Depending on your threat model
[there is probably no need](https://security.stackexchange.com/a/257543)
(though a good practice is to keep your SSH keys local to each machine.)
-->

Do not use a passphrase for our purpose.
[There is no need](https://security.stackexchange.com/a/257543) as for our
purposes we will never be sending the secret key outside.

```
Your identification has been saved in .../.ssh/id_rsa
Your public key has been saved in .../.ssh/id_rsa.pub
The key fingerprint is:
SHA256:nQqvCqGQGapDU9fUDBOHKhXJQT5OejBWf4x7V+NB7uI git@rapidcow.org
The key's randomart image is:
+---[RSA 3072]----+
|    o=+=*.   .   |
|    o++.=o  o    |
|.  =.=.+ o   =   |
|.+o.B.. o. .+ o  |
|=o...o..S.oo o   |
|+....  o..o .    |
|+ .     o  E     |
| . .   .         |
|    ...          |
+----[SHA256]-----+
```


### Publish your public key

*Ignore me if https://github.com/<your username>.keys already
lists a public key to which you have the private key.*

Open the `~/.ssh/id_rsa.pub` file (**NOTE**: with the suffix.
The file *without* your suffix is your private key.  *Never*
upload your private key!)

*  On Windows, open the File Explorer (explorer.exe), click on the
   address bar, then type `%USERPROFILE%\.ssh`.  (For MinGW users,
   go to your base directory (for MSYS2 it is `C:\msys64`), then navigate
   into `home\<LOGIN>`.)  You should see a file named `id_rsa.pub`.
   Open it with a text editor and copy out the first and only line.
*  On macOS, open Finder (Finder.app), press Cmd+Shift+G to bring up
   the "Go To..." menu, then type `~/.ssh`.  You should see a file
   named `id_rsa.pub`.  *Or* (in your terminal) run `open ~/.ssh`.
*  On Linux run `xdg-open ~/.ssh`.

(Note that you may copy the key without the remark (the string
that you set using `ssh-keygen -C`, which by default is just your
user login "@" host name).  That is, just the key algorithm and
the public key like this:

```
ssh-rsa AAAAB3NzaC1yc2EAAAA... [very long key, 3072-bits to be exact]
```

is sufficient.  (And GitHub would ask you to give it a different
name anyways, which makes the remark even more unnecessary.))

Now copy the contents of your key to <https://github.com/settings/keys>,
click "New SSH key", then paste your public key inside "Key".
Leave the "Key type" as-is (that is, you want to add this key as
your Authentication Key), and give whatever name you like in the
"Title".  For your personal preference, you may copy out the third
part of your key.  For instance, my `~/.ssh/id_rsa.pub` is:

```
ssh-rsa AAAAB3NzaC1yc2EAAAA... git@rapidcow.org
```

So I could put in the "Title": `git@rapidcow.org`.  That will help
me identify and possibly revoke the key in the future.

Test that your key works by connecting to `github.com` as the
special user `git`.  [These are GitHub's fingerprints](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/githubs-ssh-key-fingerprints), so if they match what you see on screen, you are probably
good.  A good thing to do is copy the fingerprint from the link
above for the key algorithm of choice (in our case, "Ed25519"),
and paste it when it prompts for you to continue:

```
$ ssh -T git@github.com
The authenticity of host 'github.com (140.82.113.4)' can't be established.
ED25519 key fingerprint is: SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU
Are you sure you want to continue connecting (yes/no/[fingerprint])? 
```

Now I copied `SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU`, so
I will paste that.  OpenSSH would then do the string comparison for me,
and continue if it sees that they are equal.

```
Warning: Permanently added 'github.com' (ED25519) to the list of known hosts.
Hi eyzmeng! You've successfully authenticated, but GitHub does not provide shell access.
```

Now the fingerprint will be appended to a file named `known_hosts` in
the *same* directory (folder) as your public/private key pair, which
is usually not something you need to worry about unless GitHub rotates
their key (which has not been the case, I believe...)

Once you have done all these steps send your SSH public key to me.


## OpenSSL

RSA is the algorithm for asymmetric signature and encryption.  OpenSSH
uses it for the signature part (at least they don't use it for encryption
[now that they deprecated SSH protocol v1](https://www.openssh.org/txt/release-7.6)
and moved to [SSH protocol v2](https://security.stackexchange.com/a/76907)),
while OpenSSL can use it for the encryption part.  For this you need to
install openssl.

  * macOS and Linux: you most certainly have an openssl command.
  * Windows: Git-Bash comes bundled with [openssl](https://stackoverflow.com/a/51757939/19411800)
    and you may use that if you want to.  Otherwise, you may want
    to read [NOTES-WINDOWS][] from OpenSSL to figure something out.

[NOTES-WINDOWS]: https://github.com/openssl/openssl/blob/master/NOTES-WINDOWS.md "https://www.reddit.com/r/openssl/comments/13rbf3g/how_do_i_install_openssl_on_windows/"


### Decrypt with your RSA key

First, convert your to the OpenSSL PEM format. You only have to
do it once.

Navigate into your SSH directory where (`~/.ssh` or `%USERPROFILE%\.ssh` or
`C:\msys2\home\<user>\.ssh` as described in the previous section
"[Publish your SSH key](#public-your-ssh-key)").  Copy your private key
`id_rsa` into `id_rsa.pem`.  Then open your terminal (emulator) and
run this:

```
$ ssh-keygen -p -f id_rsa.pem -m pem
Enter new passphrase (empty for no passphrase): 
Enter same passphrase again: 
Your identification has been saved with the new passphrase.
```

When prompted for a passphrase (as shown above), **do not type anything**.
Just press Enter until you see your shell prompt again.

```
# Windows CMD.exe / PowerShell
C:\> openssl pkeyutl -decrypt -inkey id_rsa.pem -in %USERPROFILE\path\to\env.local.enc -out %USEPROFILE\path\to\env.local

# Cygwin / MacOS / Linux
$ openssl pkeyutl -decrypt -inkey id_rsa.pem -in ~/path/to/env.local.enc -out ~/path/to/env.local
```

Replace `%USERPROFILE%\path\to\env.local.enc` and `~/path/to/env.local.enc` with
the actual paths.

See also: [Encrypt and decrypt a file using SSH keys](https://bjornjohansen.com/encrypt-file-using-ssh-key/)
by Bjørn Johansen.
(Note that `openssl rsautl` has since been renamed to `openssl pkeyutl`.)
