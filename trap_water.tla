---- MODULE trap_water ----
\* specification for 
\* https://leetcode.com/problems/trapping-rain-water/description/
\*
EXTENDS Integers, Sequences

CONSTANT heights 

VARIABLES left, right, stored, max_left, max_right

Init == /\ left = 1
        /\ right = Len(heights)
        /\ stored = 0
        /\ max_left = 0
        /\ max_right = 0

MAX(x, y) == IF x > y THEN x ELSE y


Advance == IF max_left < max_right THEN
                 /\ stored' = stored + MAX(0, max_left - heights[left])
                 /\ left' = left + 1
                 /\ max_left' = MAX(max_left, heights[left])
                 /\ UNCHANGED<<right,  max_right>>
               ELSE
                 /\ stored' = stored + MAX(0, max_right - heights[right])
                 /\ right' = right - 1
                 /\ max_right' = MAX(max_right, heights[right])
                 /\ UNCHANGED<<left, max_left>>


Next == \/ Advance

LeftLessThanRight ==  /\ left =< right


====
