#!/usr/bin/env bash

#
# Systemy operacyjne 2 – laboratorium nr 7
#
# Zadanie 3.
# Przeczytać zawartość pliku `dodatkowe/cpplint.txt` i usunąć z niego wszystkie
# znaczniki języka HTML – czyli ciągi znaków, rozpoczynające się od znaku <,
# aż do najbliższego znaku >. Jako wynik zwrócić pozostałą zawartość,
# pomijając linie puste i takie, których jedyną zawartość stanowią spacje.
#

FILE="dodatkowe/cpplint.txt"

awk '
{
    gsub(/<[^>]*>/, "")
    if ($0 !~ /^[ \t]*$/) {
      print $0
    }
}
' "$FILE"
