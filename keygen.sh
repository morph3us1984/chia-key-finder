#!/bin/bash
number=$(echo $1)
echo -e "Number is $number\n\n"
cd ~ && cd chia-blockchain$number && . ./activate && cd ..
mkdir -p $HOME/keyfinder/keys_found

savekey(){
chia keys show --show-mnemonic-seed > $HOME/keyfinder/keys_found/key_$result.txt
}
savekeyaddress(){
chia keys show --show-mnemonic-seed > $HOME/keyfinder/keys_found/morph_key_$result.txt
}
i=$( ls $HOME/keyfinder/keys_found/ | wc -l )
#while true
main() {
cd ~ && cd chia-blockchain$number && . ./activate && cd ..
until [ "$i" -ge "1000" ]
do
FILE=$HOME/keyfinder/stop.file
if test -f "$FILE"; then
    echo "stopfile exists. exiting"
    exit
fi
random=$(openssl rand -hex 20)
echo "$random"
result=$(chia keys generate -l $random | grep "fingerprint" | cut -d " " -f 8)
echo "$result"
echo "$i Keys found with special patterns"
SUB0='1984'
SUB1='111111'
SUB2='222222'
SUB3='333333'
SUB4='444444'
SUB5='555555'
SUB6='666666'
SUB7='777777'
SUB8='888888'
SUB9='999999'
SUBZERO='000000'
SUB1976='1976'
SUBGEB='18031984'
SUBMORPH='morph'
#result="123400004321"
address=$(chia keys show | grep "$result" -A 4 | grep "First" | cut -d " " -f 4)
echo -e "\n\n\t\tAddress is $address\n\n"
case $result in

  *"$SUB0"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB1"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB2"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB3"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB4"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB5"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB6"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB7"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB8"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB9"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUBZERO"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUB1976"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
  *"$SUBGEB"*)
    echo -n -e "FOUND: Fingerprint with special pattern: $result \n" ; i++ ; savekey
    ;;
esac
echo "Looking for morph"
case $address in
  *"$SUBMORPH"*)
    echo -n -e "FOUND: First wallet address with special pattern: $address \n" ; i++ ; savekeyaddress
    ;;
esac
chia keys delete -f $result
i=$( ls $HOME/keyfinder/keys_found/ | wc -l )
done
}
main