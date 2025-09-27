------------------------------ MODULE Tcommit ------------------------------
CONSTANT RM      
VARIABLE rmState  
-----------------------------------------------------------------------------
TCTypeOK == 

  rmState \in [RM -> {"working", "prepared", "committed", "aborted"}]

TCInit ==   rmState = [rm \in RM |-> "working"]


canCommit == \A rm \in RM : rmState[rm] \in {"prepared", "committed"}


notCommitted == \A rm \in RM : rmState[rm] # "committed" 

Prepare(rm) == /\ rmState[rm] = "working"
               /\ rmState' = [rmState EXCEPT ![rm] = "prepared"]

Decide(rm)  == \/ /\ rmState[rm] = "prepared"
                  /\ canCommit
                  /\ rmState' = [rmState EXCEPT ![rm] = "committed"]
               \/ /\ rmState[rm] \in {"working", "prepared"}
                  /\ notCommitted
                  /\ rmState' = [rmState EXCEPT ![rm] = "aborted"]

TCNext == \E rm \in RM : Prepare(rm) \/ Decide(rm)

TCSpec == TCInit /\ [][TCNext]_rmState

TCConsistent ==  

  \A rm1, rm2 \in RM : ~ /\ rmState[rm1] = "aborted"
                         /\ rmState[rm2] = "committed"

THEOREM TCSpec => [](TCTypeOK /\ TCConsistent)




=============================================================================
\* Modification History
\* Last modified Sun Sep 28 04:23:36 IST 2025 by ayush
\* Created Sun Sep 28 03:54:16 IST 2025 by ayush
