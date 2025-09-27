------------------------------ MODULE Untitled ------------------------------
EXTENDS Integers
VARIABLES i, pc

Init == (pc = "start") /\ (i=0)

Pick == \/ /\ pc = "start"
           /\ i' \in 0..1000
           /\ pc' = "middle"
           
Add1 == \/ /\ pc = "middle"
           /\ i' = i + 1
           /\ pc' = "done"

Next == Pick \/ Add1
=============================================================================
\* Modification History
\* Last modified Sun Sep 28 01:36:37 IST 2025 by ayush
\* Created Sun Sep 28 01:32:53 IST 2025 by ayush
