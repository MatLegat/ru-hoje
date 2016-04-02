# copyright Matteus Legat 2016
#
# script que mostra o cardápio do RU UFSC de hoje
#

declare html=$(curl -s --compressed http://ru.ufsc.br/ru/)

# mostra somente dia atual se não for passado o parâmetro `all`
[ "$1" != "all" ] && declare weekday=`date +%u`

case "$weekday" in
	1) weekday="Segunda-feira";;
	2) weekday="Terça-feira";;
	3) weekday="Quarta-feira";;
	4) weekday="Quinta-feira";;
	5) weekday="Sexta-feira";;
	6) weekday="Sábado";;
	7) weekday="Domingo";;
esac

declare beginsearch="<td>[<strong> *]*<span style=\"color: #333399\">$weekday"

                     # busca cardapio do(s) dia(s)    # remove tags     # remove linhas e inicios em branco
echo -e "$html" | sed -n "/$beginsearch/,/<\/tr>/p" | sed -e 's/<[^>]*>//g;/^ *[&nbsp;]*$/d;s/^[ * *\t]*//'


