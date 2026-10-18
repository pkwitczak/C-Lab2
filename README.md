# C-Lab2

![C](https://img.shields.io/badge/Language-C99-A8B9CC?style=flat&logo=c&logoColor=black)
![Linux](https://img.shields.io/badge/Target-Linux-FCC624?style=flat&logo=linux&logoColor=black)
![GitHub Codespaces](https://img.shields.io/badge/Environment-GitHub%20Codespaces-181717?style=flat&logo=github&logoColor=white)
![Educational](https://img.shields.io/badge/Purpose-Educational-6A5ACD?style=flat)

Drugie laboratorium z języka C, przygotowane do pracy w środowisku GitHub Codespaces.

## Cel laboratorium

Celem zajęć jest zapoznanie studenta z:

- pobieraniem tekstu i liczb za pomocą `scanf`,
- sprawdzaniem wyniku odczytu,
- tablicami znaków i ich rozmiarami,
- przepełnieniem bufora,
- ograniczeniami konwersji liczbowych przez `scanf`,
- odczytem linii za pomocą `fgets`,
- konwersją tekstu na liczbę za pomocą `strtol`,
- sprawdzaniem poprawności i zakresu danych,
- instrukcjami warunkowymi,
- obserwowaniem danych wejściowych w debuggerze.

## Struktura projektu

```text
.
├── .devcontainer/
│   └── devcontainer.json
├── .vscode/
│   ├── launch.json
│   └── tasks.json
├── src/
│   └── main.c
├── tests/
├── build/
├── Makefile
└── README.md
```

Najważniejsze elementy projektu:

- `src/main.c` — główny plik źródłowy programu; to plik edytowany przez studenta,
- `tests/` — katalog zawierający pliki pomocnicze związane z testami projektu,
- `Makefile` — plik sterujący budowaniem i uruchamianiem programu,
- `.vscode/launch.json` — konfiguracja uruchamiania oraz debugowania w VS Code,
- `.vscode/tasks.json` — konfiguracja zadań uruchamianych z poziomu VS Code,
- `.devcontainer/` — konfiguracja środowiska GitHub Codespaces,
- `build/` — katalog na pliki wynikowe kompilacji.

## Budowanie programu

Program można zbudować poleceniem:

```bash
make
```

Po poprawnej kompilacji plik wykonywalny zostanie utworzony w lokalizacji:

```text
build/app
```

Kompilacja wykorzystuje standard C99 oraz flagi diagnostyczne:

```text
-std=c99 -Wall -Wextra -Wpedantic -g
```

Znaczenie flag:

- `-std=c99` — użycie standardu C99,
- `-Wall` — włączenie podstawowych ostrzeżeń kompilatora,
- `-Wextra` — włączenie dodatkowych ostrzeżeń,
- `-Wpedantic` — ostrzeżenia o elementach niezgodnych ze standardem,
- `-g` — dodanie informacji potrzebnych podczas debugowania w GDB.

## Uruchamianie programu

Program można uruchomić z terminala:

```bash
make run
```

Program można także uruchamiać z poziomu VS Code / GitHub Codespaces przez zadania zdefiniowane w `.vscode/tasks.json`.

## Program startowy

Plik `src/main.c` zawiera program wczytujący i wypisujący jedno słowo.

```c
#include <stdio.h>

int main(void)
{
    char word[8] = {0};
    int result = scanf("%s", word);

    if (result == 1) {
        printf("word: %s\n", word);
    }

    return 0;
}
```
## Funkcje wykorzystywane w laboratorium

### `scanf`

Nagłówek: `<stdio.h>`.

Odczytuje dane ze standardowego wejścia, interpretuje je zgodnie z podanym formatem i zapisuje wyniki pod adresami przekazanymi w argumentach.

Zwraca liczbę poprawnie przypisanych elementów. Wynik może być równy `0`, jeśli dane nie pasują do formatu. `EOF` oznacza błąd wejścia, w tym koniec danych, przed pierwszą zakończoną konwersją lub pierwszym niepowodzeniem dopasowania.

### `fgets`

Nagłówek: `<stdio.h>`.

Odczytuje ze wskazanego strumienia najwyżej `count - 1` znaków i zapisuje je w tablicy.

Odczyt kończy się po napotkaniu znaku nowej linii, końca wejścia albo osiągnięciu limitu. Znak nowej linii, jeśli został odczytany, jest zapisywany w tablicy. Po udanym odczycie funkcja dopisuje znak `'\0'`.

Zwraca wskaźnik do tablicy po udanym odczycie albo `NULL` w przypadku błędu lub końca wejścia bez odczytania żadnego znaku.

### `getchar`

Nagłówek: `<stdio.h>`.

Odczytuje następny znak ze standardowego wejścia. Zwraca odczytany znak jako wartość typu `unsigned char` przekonwertowaną na `int` albo `EOF` w przypadku końca wejścia lub błędu.

### `strtol`

Nagłówek: `<stdlib.h>`.

Konwertuje początkową część łańcucha znaków na liczbę typu `long`, zgodnie z podaną podstawą systemu liczbowego.

Pomija początkowe białe znaki i dopuszcza opcjonalny znak `+` lub `-`. Przez argument `endptr` zapisuje adres pierwszego znaku niewykorzystanego w konwersji.

Jeżeli nie wykonano konwersji, zwraca `0`, a wskaźnik końca wskazuje początek przekazanego tekstu. Jeżeli wynik przekracza zakres `long`, zwraca odpowiednio `LONG_MIN` albo `LONG_MAX` i ustawia `errno` na `ERANGE`.

### `isspace`

Nagłówek: `<ctype.h>`.

Sprawdza, czy argument reprezentuje biały znak, np. spację, tabulator lub znak nowej linii.

Zwraca wartość różną od zera dla białego znaku, a `0` w przeciwnym przypadku. Argument musi mieć wartość reprezentowalną jako `unsigned char` albo być równy `EOF`.

### `feof` i `ferror`

Nagłówek: `<stdio.h>`.

`feof` sprawdza wskaźnik końca wejścia wskazanego strumienia. `ferror` sprawdza wskaźnik błędu.

Funkcje zwracają wartość różną od zera, jeśli odpowiedni wskaźnik jest ustawiony.

## Debugowanie

Program można debugować przez panel Run and Debug.

1. Ustaw breakpoint na wybranej instrukcji.
2. Uruchom debugowanie klawiszem `F5`.
3. Dodaj zmienne lub wyrażenia do panelu WATCH przyciskiem `+`.
4. Wykonuj program krokowo klawiszem `F10`.
5. Dane wpisuj w terminalu uruchomionego programu.

Ustawiaj breakpointy przed odczytem i po odczycie, aby porównać wartości. Nie interpretuj zawartości niezainicjalizowanej zmiennej jako wyniku działania programu.

## Zadania

### 1. Uruchomienie i uzupełnienie programu

1. Uruchom program startowy i wpisz:

   ```text
   kot
   ```

2. Dopisz wypisywanie wartości zmiennej `result` na ekran.
3. Dopisz komunikat błędu wyświetlany, gdy `result` jest różne od `1`.
4. Uruchom program w debuggerze.
5. Ustaw breakpoint przed wywołaniem `scanf`.
6. Dodaj `word` i `result` do WATCH.
7. Wykonaj odczyt i sprawdź wartości po jego zakończeniu.

### 2. Zbyt długi tekst

Uruchom program ponownie i wpisz:

```text
abcdefghijklmnopqrstuvwxyz
```

Porównaj zachowanie z odczytem krótkiego słowa. Powtórz eksperyment w debuggerze i obejrzyj tablicę `word`.

Zapisz odpowiedzi:

- Ile elementów ma tablica `word`?
- Ile znaków tekstu można w niej zapisać, pozostawiając miejsce na `'\0'`?
- Czy `scanf` otrzymał informację o rozmiarze tablicy?
- Co zaobserwowałeś po wpisaniu zbyt długiego tekstu?

Zapis poza tablicą powoduje tzw. niezdefiniowane zachowanie. 

Brak widocznych błędów nie oznacza poprawnego działania.

### 3. Ograniczenie szerokości odczytu

Zmień format `%s` na `%7s`.

1. Sprawdź odczyt krótkiego i długiego tekstu.
2. Dodaj drugą tablicę `char second_word[8]`.
3. Dodaj drugi odczyt z formatem `%7s` i sprawdź jego wynik.
4. Uruchom program i wpisz jeden długi ciąg bez spacji:

   ```text
   abcdefghijklmnopqrstuvwxyz
   ```

5. Sprawdź zawartość obu tablic.

Wyjaśnij:

- Dlaczego zastosowano limit `7`, a nie `8`?
- Co zostało odczytane przez drugie wywołanie?
- Czy ograniczenie zapisu do tablicy oznacza odrzucenie całego zbyt długiego wejścia?

### 4. Wczytanie liczby całkowitej

Zmień program tak, aby zamiast słowa odczytywał jedną liczbę.

1. Zadeklaruj zmienną `value` typu `int` i zainicjalizuj ją wartością `0`.
2. Wczytaj liczbę przez `scanf` z formatem `%d`.
3. Zapisz wynik odczytu w zmiennej `result`.
4. Wypisz `result`.
5. Wypisz `value` tylko po udanej konwersji. W przeciwnym razie wypisz komunikat błędu.

Sprawdź osobno:

```text
42
```

```text
-17
```

```text
abc
```

```text
42abc
```

```text
42 17
```

Sprawdź również reakcję na pustą linię.

W debuggerze obserwuj `value` i `result`.

Odpowiedz:

- Co oznacza wynik `1`, a co wynik `0`?
- Czy odczyt `42abc` zakończył się błędem?
- Czy program odczytał całą linię, czy tylko liczbę z jej początku?
- Czy naciśnięcie samego Enter zakończyło odczyt?

### 5. Liczba poza zakresem

Dodaj nagłówek `<limits.h>` i sprawdź wartości `INT_MIN` oraz `INT_MAX`.

Uruchom program dla:

1. `INT_MIN`.
2. `INT_MAX`.
3. Tekstu przedstawiającego liczbę większą od `INT_MAX`.
4. Bardzo długiego ciągu cyfr.

Liczbę większą od `INT_MAX` wpisz jako tekst na wejściu. Nie obliczaj jej w programie przez dodawanie do `INT_MAX`.

Obserwuj `value` i `result` w WATCH.

Jeżeli wynik konwersji przez `scanf` nie mieści się w typie docelowym, zachowanie jest niezdefiniowane. Nie oczekuj konkretnej wartości ani określonego sposobu zakończenia programu.

Wyjaśnij:

- Czy sprawdzenie `result == 1` wystarcza do wykrycia liczby spoza zakresu?
- Czym ten problem różni się od zapisu tekstu poza tablicą?
- Dlaczego wynik zaobserwowany w Codespaces nie stanowi gwarancji zachowania na innej platformie?

### 6. Odczyt linii przez `fgets`

Zastąp bezpośredni odczyt liczby przez `scanf` odczytem tekstu przez `fgets`.

1. Zadeklaruj tablicę `line` o rozmiarze 64 elementów.
2. Odczytaj tekst przez `fgets`, przekazując rozmiar tablicy.
3. Sprawdź wynik odczytu. Jeśli funkcja zwróci `NULL`, rozróżnij koniec wejścia od błędu odczytu i zakończ program.
4. Sprawdź, czy tablica zawiera znak nowej linii `'\n'`.

Przyjmij limit 63 znaków przed końcem linii.

Jeśli w tablicy znajduje się `'\n'`, odczytano całą linię.

Jeśli nie ma `'\n'`, odczytaj jeszcze jeden znak przez `getchar`:

- jeśli jest nim `'\n'`, linia miała dokładnie 63 znaki i mieści się w limicie;
- jeśli otrzymano EOF, sprawdź `ferror`: brak błędu oznacza poprawny koniec ostatniej linii;
- jeśli odczytano inny znak, linia przekracza limit — wypisz błąd i zakończ program.

Wynik `getchar` przechowuj w zmiennej typu `int`.

Sprawdź program dla krótkiej linii, dokładnie 63 znaków oraz linii dłuższej niż 63 znaki. Na tym etapie nie konwertuj jeszcze tekstu na liczbę.
### 7. Konwersja przez `strtol`

Po odczytaniu kompletnej linii przekonwertuj tekst na liczbę.

Wykonaj czynności w podanej kolejności:

1. Ustaw `errno` na `0`.
2. Wywołaj `strtol` z podstawą `10`.
3. Zapisz wynik w `parsed_value` typu `long`.
4. Zapisz pozycję końca konwersji we wskaźniku `end`.
5. Sprawdź, czy wykonano jakąkolwiek konwersję.
6. Sprawdź, czy wystąpił błąd `ERANGE`.
7. Pomiń białe znaki pozostające po liczbie.
8. Odrzuć wejście, jeśli pozostały inne znaki.
9. Sprawdź, czy wynik mieści się między `INT_MIN` i `INT_MAX`.
10. Dopiero po przejściu kontroli przypisz wynik do `value` typu `int`.

Przy użyciu `isspace` przekonwertuj sprawdzany znak na `unsigned char`.

Zaleca się oddzielanie odczytu tekstu od konwersji liczbowej i sprawdzanie obu etapów. Pozwala to rozróżnić brak liczby, nieprawidłową końcówkę, przekroczenie zakresu i zbyt długie wejście.

### 8. Wymagania programu docelowego

Program odczytuje jedną linię zawierającą jedną liczbę całkowitą w zapisie dziesiętnym.

Dopuszczalne są:

- znak `+` lub `-` przed liczbą,
- białe znaki przed i po liczbie,
- ostatnia linia zakończona EOF zamiast `'\n'`.

Program odrzuca:

- pustą linię i linię zawierającą tylko białe znaki,
- tekst, w którym nie znaleziono liczby,
- niedozwolone znaki po liczbie,
- dodatkową liczbę w tej samej linii,
- liczbę spoza zakresu `int`,
- linię dłuższą niż przyjęty limit.

Nie wypisuj zaproszeń do wpisania danych, nagłówków ani pustych linii. Każde uruchomienie powinno wypisać jedną linię wyniku.

| Sytuacja | Wyjście |
|---|---|
| Poprawna liczba, np. `42` | `value: 42` |
| Brak liczby | `error: invalid input` |
| Niedozwolone znaki po liczbie | `error: trailing characters` |
| Liczba spoza zakresu `long` lub `int` | `error: out of range` |
| Zbyt długa linia | `error: input too long` |
| EOF bez danych | `error: no input` |
| Błąd odczytu | `error: read failure` |

Kończ obsługę po wykryciu błędu. Dla zbyt długiej linii zgłoś błąd długości przed próbą konwersji.

### 9. Sprawdzenie poprawionej wersji

Sprawdź następujące wejścia:

| Wejście | Oczekiwane wyjście |
|---|---|
| `42` | `value: 42` |
| `-17` | `value: -17` |
| `+8` | `value: 8` |
| `0` | `value: 0` |
| `  25  ` | `value: 25` |
| Pusta linia | `error: invalid input` |
| `abc` | `error: invalid input` |
| `42abc` | `error: trailing characters` |
| `42 17` | `error: trailing characters` |

Sprawdź również:

- granice zakresu `int`,
- wartości tuż poza zakresem `int`,
- linię mającą dokładnie 63 znaki,
- linię przekraczającą limit,
- ostatnią linię bez końcowego `'\n'`,
- EOF bez danych.

Dodaj sprawdzenia z `assert` dla konwersji poprawnej liczby, braku liczby, dodatkowych znaków i przekroczenia zakresu. W razie potrzeby wydziel konwersję do funkcji pomocniczej.

Asercje służą do sprawdzania działania kodu. Nie zastępuj nimi komunikatów i warunków obsługujących niepoprawne dane użytkownika.

### 10. Obserwacja konwersji w WATCH

Ustaw breakpoint bezpośrednio po wywołaniu `strtol`.

Dodaj do WATCH:

- `line`,
- `parsed_value`,
- `end`,
- `*end`.

Jeśli debugger umożliwia odczyt `errno`, dodaj również tę wartość.

Porównaj działanie dla:

```text
42
```

```text
42abc
```

```text
abc
```

Sprawdź:

1. Jaką wartość zwróciło `strtol`?
2. Na który znak wskazuje `end`?
3. Czy wykonano jakąkolwiek konwersję?
4. Który warunek przyjmuje lub odrzuca wejście?

Zrób zrzut ekranu dla `42abc`, pokazujący zatrzymany program i panel WATCH.

### 11. Wnioski

Dołącz krótkie odpowiedzi:

1. Dlaczego `%s` bez ograniczenia szerokości jest niebezpieczne?
2. Co poprawia `%7s`, a czego nie rozwiązuje?
3. Dlaczego sprawdzanie wyniku `scanf` nie wystarcza do pełnej walidacji liczby?
4. Dlaczego samo użycie `fgets` nie gwarantuje odczytania całej linii?
5. Jakie kontrole wykonuje program przed zapisaniem wyniku konwersji w zmiennej typu `int`?

_Last updated: 2026-10-18_