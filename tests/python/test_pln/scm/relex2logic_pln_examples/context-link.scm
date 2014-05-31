; In the context of music, a bass is an instrument.
(ContextLink (stv .9 .9)
    (ConceptNode "music")
    (InheritanceLink
        (ConceptNode "bass")
        (ConceptNode "instrument")))

; In the context of food, a bass is a fish.
(ContextLink (stv .9 .9)
    (ConceptNode "food")
    (InheritanceLink
        (ConceptNode "bass")
        (ConceptNode "fish")))

(HebbianLink (stv .9 .9)
    (ConceptNode "eating")
    (ConceptNode "food"))

; I like eating bass.
; RelEx at the moment delivers the wrong output for this sentence.
; Eating is interpreted as an adjective:
; _obj(like, bass)
; _subj(like, I)
; _amod(bass, eating)
; The output produced by RelEx2Logic should be:
(EvaluationLink
    (PredicateNote "inputs")
        (ListLink
            (EvaluationLink
                (PredicateNode "like")
                (ListLink
                    (ConceptNode "I")
                    (EvaluationLink
                        (PredicateNode "eat")
                        (ListLink
                            (ConceptNode "I")
                            (ConceptNode "bass@12345")))))
            (InheritanceLink
                (ConceptNode "bass@12345")
                (ConceptNode "bass"))
        ; there should be some more inputs here, but I'm not sure
        ; what else meaningful R2L would derive from the sentence.
    )
)

; The final InheritanceLink would be derived with the DeductionRule.
; I'm not sure how to get their, though. Particularly, I'm uncertain
; how to leverage ContextLink and HebbianLink and how to derive
; a relationship between "bass" and "eating" from the example sentence.

(EvaluationLink
    (PredicateNode "outputs")
        (ListLink
            (InheritanceLink
                (ConceptNode "bass@12345")
                (ConceptNode "fish"))))       
