shift $(($OPTIND -1))
log="$*"

if [[ -z $log ]] ; then
	echo "Você não inseriu nenhum .log"
    echo ""
	echo "./seelog.sh acess.log"
	exit 1
fi	

cat $log | cut -d " " -f 1 | sort | uniq -c | sort -un >> requests.txt

cat requests.txt

echo "Digite o ip do suspeito: "; read ip 
if [ -z "$ip" ]
then
      echo "O IP é NULO."
else

cat $log | grep "$ip" | grep "Nikto" >> nikto.txt

cat $log | grep "$ip" | grep "Nmap"  >> nmap.txt

fi