(* Two-Guard Riddle Algorithm - OCaml implementation *)
(* Usage: ocaml two_guard_riddle.ml *)
(*
 * The riddle: Two doors (left/right), one leads to freedom, one to danger.
 * Two guards: one always tells truth, one always lies. You don't know which is which.
 * You can ask ONE question to ONE guard. What do you ask?
 *
 * Classic solution: Ask "If I asked the OTHER guard which door is safe, what would he say?"
 * Then choose the OPPOSITE door. The logic works regardless of which guard you ask.
 *)

let find_freedom_door ask_truthful correct_door =
  let other_is_truthful = not ask_truthful in
  (* What the other guard would say *)
  let other_says =
    if other_is_truthful then correct_door
    else if correct_door = "Door A" then "Door B" else "Door A"
  in
  (* What the asked guard reports *)
  let asked_says =
    if ask_truthful then other_says
    else if other_says = "Door A" then "Door B" else "Door A"
  in
  (* Choose the opposite of what was said *)
  if asked_says = "Door A" then "Door B" else "Door A"

let run_test ask_truthful correct_door n =
  let result = find_freedom_door ask_truthful correct_door in
  let verdict = if result = correct_door then "PASS" else "FAIL" in
  let who = if ask_truthful then "Truth-teller" else "Liar" in
  let door_letter = if correct_door = "Door A" then "A" else "B" in
  Printf.printf "Test %d: Door %s is safe, asked Guard = %s\n" n door_letter who;
  Printf.printf "  Algorithm outputs: %s\n" result;
  Printf.printf "  Expected: %s | %s\n\n" correct_door verdict

let () =
  Printf.printf "=== Two-Guard Riddle Algorithm (OCaml) ===\n\n";
  run_test false "Door B" 1;
  run_test true "Door A" 2;
  run_test false "Door A" 3;
  run_test true "Door B" 4
