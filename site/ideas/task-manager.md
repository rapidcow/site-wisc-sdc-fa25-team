# Idea: Task Manager

this is ethan's idea --- one of the [ideas](.)!

## Pitch

[Copied from [meeting notes](../meetings/2025-10-16/#task-manager)]

So we're college students, and the amount of homework is
unlike anything most of us have had before.  And although you can see
most of your assignments & activities due for each day on Canvas (you can
even tell Canvas to import those into Google Calendar which is something I
always forget you can do \*facepalm\*), there is --- and I believe ---
still value in taking responsibilities into our own hands: especially when
we have a personal project where there is no roadmap and no partial
project deadlines and check-ups laid out for us.  And well, we could use
Obsidian and Notion, Microsoft Tasks, Google Tasks... or use [TaskWarrior][]
[like](like) me!  We would be re-inventing an existing solution, but that's fine
--- it would be just as valuable as an experience, and maybe we can add
a creative twist to it....

## Specifications

*   A task *description*.  Something actionable and specific, like
    "Write a blog post about XXX" or "Inspect server logs since DATE".
    There should be a way to write a short description (for overview)
    and a long description (for the details, such as project
    **requirements**/specifications, grading rubrics.  (In the case of
    Canvas it is helpful to include a URL to the page for the assignment.))
*   A task **deadline**.  For homework, this has a very literal
    interpretaion: it's the date by which the task must be done.
    And for those of us that are bad at mental math or get overwhelmed
    by too many tasks easily (I am both), a task manager can *compute*
    the relative date of the deadline, such as "due 2d from now" or
    "due 13min from now".
*   ~~Task **dependencies**.~~  (Forget about this.  I wrote this down
    for [the meeting notes](../meetings/2025-10-16/) because that is
    accurate to what I said, but in retrospect there doesn't seem
    to be great needs for this.  Sub-tasks are more interesting to
    me though; see below.)
*   Nested tasks, or **sub-tasks**.  I didn't talk about this much
    in the meeting, but this is the more realistic need for a task
    manager.  The relationship contrasts with above (dependencies)
    in that the parent task *comprises* on its children and is
    *immediately* completed when all of its children are completed.
    (Of course, I am talking about the possibility of arbitrarily
    nested, which in and of itself is still an interesting challenge.)
*   Task **weights**.  Put simply, some homework is simply worth more
    points... if you can't do them all, then the task manager should
    maximize the ones you can complete with more benefits --- that's
    Economics 101!  (The measure of utility is purely theoretical and
    beyond the scope of our software :)
    
## Software Stack

Mobile app so we're going with the standard Android stack!

*   Kotlin for programming language (it's like Java, don't worry)
*   SQLite for database storage (perfect for sub-task relationships!)
*   For build tool we can use Gradle (which is a lot less headache
    than the big industry Maven I hope ^^)

If our app is good enough, we may publish it to ~~the Play Store~~ F-Droid :)


## Related

[Vikunja][] seems like a cool to-do list app.
It's open-source and self-hosted.
There is a demo at <https://try.vikunja.io/login>
you can play with.

I just found out today about [Tudu][].
And it seems cool too (namely with subtask feature).

Besides that definitely check out [TaskWarrior][].
And maybe [Todo.txt][] too?  Oh and, just a personal
piece of advice, but in general, [org-mode](https://code.meskio.net/tudu/)
and [Vimwiki](https://vimwiki.github.io/) are two things
worth looking into. :)

[Vikunja]: https://vikunja.io/
[TaskWarrior]: https://taskwarrior.org/docs/start/
[Todo.txt]: http://todotxt.org/
[Tudu]: https://vimwiki.github.io/

## Milestone

(If we go with this project I will write more about it!)
