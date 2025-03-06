#!/usr/bin/env bash
#
# Systemy operacyjne 2 – laboratorium nr 3
#
# Zadanie 9.
# Odszukać w katalogu `dane/` i jego bezpośrednich podkatalogach (uwzględnić
# tylko jeden poziom wgłąb) wszystkie wiszące dowiązania miękkie i podjąć próbę
# ich naprawy – zakładamy, że nazwy wskazywanych przez nie plików są poprawne,
# ale doszło do jakiegoś zamieszania w strukturze katalogów. Należy odszukać
# pasujących plików zwykłych, a jeśli takie istnieją – wyświetlić nazwę
# dowiązania, dwukropek i po spacji: najkrótszą poprawną ścieżkę względną
# do niego od istniejącego dowiązania (na przykład: bravo: ../icao/bravo).
#

BASE_DIR="dane"

resolve_symlink() {
    local symlink="$1"
    local target_name
    target_name=$(basename "$(readlink "$symlink")")

    local target_file=""

    for file in "$BASE_DIR"/* "$BASE_DIR"/*/*; do
        if [[ -f "$file" && $(basename "$file") == "$target_name" ]]; then
            target_file="$file"
            break
        fi
    done

    if [[ -n "$target_file" ]]; then
        local relative_path
        relative_path=$(realpath --relative-to="$(dirname "$symlink")" "$target_file")
        echo "$target_name: $relative_path"
    fi
}

while IFS= read -r -d '' symlink; do
    if [[ ! -e "$symlink" ]]; then
        if [[ ! -e "$symlink" ]]; then
          resolve_symlink "$symlink"
        fi
    fi
done < <(find "$BASE_DIR" -maxdepth 2 -type l -print0)
