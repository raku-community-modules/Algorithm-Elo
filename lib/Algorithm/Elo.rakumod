unit module Algorithm::Elo;

my constant $k = 32;

my sub do-it(Int:D $delta) {
    1 / (1 + (10 ** ($delta / 400)));
}

our sub calculate-elo(
  Int:D  $left,
  Int:D  $right,
  Bool  :left($left-wins),
  Bool :right($right-wins),
  Bool :$draw
) is export {

    unless $left-wins ^ $right-wins ^ $draw {
        die ':left, :right, and :draw are mutually exclusive';
    }

    unless $left-wins | $right-wins | $draw {
        die 'exactly least one of :left, :right, or :draw must be specified';
    }

    my $expected-left  = do-it($right - $left);
    my $expected-right = do-it($left - $right);

    my $left-multiplier  = $left-wins ?? 1 !! ($right-wins ?? 0 !! 0.5);
    my $right-multiplier = 1 - $left-multiplier;

    (
        round($left  + $k * ($left-multiplier  - $expected-left)),
        round($right + $k * ($right-multiplier - $expected-right)),
    )
}

=begin pod

=head1 NAME

Algorithm::Elo

=head1 SYNOPSIS

=begin code :lang<raku>

use Algorithm::Elo;

my ( $player-a-score, $player-b-score ) = 1_600, 1_600;

( $player-a-score, $player-b-score ) = calculate-elo($player-a-score, $player-b-score, :left);

=end code

=head1 DESCRIPTION

This module implements the Elo rating system, commonly used to rate chess players.

=head1 SUBROUTINES

=head2 calculate-elo(Int $left, Int $right, :left, :right, :draw)

Given two current ratings and the result of a match (C<:left> if the left
player wins, C<:right> if the right player wins, C<:draw> for a draw), return
two new ratings for the left and right players.

=head1 SEE-ALSO

L<Elo Rating System|https://en.wikipedia.org/wiki/Elo_rating_system>

=head1 AUTHORS

=item Rob Hoelz
=item Raku Community

=head1 COPYRIGHT AND LICENSE

Copyright (c) 2015 - 2017 Rob Hoelz

Copyright (c) 2024 Raku Community

This library is free software; you can redistribute it and/or modify it under the MIT license.

=end pod

# vim: expandtab shiftwidth=4
