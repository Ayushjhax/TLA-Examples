------------------------------ MODULE Untitled ------------------------------

EXTENDS Integers, TLC

VARIABLES small, big

\* This defines the valid states of the model (the types of the variables)
TypeOK == /\ small \in 0..3
         /\ big   \in 0..5
         
\* This is the starting state of the model         
Init ==  /\ big = 0
         /\ small = 0
         
\* --- These are the individual actions (the "tasks") ---

FillSmall == /\ small' = 3
             /\ big' = big 
             
FillBig == /\ big' = 5
           /\ small' = small
           
EmptySmall == /\ small' = 0
              /\ big' = big
              
EmptyBig == /\ big' = 0
            /\ small' = small

\* Pour from the small jug into the big one
PourSmallToBig == 
    LET amount == Min(small, 5 - big) IN
    /\ small' = small - amount
    /\ big'   = big + amount

\* Pour from the big jug into the small one
PourBigToSmall == 
    LET amount == Min(big, 3 - small) IN
    /\ small' = small + amount
    /\ big'   = big - amount

\* --- This is the "Master Command" ---
\* It says a "Next" step is ANY ONE of the actions below.
Next == \/ FillSmall
        \/ FillBig
        \/ EmptySmall
        \/ EmptyBig
        \/ PourSmallToBig
        \/ PourBigToSmall
  
=============================================================================
\* Modification History
\* Last modified Sun Sep 28 03:31:09 IST 2025 by ayush
\* Created Sun Sep 28 03:29:16 IST 2025 by ayush
