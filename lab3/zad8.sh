#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Celem zajęć jest pogłębienie wiedzy na temat struktury systemu plików,
# poruszania się po katalogach i kontroli uprawnień w skryptach powłoki.
# Proszę unikać wykorzystywania narzędzia `find` w ramach bieżących zajęć.
#
# Nie przywiązujemy wagi do środowiska roboczego – zakładamy, że jego pliki,
# inne niż te podane wprost w treści zadań, mogą ulec zmianie, a przygotowane
# rozwiązania nadal powinny działać poprawnie (robić to, o czym zadanie mówi).
#
# Wszystkie chwyty dozwolone, ale ostatecznie w wyniku ma powstać tylko to,
# o czym mowa w treści zadania – tworzone samodzielnie ewentualne tymczasowe
# pliki pomocnicze należy usunąć.
#

#
# Zadanie 8.
# Opracować narzędzie do niby-synchronizacji plików pomiędzy dwoma katalogami
# – `dane/elements/` (L) oraz `dane/pierwiastki/` (P). Każdy plik zwykły
# (pomijamy dowiązania miękkie) powinien mieć swój odpowiednik o tej samej
# nazwie w drugim katalogu (przy czym odpowiednik może być dowolnego typu,
# nie sprawdzamy również jego zawartości). Jako wynik działania skryptu proszę
# zwrócić informację o brakujących plikach w poszczególnych katalogach,
# podając nazwy plików, poprzedzone indeksem L lub P i znakiem dwukropka,
# każdy wpis w osobnej linii (na przykład: L:Oxygen – indeks mówi, w którym
# katalogu powinien znaleźć się dany plik).
#

L="dane/elements"
P="dane/pierwiastki"

for l_line in "$L"/*; do
  count=0
  for p_line in "$P"/*; do
    if [ "$(basename $p_line)" = "$(basename $l_line)" ]; then
      count=1
    fi
  done

  if [ $count = 0 ] && [ -f "$l_line" ] && [ ! -L "$l_line" ]; then
    echo "P:$(basename $l_line)"
  fi
done

for p_line in "$P"/*; do
  count=0
  for l_line in "$L"/*; do
    if [ "$(basename $p_line)" = "$(basename $l_line)" ]; then
      count=1
    fi
  done

  if [ $count = 0 ] && [ -f "$p_line" ] && [ ! -L "$p_line" ]; then
    echo "L:$(basename $p_line)"
  fi
done
