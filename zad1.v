Set Implicit Arguments.
Require Import List.
Import ListNotations.
Require Import Bool.
Require Import Lia.

Notation "! x" := (negb x) (at level 20).

Lemma zad1a x y :
  (x && !y) || (!x && !y) || (!x && y) = (!x || !y).
Proof. destruct x,y; simpl; reflexivity.
Qed.

Lemma zad1b x y z :
  !(!x && y && z) && !(x && y && !z) && (x && !y && z) = (x && !y && z).
Proof. destruct x,y,z; simpl; try reflexivity.

 
