------------------------------ MODULE Untitled ------------------------------

EXTENDS Integers

VARIABLES small, big

TypeOK == /\ small \in 0..3
         /\ big   \in 0..5
         
Init ==  /\ big = 0
         /\ small = 0
         
FillSmall == /\ small' = 3
             /\ big' = big 
             
FillBig == /\ big' = 5
           /\ small' = small
           
EmptySmall == /\ small' = 0
              /\ big' = big
              
EmptyBig == /\ big' = 0
            /\ small' = small
              
=============================================================================
\* Modification History
\* Last modified Sun Sep 28 03:08:17 IST 2025 by ayush
\* Created Sun Sep 28 02:52:44 IST 2025 by ayush
