# Club meeting schedule

Based on [When2Meet](https://www.when2meet.com/?33265403-cPDTO).

```
Scheduled for 3.
3 SAT 13:00-SAT 13:30   @deyan @ethan @saksham
2 TUE 20:00-TUE 22:00   @ethan @saksham
2 FRI 15:45-FRI 17:30   @deyan @ethan
2 SAT 12:45-SAT 13:00   @ethan @saksham
2 SAT 13:30-SAT 15:00   @deyan @ethan
2 SUN 13:00-SUN 16:00   @deyan @ethan
1 MON 10:00-MON 13:30   @deyan
1 MON 15:45-MON 18:00   @ethan
1 MON 20:00-MON 23:00   @ethan
1 TUE 14:30-TUE 18:00   @ethan
1 TUE 22:00-TUE 23:00   @ethan
1 WED 10:00-WED 13:30   @deyan
1 WED 15:45-WED 18:00   @ethan
1 WED 20:00-WED 23:00   @ethan
1 THU 16:00-THU 18:00   @saksham
1 FRI 11:00-FRI 14:00   @saksham
1 FRI 17:30-FRI 18:00   @ethan
1 FRI 20:00-FRI 22:00   @ethan
1 SAT 11:30-SAT 12:45   @ethan
1 SAT 15:00-SAT 17:00   @ethan
1 SUN 11:30-SUN 13:00   @ethan
1 SUN 16:00-SUN 17:00   @ethan
0 MON 13:30-MON 15:45
0 MON 18:00-MON 20:00
0 MON 23:00-TUE 14:30
0 TUE 18:00-TUE 20:00
0 TUE 23:00-WED 10:00
0 WED 13:30-WED 15:45
0 WED 18:00-WED 20:00
0 WED 23:00-THU 16:00
0 THU 18:00-FRI 11:00
0 FRI 14:00-FRI 15:45
0 FRI 18:00-FRI 20:00
0 FRI 22:00-SAT 11:30
0 SAT 17:00-SUN 11:30
0 SUN 17:00-*********
```

Raw intervals (data for machine consumption):

```perl
# This top portion should be replaced with the Perl script at:
#     <https://www.endfindme.com/cs400/bin/sched.pl>
# The original code is trimmed here for brevity.

__DATA__

# The following data is migrated from When2Meet by hand.
# <https://www.when2meet.com/?33265403-cPDTO>
#
# As a note on technical limitation, When2Meet does not
# permit entry of times prior to 10AM and past 11PM.
# Intervals at the brink of those bounds do not neces-
# sarily reflect the member's preference.


@ethan
MON 15:45
MON 18:00
MON 20:00
MON 23:00 # CLIP

TUE 14:30
TUE 18:00
TUE 20:00
TUE 23:00 # CLIP

WED 15:45
WED 18:00
WED 20:00
WED 23:00 # CLIP

FRI 15:45
FRI 18:00
FRI 20:00
FRI 22:00

SAT 11:30
SAT 17:00

SUN 11:30
SUN 17:00

@deyan
MON 10:00
MON 13:30

WED 10:00
WED 13:30

FRI 15:45
FRI 17:30

SAT 13:00
SAT 15:00
SUN 13:00
SUN 16:00

@saksham
TUE 20:00
TUE 22:00

THU 16:00
THU 18:00

FRI 11:00
FRI 14:00

SAT 12:45
SAT 13:30

@EOF
```
