#!/bin/bash
score=0
ask_question() {
  question="$1"
  A="$2"
  B="$3"
  C="$4"
  D="$5"
  correct="$6"

  echo "$question"
  echo "A) $A"
  echo "B) $B"
  echo "C) $C"
  echo "D) $D"
  echo

  echo "Wpisz A/B/C/D lub S, aby ściągnąć:"
  read -r answer

  if [[ "$answer" == "S" || "$answer" == "s" ]]; then
    echo "Ściągnąłeś"
    sleep 1
    echo "Poprawna odpowiedź to: $correct"

    rand=$((RANDOM % 4))
    if [[ $rand -eq 0 ]]; then
      echo "Przyłapano cię na ściąganiu."
      echo "KONIEC GRY"
      exit
    else
      echo "Grasz dalej"
      score=$((score + 1))
    fi

  elif [[ "$answer" == "$correct" || "$answer" == "${correct,,}" ]]; then
    echo "To poprawna odpowiedź"
    score=$((score + 1))
  else
    echo "To zła odpowiedź"
    echo "KONIEC GRY"
    echo "Twój wynik: $score"
    exit
  fi
}
ask_question "Ile to 2 + 2?" "3" "4" "5" "6" "B"
ask_question "Jaki jest symbol chemiczny wody?" "H2O" "O2" "CO2" "HCl" "A"

echo "Twój końcowy wynik: $score"


