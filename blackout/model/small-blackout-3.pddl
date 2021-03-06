(define (domain sokoban-sequential)
(:requirements :typing :negative-preconditions)
(:types location - object direction - object player_stone - object stone - player_stone player - player_stone)
(:predicates (is-goal ?0 - location) (is-nongoal ?0 - location) (move-dir ?0 - location ?1 - location ?2 - direction) (at ?0 - player_stone ?1 - location) (clear ?0 - location) (at-goal ?0 - stone))
(:action push-to-nongoal
:parameters (?0player - player ?1stone - stone ?2location - location ?3location - location ?4location - location ?5direction - direction)
:precondition (and 
)
:effect (and (at ?1stone ?4location) (clear ?2location) (at ?0player ?3location)
(not (at ?1stone ?3location)) (not (clear ?4location)) (not (at ?0player ?2location))))
(:action move
:parameters (?0player - player ?1location - location ?2location - location ?3direction - direction)
:precondition (and (clear ?2location)
)
:effect (and (clear ?1location) (at ?0player ?2location)
(not (clear ?2location)) (not (at ?0player ?1location))))
(:action push-to-goal
:parameters (?0player - player ?1stone - stone ?2location - location ?3location - location ?4location - location ?5direction - direction)
:precondition (and (is-goal ?4location)
(not (is-nongoal ?4location)))
:effect (and (at ?1stone ?4location) (clear ?2location) (at ?0player ?3location) (at-goal ?1stone)
(not (at ?1stone ?3location)) (not (clear ?4location)) (not (at ?0player ?2location))))
)
