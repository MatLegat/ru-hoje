# copyright Matteus Legat 2016
#
# script que mostra o cardápio do RU UFSC de hoje
#

declare html=$(curl -s --compressed http://ru.ufsc.br/ru/)


# mostra somente dia atual se não for passado o parâmetro `all`
[ "$1" != "all" ] && [ "$1" == "" ] && declare weekday=`LANG=pt_BR.UTF-8 date +%a`

# mostra data passada por parâmetro
[ "$1" != "all" ] && [ "$1" != "" ] && declare weekday=$1


# pega somente o conteúdo da tabela do cardápio
declare menu_itself=$(echo -e "$html" | sed -n '/Sobremesa/,/Ingredientes/p' | sed -e '1d;$d')


                          #pega apenas dia da semana          # remove tags      # remove linhas e inicios em branco
echo -e "$menu_itself" | sed -n "/${weekday^} */,/<\/tr>/p" | sed -e 's/<[^>]*>//g;/^ *[&nbsp;]*$/d;s/^[ * *\t]*//'


