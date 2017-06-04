Section ZadanieOne.

Variables A B C D : Prop. 



Theorem impl_rozdz : (A -> B) -> (A -> C) -> A -> B -> C.
Proof.
intros.
apply H0.
apply H1.
Qed.

Theorem impl_komp : (A -> B) -> (B -> C) -> A -> C.
Proof.
intros.
apply H0 ; apply H ; apply H1.
Qed.

Theorem impl_perm : (A -> B -> C) -> B -> A -> C. 
Proof.
intros.
apply H ; [ apply H1 | apply H0 ].
Qed.

Theorem impl_conj : A -> B -> A /\ B. 
Proof.
intros.
split ; [apply H |apply H0].
Qed.

Theorem conj_elim_l : A /\ B -> A. 
Proof.
intro ; elim H ; intros ;apply H0.
Qed.

Theorem disj_intro_l : A -> A \/ B.
Proof.
intro;left;apply H.
Qed.

Theorem rozl_elim : A \/ B -> (A -> C) -> (B -> C) -> C. 
Proof.
intros.
elim H ; [apply H0 | apply H1].
Qed.

Theorem diamencik : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D.
Proof.
intros.
apply H1;[apply H | apply H0] ; apply H2.
Qed.

Theorem slaby_peirce : ((((A -> B) -> A) -> A) -> B) -> B.
Proof.
intro.
apply H.
intro.
apply H0.
intro.
apply H.
intro.
apply H1.
Qed.

Theorem rozl_impl_rozdz : (A \/ B -> C) -> (A -> C) /\ (B -> C).
Proof.
intro.
split;[intro;apply H;left;apply H0 | intro;apply H;right;apply H0].
Qed.
 
Theorem rozl_impl_rozdz_odw : (A -> C) /\ (B -> C) -> A \/ B -> C.
Proof.
intros.
elim H.
intros.
elim H0;[apply H1|apply H2].
Qed.

Theorem curry : (A /\ B -> C) -> A -> B -> C.
Proof.
intros.
apply H.
split;[apply H0| apply H1].
Qed.

Theorem uncurry : (A -> B -> C) -> A /\ B -> C.
Proof.
intros.
elim H0.
intros.
apply H;[apply H1|apply H2].
Qed.

End ZadanieOne.
