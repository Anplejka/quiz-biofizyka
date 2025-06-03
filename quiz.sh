#!/bin/bash
echo "Witaj w grze edukacyjnej typu quiz!"
sleep 2
echo "Wczuj się w rolę studneta biofizyki, podejmującego próbę zdania egzaminu z biofizyki."
echo "================================================================================="
sleep 2
echo "Powodzenia!"
sleep 2
echo "3"
sleep 1
echo "2"
sleep 1
echo "1"
sleep 1
echo "0"
sleep 2
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
ask_question "Ile to jest 10 angstremów (Å)?" "0,1nm" "0,01µm" "1nm" "10^-10m" "C"
ask_question "Jaki jest symbol chemiczny wody?" "H2O" "O2" "CO2" "HCl" "A"
ask_question "Jaka jest najdłuższa faza cyklu komórkowego?" "G2" "G1" "S" "M" "B"
ask_question "Stężenie kinaz białkowych zależnych od cyklin (Cdk)..." "Zmienia się w zależności od fazy cyklu." "Rośnie pod czas mitozy." "Rośnie w trakcie interfazy." "Nie zależy od fazy cyklu komórkowego." "D"
ask_question "Stadium mitozy po rozpadzie otoczki jądrowej, gdy chromosomy przyłączają się do wrzeciona to:" "profaza" "anafaza" "prometafaza" "metafaza" "C"
ask_question "Które kompleksy translokacyjne współpracują ze sobą tworząc kanały do wnętrza mitochodrium?" "MIM 1 + SAM" "TIM22 + TIM23" "TOM + TIM22" "TIM23 + TOM" "D"
ask_question "Która sekwencja sygnałowa kieruje białko do jądra komórkowego?" "NLS" "PTS1" "SRP" "KDEL" "A"
ask_question "Wskaż fałszywe sformułowanie dotyczące funkcji peroksysomów." "Biorą udział w metabolizmie cholesterolu i kwasów żółciowych." "Detoksykacja alkoholu w wątrobie poprzez cytochrom P450" "Rozkładanie nadtlenku wodoru" "Synteza niektórych lipidów" "B"
ask_question "Wokół centrosomu koncentrycznie rozchodzą się..." "Mikrofilamenty" "Mikrotubule" "Septyny" "Filamenty pośrednie" "B"
ask_question "Nukleazy to enzymy które:" "Denaturują DNA" "Hydrolizują wiązania peptydowe" "Nacinają wiązanie fosfodiestrowe w kwasach nukleinowych" "Rozplatają dwuniciowe kwasy nukleinowe" "C"
ask_question "U jakiego gatunku w błonach komórkowch będzie więcej fosfolipidów nienasyconych?" "Wąż pustynny" "Bakteria termofilna" "Ryba arktyczna" "Niedźwiedź polarny" "C"
ask_question "Co przedstawia schemat Jabłońskiego?" "Cykl życiowy fluoroforu" "Szlak transportu elektronów w mitochondrium" "Przemiany energetyczne cząsteczek po absorpcji fotonu" "Przeskoki energetyczne kwasów nukleinowych" "C" 
echo "Twój końcowy wynik: $score"


