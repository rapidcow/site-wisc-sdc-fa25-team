# Ethan's Meeting Memo: Thursday, 2025 October 16

(I think Allie will be posting hers in the Discord server soon?
This will be mine anyways.  I'm putting something down and hopefully
by the end of this weekend we can all have something to look at.
**Edit October 21**: I think everyone will just have to look at
mine then, oh welp... :x)


## Survey and Logistics

The plan is to meet bi-weekly.  And I think Allie will be booking
the room next week as well since she is the leader and has done it
and therefore she is likely the one to do it next time?

The following members are confirmed to be in Team 17 according
to [Allie's finalized roster of the team emailed to the club](https://discord.com/channels/1428212879026552872/1428212880184184854/1430371438048710759):

 - Allie,
 - me (ethan :P),
 - Bridget,
 - Rose,
 - Madhav,
 - Saksham (Agent).

(For people who are not on the list: Do not worry!  The list isn't
that "formal".  You should be if you just participate the Discord
server (which is what some of you are doing, so great job!)  Also,
it is still important that people join the GitHub repository I
created shortly after the meeting.  I will send out something later
along the polls to remind people that it exists....)

Among the people who showed up at the meeting, I recall there was one
Master's student in computer science, me as a sophomore/2nd year,
and the leader a junior/3rd year; then the rest are freshmen/1st year.
(Most people are freshmen.)

In terms of programming experience I can't say I recall much... except
hearing a lot of Python and Java; and from the Wednesday club meeting
I think people said they knew React.js.  So for applications I was
thinking we'd go with [Electron](https://www.electronjs.org/), and
for web services we'd go with some JS framework (Vue.js, Nuxt.js, Next.js)
or Svelte over MySQL and possibly a Python API backend.  (I myself don't
understand Django that well and I think the learning curve can be a bit steep.)
Anyways, the specific software stack will be in their individual
[ideas/](../../ideas/) page, so read that instead!

The primary means of communication would still be Discord.


## Project Brainstorm

![](whiteboard.jpg)

We looked at a few existing projects students at UW had made.

*   [MadHousing.com](https://www.madhousing.com/): Housing info site.
    Made at **SDC Club** Spring 2022 ([source](https://www.madhousing.com/about)).
    Looks like Next.js + Tailwind CSS (judging from the HTML source code),
    hosted on Vercel.
*   [wisc.AlexT.se](http://wisc.alext.se/): Grading distribution site.
    Made by one person ([Alexander Tse](https://www.linkedin.com/in/alex-tse/),
    from which we know the site is built with Python and React.)
    *Maybe* open source but I couldn't find the source code.
    Active to present.
*   [MadGrades.com](https://madgrades.com/):  Yet another grading distribution site.
    [Open source](https://github.com/Madgrades/madgrades.com).  Looks like Next.js
    to me (I can't read code).
*   [UWCourses.com](https://uwcourses.com/): Course-selection website
    made at CheeseHacks Fall 2024, active to present.  Built with
    [SvelteKit](https://svelte.dev/docs/kit/introduction) (among other things
    I definitely don't understand like how they made the graph).
    [Open source](https://github.com/twangodev/uw-coursemap) and AGPL.
*   [UWMatch.com](https://www.uwmatch.com/): made by a few people
    from the end of December 2024 to present.  Build with Svelte backed by
    [FastAPI](https://fastapi.tiangolo.com/) + NoSQL [MongoDB](https://www.mongodb.com/),
    (with an non-negligible amount of help from Cursor), also hosted on Vercel.
    Closed source.  **Has had the desire to expand to a centralized club
    (student org) hub.**

Apparently doing something UW-related is pretty trendy.

(Also, Rose suggested that we do something AI/ML/LLM related... sadly,
most of these projects proposed were not be about that.  And the last
thing I know is to appeal to an employer, so maybe no AI just this one
time, sorry....)

Anyways, the final contenders from our meeting were my idea of **To-do list**
and multiple people's idea of what eventually became **club discovery service**.
Here were our pitches (listed in chronological order):

## Task Manager

(Ethan's pitch) So we're college students, and the amount of homework is
unlike anything most of us have had before.  And although you can see
most of your assignments & activities due for each day on Canvas (you can
even tell Canvas to import those into Google Calendar which is something I
always forget you can do \*facepalm\*), there is --- and I believe ---
still value in taking responsibilities into our own hands: especially when
we have a personal project where there is no roadmap and no partial
project deadlines and check-ups laid out for us.  And well, we could use
Obsidian and Notion, Microsoft Tasks, Google Tasks... or use [TaskWarrior](https://taskwarrior.org/)
like me!  We would be re-inventing an existing solution, but that's fine
--- it would be just as valuable as an experience, and maybe we can add
a creative twist to it....

So what does a task manager need to remember, and how can it help us
manage tasks?

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
*   Task **dependencies**.  Now, for those of you who are CS students
    (or maybe just a computer nerd), you may know that people have
    invented [build systems](https://en.wikipedia.org/wiki/Build_automation)
    over and over again: [Unix Make](https://en.wikipedia.org/wiki/Make_%28software%29);
    [distutils](https://docs.python.org/3.0/library/distutils.html) and
    [setuptools](https://setuptools.pypa.io/en/latest/) for Python 2/3;
    [Apache Maven](https://maven.apache.org/) and [Gradle](https://gradle.org/)...
    and somewhat recently there is [Ninja](https://ninja-build.org/).
    Anyways, tangent aside, dependency management would be a powerful
    feature (though only for very large projects I'm afraid).  Since
    task dependency forms a directed acyclic graph, our task manager
    would have to understand how to traverse this graph, how to find
    dependents and dependees... something that the task manager must
    learn, of course, is when a dependee is completed, it must mark
    all dependees as ready.

Finally, since we all use Canvas, it should be possible to import
Canvas assignments, quizzes, and all that stuff into this task manager
without having to manually type everything.  (So this is the sort of
"**Canvas integration**" I was talking about, except it's nothing core,
just a convenient plugin without which the app is still usable!)

Below is a snapshot of my *real* TaskWarrior task database on this exact
day, which is what I picture the imported the tasks would look like:

```
$ git switch --detach $(git log -1 --until='2025-09-24 11:00' --pretty=%h)
$ faketime -f "$(git log -1 --pretty=%ai)" task

ID Active Age   Project Tag     Due   Description                                                                                    Urg
37  53s    6d   now     STAT431 13h   HW 2                                                                                           14.6
                                        2025-09-17 Content-Location: https://canvas.wisc.edu/courses/466864/assignments/2787819
                                        2025-09-17 1.12, 1.14, 1.16, 1.18, 1.32, 1.34, 1.36, 1.40
38         6d   now     CS240    1d   Ch.4                                                                                           10.1
                                        2025-09-17 Content-Location: https://canvas.wisc.edu/courses/466699/assignments/2823897
41         4d   now     CS240    1d   Additional Participation 1                                                                     10.1
33         2w   now     STAT431  2d   Mastery Check                                                                                  9.72
                                        2025-09-17 Content-Location: https://canvas.wisc.edu/courses/466699/assignments/2823897
34        12d   now     CS354    2d   p2A                                                                                             9.7
                                        2025-09-12 Content-Location: https://canvas.wisc.edu/courses/463513/assignments/2764529
                                        2025-09-17 Src-Header: https://canvas.wisc.edu/courses/463513/pages/program-commenting-guide
40         6d   now     CS240    2d   Assignment 2                                                                                   9.67
                                        2025-09-17 Content-Location: https://canvas.wisc.edu/courses/466699/assignments/2823860
39         6d   now     CS354    3d   A04                                                                                            9.21
27         2w   now     MATH521  8d   Homework 2                                                                                     7.11
                                        2025-09-19 Content-Location: https://canvas.wisc.edu/courses/466939/assignments/2843806
42         4d   now     CS354    9d   p2B                                                                                            6.46
                                        2025-09-19 Content-Location: https://canvas.wisc.edu/courses/463513/assignments/2764530
```

(except of course, it would be a mobile app, not an ugly command-line thing. :)

For a more detailed and up-to-date page, see [ideas/task-manager](../../ideas/task-manager).


## Climate Analyzer

(Madhav's idea)

This is a more research-oriented, big-data project?  I don't remember a lot,
but I will let the bullet points speak for themselves first.

*   Use Pandas (Data Science) and Machine Learning Libraries (Sci-kit learn).
*   Analyze past climate trends to predict the future.

From what I understand, user can navigate to this Climate Analyzer and
input a region (e.g. Midwest US).  The Analyzer will then display a
dashboard of charts, diagrams, and climate predictions for that region.

(Also comment: I think linear regression was raised very often, but I don't
see that is very much Machine Learning... this feels very much like a
statistics open-ended research-themed project to me, which isn't super bad
except I have zero idea what we would be doing to obtain the data or perform
the analysis. :x)

If you would like to develop on this idea, edit [ideas/climate-analyzer](../../ideas/climate-analyzer).


## Minecraft with Computers

(Saksham's idea)

Using Computer Vision (OpenCV) to control games!  This feels like one of
those "wow didn't know that was possible" projects I would come across on
YouTube, but when I tried to look for them, only a few results turned up:

*   "Play Minecraft with Body Gestures" by Taras Skavinskyy
    [[medium]](https://medium.com/%40skavinskyy/play-minecraft-with-body-gestures-4b5b689e4729)
    [[YouTube]](https://www.youtube.com/watch?v=Xd6eBCcqTKw&t=25s)
*   "I Made My Own Mod to Play Minecraft in the Most Realistic Way" (Spanish) by
    PyCrafting Tv [[YouTube]](https://www.youtube.com/watch?v=LejCs62U7nE)

Most other "realistic" Minecraft control videos I've seen are about VR which
is definitely beyond our budget to make (and basically a complete digression
from "computer vision"...)

If you would like to develop on this idea, edit [ideas/minecraft-cv](../../ideas/minecraft-cv)!


## ~~Hackathon~~ Club Discovery

Initially this was going to be about Devpost (as you can see in the middle
of the board), but then I mentioned [win.wisc.edu](https://win.wisc.edu/)
(Wisconsin Involvement Network; which I guess is just a fancy way of saying
clubs and student organizations) and it became that instead....

The idea is, win.wisc.edu is nice but... not nice enough in some ways.
Either there's too much, or the filters are very limited.  Either way,
this club discovery service is going to be a layer on top of win.wisc.edu:
it takes data from win.wisc.edu (somehow), but enables you to search
through the list with more powerful filters.  It will also do recommendations
according to person-centric logic rather than club-centric one used by
win.wisc.edu.

The name for this app is undecided but I came up with the name "Club Radar"
people seemed to like in some way.  I could provide a domain for the website
like <u>clubradar.endfindme.com</u>, or if we deploy to Vercel/Netlify we
can just use their domain.  The framework listed on the whiteboard were Flask
(for prototyping) and [Anvil](https://anvil.works/) (for something?
(I don't know anything about Anvil ask Saksham :x))

This was the idea most people went with... see
[ideas/club-radar](../../ideas/club-radar).
