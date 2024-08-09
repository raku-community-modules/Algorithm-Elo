[![Actions Status](https://github.com/raku-community-modules/Algorithm-Elo/actions/workflows/linux.yml/badge.svg)](https://github.com/raku-community-modules/Algorithm-Elo/actions) [![Actions Status](https://github.com/raku-community-modules/Algorithm-Elo/actions/workflows/macos.yml/badge.svg)](https://github.com/raku-community-modules/Algorithm-Elo/actions) [![Actions Status](https://github.com/raku-community-modules/Algorithm-Elo/actions/workflows/windows.yml/badge.svg)](https://github.com/raku-community-modules/Algorithm-Elo/actions)

NAME
====

Algorithm::Elo

SYNOPSIS
========

```raku
use Algorithm::Elo;

my ( $player-a-score, $player-b-score ) = 1_600, 1_600;

( $player-a-score, $player-b-score ) = calculate-elo($player-a-score, $player-b-score, :left);
```

DESCRIPTION
===========

This module implements the Elo rating system, commonly used to rate chess players.

SUBROUTINES
===========

calculate-elo(Int $left, Int $right, :left, :right, :draw)
----------------------------------------------------------

Given two current ratings and the result of a match (`:left` if the left player wins, `:right` if the right player wins, `:draw` for a draw), return two new ratings for the left and right players.

SEE-ALSO
========

[Elo Rating System](https://en.wikipedia.org/wiki/Elo_rating_system)

AUTHORS
=======

  * Rob Hoelz

  * Raku Community

COPYRIGHT AND LICENSE
=====================

Copyright (c) 2015 - 2017 Rob Hoelz

Copyright (c) 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the MIT license.

