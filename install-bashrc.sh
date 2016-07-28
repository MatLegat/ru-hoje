declare alias='alias ru="bash ~/.ru.sh"'
cp ru.sh ~/.ru.sh
chmod +x ~/.ru.sh
if grep -q "$alias" ~/.bashrc; then
  printf "Reinstalado / Atualizado"
else
	echo "$alias" >> ~/.bashrc
	echo "Para rodar o script com o comando 'ru', basta rodar 'source ~/.bashrc' para carregá-lo no shell atual."
fi
exit

