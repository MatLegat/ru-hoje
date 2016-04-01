# copyright Matteus Legat 2016
#
# script que mostra o cardápio do RU UFSC de hoje
#

wget http://ru.ufsc.br/ru/ -q -O /tmp/ru.gz
gunzip -d /tmp/ru.gz &> /dev/null
mv -f /tmp/ru.gz /tmp/ru.html &> /dev/null
mv -f /tmp/ru /tmp/ru.html &> /dev/null

declare weekday=`date +%u`

case "$weekday" in
	1) weekday="Segunda-feira";;
	2) weekday="Terça-feira";;
	3) weekday="Quarta-feira";;
	4) weekday="Quinta-feira";;
	5) weekday="Sexta-feira";;
	6) weekday="Sabado";;
	7) weekday="Domingo";;
esac

declare beginsearch="<td><strong><span style=\"color: #333399\">$weekday"

cat /tmp/ru.html | sed -n "/$beginsearch/,/<\/tr>/p" | sed -e 's/<[^>]*>//g' | sed '/^ *[&nbsp;]*$/d'


rm /tmp/ru /tmp/ru.gz /tmp/ru.html &> /dev/null
