Poser maps live here, one JSON per rig template.

`metahuman.guessMap()` writes `metahuman.json`; pass a name to keep more
than one (`guessMap("owl")` -> `owl.json`), and pass the same name to
`placePosers` and `bindSkeleton`.

These are worth committing: a map is the slow part of fitting a rig to a
MetaHuman, and it is reusable across every character built on the same
template.
