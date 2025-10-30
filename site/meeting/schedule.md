# Club meeting schedule

**Update**: Allie has created a [when2meet](https://www.when2meet.com/?33265403-cPDTO)
thing as an alternative to my script :(  Use that if you want to,
but I am going to mirror the availability periods (since i really
want to use my script after it being completely wasted for CS400...
(and i also want to be able to check it inside my terminal without
having to use a web browser))

**ethan:**

*   Saturday, Sunday 11:30 to 17:00
*   Saturday, Sunday 22:00 to 24:00
*   Monday, Wednesday 15:45 to 18:00
*   Tuesday, Thursday 14:30 to 18:00
*   Monday, Wednesday, Tuesday, Thursday 20:00 to 24:00
*   Friday 15:45 to 18:00, 20:00 to 22:00
*   Wednesday 18:00 to 20:00 (only if there is SDC club meeting)

```
Scheduled for 1.
1 MON 15:45-MON 18:00   @ethan
1 MON 20:00-TUE BEGIN   @ethan
1 TUE 14:30-TUE 18:00   @ethan
1 TUE 20:00-WED BEGIN   @ethan
1 WED 15:45-THU BEGIN   @ethan
1 THU 14:30-THU 18:00   @ethan
1 THU 20:00-FRI BEGIN   @ethan
1 FRI 15:45-FRI 18:00   @ethan
1 FRI 20:00-FRI 22:00   @ethan
1 SAT 11:30-SAT 17:00   @ethan
1 SAT 22:00-SUN BEGIN   @ethan
1 SUN 11:30-SUN 17:00   @ethan
1 SUN 22:00-*********   @ethan
0 MON 18:00-MON 20:00
0 TUE BEGIN-TUE 14:30
0 TUE 18:00-TUE 20:00
0 WED BEGIN-WED 15:45
0 THU BEGIN-THU 14:30
0 THU 18:00-THU 20:00
0 FRI BEGIN-FRI 15:45
0 FRI 18:00-FRI 20:00
0 FRI 22:00-SAT 11:30
0 SAT 17:00-SAT 22:00
0 SUN BEGIN-SUN 11:30
0 SUN 17:00-SUN 22:00
```

Raw intervals (data for machine consumption;
see [sched.pl](https://gist.github.com/eyzmeng/b121ce0de97d946fcd65839149d38638))

```
__DATA__

# 00:00 is the START-OF-DAY mark.
# 24:00 is the END-OF-DAY mark.

@ethan
MON 15:45
MON 18:00
MON 20:00
MON 24:00

TUE 14:30
TUE 18:00
TUE 20:00
TUE 24:00

# For this Wednesday only...
WED 15:45
WED 24:00

THU 14:30
THU 18:00
THU 20:00
THU 24:00

FRI 15:45
FRI 18:00
FRI 20:00
FRI 22:00

SAT 11:30
SAT 17:00
SAT 22:00
SAT 24:00

SUN 11:30
SUN 17:00
SUN 22:00
SUN 24:00

@EOF
```
