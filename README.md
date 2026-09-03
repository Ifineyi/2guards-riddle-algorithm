# Two-Guard Riddle Algorithm — Multi-Language Implementation

A reference implementation of the classic **Two-Guard Riddle** (also known as the "Heaven and Hell" or "Two Door" puzzle) implemented across dozens of programming languages.

## The Riddle

You stand before two doors. One leads to freedom, the other to danger. Two guards stand by the doors — one **always tells the truth**, the other **always lies**. You don't know which guard is which, or which door is safe.

You may ask **one guard one question**. What do you ask?

## The Algorithm (Double Negation)

The solution uses a **double-negation** logic gate to neutralize the liar:

> Ask either guard: **"Which door would the OTHER guard say is safe?"**

Then take the **opposite** of whatever they answer.

### Why it works

- **T × F = F** — a truth multiplied by a lie always equals a lie
- Whether you ask the truth-teller or the liar, the double negation guarantees they both point to the **wrong** door
- Simply invert their answer to get the safe door

### Pseudo-code

```
ALGORITHM FindFreedomDoor:
    1. Select any random guard (Guard_X).
    2. Define the other guard as Guard_Y.
    3. Input question to Guard_X: "Which door will Guard_Y say is safe?"
    4. Receive Answer_Door from Guard_X.
    5. IF Answer_Door == "Door A" THEN
           RETURN "Door B"
       ELSE
           RETURN "Door A"
```

## Implementations

This repository contains the algorithm implemented in **42 programming languages**, organized by language:

| Language | Folder | File |
|----------|--------|------|
| AWK | `AWK/` | `two_guard_riddle.awk` |
| Bash | `Bash/` | `two_guard_riddle.sh` |
| C | `C/` | `two_guard_riddle.c` |
| C++ | `C++/` | `two_guard_riddle.cpp` |
| C# | `CSharp/` | `two_guard_riddle.cs` |
| Clojure | `Clojure/` | `two_guard_riddle.clj` |
| COBOL | `COBOL/` | `two_guard_riddle.cob` |
| Dart | `Dart/` | `two_guard_riddle.dart` |
| D | `D/` | `two_guard_riddle.d` |
| Elixir | `Elixir/` | `two_guard_riddle.ex` |
| Erlang | `Erlang/` | `two_guard_riddle.erl` |
| F# | `FSharp/` | `two_guard_riddle.fsx` |
| Fortran | `Fortran/` | `two_guard_riddle.f90` |
| Go | `Go/` | `two_guard_riddle.go` |
| Haskell | `Haskell/` | `two_guard_riddle.hs` |
| Java | `Java/` | `Two_guard_riddle.java` |
| Julia | `Julia/` | `two_guard_riddle.jl` |
| Kotlin | `Kotlin/` | `two_guard_riddle.kt` |
| Lua | `Lua/` | `two_guard_riddle.lua` |
| MATLAB | `MATLAB/` | `two_guard_riddle.m` |
| NASM x86_64 | `NASM/` | `two_guard_riddle.asm` |
| Nim | `Nim/` | `two_guard_riddle.nim` |
| Node.js | `Node/` | `two_guard_riddle.js` |
| OCaml | `OCaml/` | `two_guard_riddle.ml` |
| Octave | `Octave/` | `two_guard_riddle.m` |
| Pascal | `Pascal/` | `two_guard_riddle.pas` |
| Perl | `Perl/` | `two_guard_riddle.pl` |
| PHP | `PHP/` | `two_guard_riddle.php` |
| PowerShell | `PowerShell/` | `two_guard_riddle.ps1` |
| Prolog | `Prolog/` | `two_guard_riddle.pl` |
| Python 3 | `Python/` | `two_guard_riddle.py` |
| R | `R/` | `two_guard_riddle.R` |
| Ruby | `Ruby/` | `two_guard_riddle.rb` |
| Rust | `Rust/` | `two_guard_riddle.rs` |
| Scala | `Scala/` | `two_guard_riddle.scala` |
| Sed | `Sed/` | `two_guard_riddle.sed` |
| Swift | `Swift/` | `two_guard_riddle.swift` |
| Tcl | `Tcl/` | `two_guard_riddle.tcl` |
| V | `V/` | `two_guard_riddle.v` |
| Vim Script | `Vim/` | `two_guard_riddle.vim` |
| Zig | `Zig/` | `two_guard_riddle.zig` |

## Test Cases

All implementations are tested against 4 scenarios covering every combination of truth-teller/liar and Door A/Door B:

| Test | Safe Door | Guard Asked | Expected Output |
|------|-----------|-------------|-----------------|
| 1 | Door B | Liar | Door B |
| 2 | Door A | Truth-teller | Door A |
| 3 | Door A | Liar | Door A |
| 4 | Door B | Truth-teller | Door B |

Each implementation simulates both guards and verifies the algorithm produces the correct door for all 4 cases.

## How to Run

### Python
```bash
python3 Python/two_guard_riddle.py
```

### C
```bash
gcc C/two_guard_riddle.c -o two_guard_riddle_c && ./two_guard_riddle_c
```

### Go
```bash
cd Go && go run two_guard_riddle.go
```

### Rust
```bash
rustc Rust/two_guard_riddle.rs -o two_guard_riddle_rs && ./two_guard_riddle_rs
```

### Java
```bash
cd Java && javac Two_guard_riddle.java && java Two_guard_riddle
```

### Node.js
```bash
node Node/two_guard_riddle.js
```

### Bash
```bash
bash Bash/two_guard_riddle.sh
```

### Perl
```bash
perl Perl/two_guard_riddle.pl
```

### PowerShell
```bash
pwsh -File PowerShell/two_guard_riddle.ps1
```

### Tcl
```bash
tclsh Tcl/two_guard_riddle.tcl
```

### AWK
```bash
awk -f AWK/two_guard_riddle.awk < /dev/null
```

### SED
```bash
echo "" | sed -f Sed/two_guard_riddle.sed
```

### Ruby
```bash
ruby Ruby/two_guard_riddle.rb
```

### PHP
```bash
php PHP/two_guard_riddle.php
```

### Lua
```bash
lua Lua/two_guard_riddle.lua
```

### V
```bash
v run V/two_guard_riddle.v
```

### NASM (Linux)
```bash
nasm -f elf64 NASM/two_guard_riddle.asm -o two_guard_riddle.o
ld -o two_guard_riddle_asm two_guard_riddle.o
./two_guard_riddle_asm
```

### Clojure
```bash
clojure Clojure/two_guard_riddle.clj
```

### COBOL
```bash
cobc -x -o two_guard_riddle_cob COBOL/two_guard_riddle.cob && ./two_guard_riddle_cob
```

### Dart
```bash
dart Dart/two_guard_riddle.dart
```

### Elixir
```bash
elixir Elixir/two_guard_riddle.ex
```

### Erlang
```bash
cd Erlang && erlc two_guard_riddle.erl && erl -noshell -s two_guard_riddle start -s init stop
```

### F#
```bash
dotnet fsi FSharp/two_guard_riddle.fsx
```

### Fortran
```bash
gfortran Fortran/two_guard_riddle.f90 -o two_guard_riddle_fortran && ./two_guard_riddle_fortran
```

### Haskell
```bash
ghc Haskell/two_guard_riddle.hs -o two_guard_riddle_hs && ./two_guard_riddle_hs
```

### Julia
```bash
julia Julia/two_guard_riddle.jl
```

### Kotlin
```bash
kotlinc Kotlin/two_guard_riddle.kt -include-runtime -d two_guard_riddle_kt.jar && java -jar two_guard_riddle_kt.jar
```

### MATLAB
```bash
matlab -batch "run('MATLAB/two_guard_riddle.m')"
```

### Nim
```bash
nim compile --run Nim/two_guard_riddle.nim
```

### OCaml
```bash
ocamlc -o two_guard_riddle_ml OCaml/two_guard_riddle.ml && ./two_guard_riddle_ml
```

### Octave
```bash
octave Octave/two_guard_riddle.m
```

### Pascal
```bash
fpc Pascal/two_guard_riddle.pas && ./two_guard_riddle
```

### Prolog
```bash
swipl -s Prolog/two_guard_riddle.pl -g "main" -t halt
```

### R
```bash
Rscript R/two_guard_riddle.R
```

### Scala
```bash
scalac Scala/two_guard_riddle.scala && scala TwoGuardRiddle
```

### Swift
```bash
swift Swift/two_guard_riddle.swift
```

### Vim Script
```bash
vim -u NONE -N --cmd "source Vim/two_guard_riddle.vim" --cmd "qa!"
```

### Zig
```bash
zig build-exe Zig/two_guard_riddle.zig && ./two_guard_riddle
```

## Algorithm Logic (Reference Python)

```python
def choose_correct_door(asked_guard_is_truthful, correct_door):
    """
    Simulates the two-guard riddle algorithm.
    Returns the door you should actually walk through.
    """
    doors = ["Door A", "Door B"]
    other_guard_is_truthful = not asked_guard_is_truthful

    # 1. Determine what the OTHER guard would say if asked directly
    if other_guard_is_truthful:
        other_guard_response = correct_door
    else:
        # The liar returns the wrong door
        other_guard_response = [d for d in doors if d != correct_door][0]

    # 2. Determine what the ASKED guard responds
    if asked_guard_is_truthful:
        final_response = other_guard_response
    else:
        # The liar inverts the other guard's answer
        final_response = [d for d in doors if d != other_guard_response][0]

    # 3. Apply the algorithm's rule: Take the opposite of the response
    chosen_door = [d for d in doors if d != final_response][0]
    return chosen_door
```

## Practical Use Cases

This algorithmic structure (double negation to neutralize untrusted sources) appears in:

- **Byzantine Fault Tolerance** — checking data across systems where some nodes may be corrupt or malicious
- **Cryptography** — verifying information without revealing the underlying data stream
- **Distributed consensus** — reaching agreement when some participants may lie

## Project Structure

```
TwoGuardRiddle_Algorithm/
├── AWK/          # AWK implementation
├── Bash/         # Bash shell implementation
├── C/            # C implementation
├── C++/          # C++ implementation
├── CSharp/       # C# implementation
├── Clojure/      # Clojure implementation
├── COBOL/        # COBOL implementation
├── Dart/         # Dart implementation
├── D/            # D implementation
├── Elixir/       # Elixir implementation
├── Erlang/       # Erlang implementation
├── FSharp/       # F# implementation
├── Fortran/      # Fortran implementation
├── Go/           # Go implementation
├── Haskell/      # Haskell implementation
├── Java/         # Java implementation
├── Julia/        # Julia implementation
├── Kotlin/       # Kotlin implementation
├── Lua/          # Lua implementation
├── MATLAB/       # MATLAB implementation
├── NASM/         # NASM x86_64 assembly (Linux ELF64)
├── Nim/          # Nim implementation
├── Node/         # Node.js / JavaScript implementation
├── OCaml/        # OCaml implementation
├── Octave/       # GNU Octave implementation
├── Pascal/       # Pascal implementation
├── Perl/         # Perl implementation
├── PHP/          # PHP implementation
├── PowerShell/   # PowerShell implementation
├── Prolog/       # Prolog implementation
├── Python/       # Python 3 reference implementation
├── R/            # R implementation
├── Ruby/         # Ruby implementation
├── Rust/         # Rust implementation
├── Scala/        # Scala implementation
├── Sed/          # Sed implementation
├── Swift/        # Swift implementation
├── Tcl/          # Tcl implementation
├── V/            # V implementation
├── Vim/          # Vim Script implementation
└── Zig/          # Zig implementation
```

## License

Public domain — use freely for any purpose.

---

*Built as a multi-language programming exercise demonstrating algorithmic thinking across diverse language paradigms.*
