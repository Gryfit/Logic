{-# LANGUAGE ScopedTypeVariables #-}

type A = Integer
type B = String
type C = Float
type D = Double


--Theorem impl_rozdz : (A -> B) -> (A -> C) -> A -> B -> C.
impl_rozdz = \(h::A->B) -> \(h0::A->C) -> \(h1::A) -> \(h2::B) -> h0 h1 ::C

--Theorem impl_komp : (A -> B) -> (B -> C) -> A -> C.
impl_komp = \(h::A->B) -> \(h0::B->C) -> \(h1::A)-> h0 (h h1) ::C

--Theorem impl_perm : (A -> B -> C) -> B -> A -> C.
impl_perm = \(h::A->B->C) -> \(h0::B) -> \(h1::A)-> h h1 h0 ::C

--Theorem impl_conj : A -> B -> A /\ B.
impl_conj = \(h::A) -> \(h0::B)->(h,h0)::(A,B)

--Theorem conj_elim_l : A /\ B -> A.
conj_elim_l = \(h::(A,B)) -> fst h ::A

--Theorem disj_intro_l : A -> A \/ B.
disj_intro_l = \(h::A) -> Left h :: (Either A  B)

--Theorem rozl_elim : A \/ B -> (A -> C) -> (B -> C) -> C.
rozl_elim = \(h::Either A B) -> \(h0::A->C) -> \(h1::B->C) -> either h0 h1 h ::C

--Theorem diamencik : (A -> B) -> (A -> C) -> (B -> C -> D) -> A -> D.
diamencik = \(h::A->B) -> \(h0::A->C) -> \(h1::B->C->D) -> \(h2::A) -> h1 (h h2) (h0 h2) ::D

--Theorem slaby_peirce : ((((A -> B) -> A) -> A) -> B) -> B.
slaby_peirce = \(h::(((A -> B) -> A) -> A) -> B) -> h (\(h0::(A -> B) -> A) -> h0(\(h1::A) -> h (\(h2::((A->B)->A)) -> h1))) ::B

--Theorem rozl_impl_rozdz : (A \/ B -> C) -> (A -> C) /\ (B -> C).
rozl_impl_rozdz = \(h::Either A B -> C) -> (\(h0::A) -> h (Left h0), \(h0::B) -> h (Right h0)) :: ((A -> C), (B -> C))

--Theorem rozl_impl_rozdz_odw : (A -> C) /\ (B -> C) -> A \/ B -> C.
rozl_impl_rozdz_odw = \(h::((A -> C), (B -> C))) -> \(h0::Either A B) -> (either (fst h) (snd h) h0) ::C

--Theorem curry : (A /\ B -> C) -> A -> B -> C.
t_curry = \(h::(A, B) -> C) -> \(h0::A) -> \(h1::B) -> h (h0, h1) ::C


--Theorem uncurry : (A -> B -> C) -> A /\ B -> C.
t_uncurry = \(h::A -> B -> C) -> \(h0::(A,B)) -> h (fst h0) (snd h0) ::C
