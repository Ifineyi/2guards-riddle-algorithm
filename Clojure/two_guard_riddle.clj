;; Two-Guard Riddle Algorithm - Clojure implementation
;; Usage: clojure -M two_guard_riddle.clj

(ns two-guard-riddle)

(defn choose-correct-door [asked-guard-is-truthful correct-door]
  (let [other-guard-is-truthful (not asked-guard-is-truthful)
        other-guard-response (if other-guard-is-truthful
                              correct-door
                              (if (= correct-door "Door A") "Door B" "Door A"))
        final-response (if asked-guard-is-truthful
                         other-guard-response
                         (if (= other-guard-response "Door A") "Door B" "Door A"))]
    (if (= final-response "Door A") "Door B" "Door A")))

(defn run-test [asked correct n]
  (let [result (choose-correct-door asked correct)
        who (if asked "Truth-teller" "Liar")
        letter (if (= correct "Door A") "A" "B")
        verdict (if (= result correct) "PASS" "FAIL")]
    (println (str "Test " n ": Door " letter " is safe, asked Guard = " who))
    (println (str "  Algorithm outputs: " result))
    (println (str "  Expected: " correct " | " verdict))
    (println)))

(defn -main []
  (println "=== Two-Guard Riddle Algorithm (Clojure) ===")
  (println)
  (run-test false "Door B" 1)
  (run-test true "Door A" 2)
  (run-test false "Door A" 3)
  (run-test true "Door B" 4))

(-main)
