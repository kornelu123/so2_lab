#!/usr/bin/env bash

#
# Systemy operacyjne 2 – laboratorium nr 7
#
# Zadanie 2.
# Z pliku `dodatkowe/slajdy.tex` wyodrębnić wszystkie potencjalne odnośniki,
# czyli łańcuchy znaków, rozpoczynające się od napisu, określającego protokół,
# za nim ciąg ://, a następnie podana jest lokalizacja jakiegoś zasobu.
# Warto wiedzieć, iż poprawny odnośnik nie może zawierać niektórych znaków
# specjalnych, takich jak nawiasy klamrowe oraz oczywiście spacje.
# Każdy znaleziony unikalny odnośnik wypisać w nowej linii.
#

FILE="dodatkowe/slajdy.tex"

awk '
{
    for (i = 1; i <= NF; i++) {
        if ($i ~ /:\/\//) {
            if ($i ~ "url") {
              gsub (/.*\{/, "")
              gsub (/\}.*/, "")
            }
            print $i
        }
    }
}
' "$FILE" | sort | uniq
