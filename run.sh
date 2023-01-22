# TMD - Termux para devs
# Código de origem: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master

#---------------------------------------------------------------------------------
# Iniciando 
echo -e "\e[35;1m TMD - customizando o zsh...\e[0m"

# Este script verifica se o git está instalado no sistema. Caso não esteja, 
# ele faz a instalação do git usando o comando pkg install git -y. 
# Este script é útil para garantir que o git esteja disponível antes de continuar 
# com as operações do script, evitando erros. É importante lembrar de ler e entender 
# o script antes de executá-lo, pois ele faz modificações no sistema e pode causar 
# problemas se usado de forma inorreta.

if ! [ -x "$(command -v git)" ]; then
  echo 'Error: git is not installed.' >&2
  echo 'Installing git...'
  pkg install git -y
else
  echo -e "git ... \e[35;1m instalado!\033[0m"
fi

# Esse script verifica que o zsh já está instalado, caso contrário
# Ele efetua o procedimento de instalação do ZSH

if ! [ -x "$(command -v zsh)" ]; then
  echo 'Error: zsh is not installed.' >&2
  echo 'Installing zsh...'
  pkg install zsh -y
else
  echo -e "zsh ... \e[35;1m instalado!\033[0m"
fi

# Esse script verifica se o oh-my-zsh está inslado
# Caso não esteja, ele faz a instalação
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  echo "oh-my-zsh is not installed."
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else
  echo "oh-my-zsh is already installed."
fi


# Realizando o procedimento de clone e instalação\configuração dos recursos
if [ ! -d "$HOME/zsh-syntax-highlighting" ]; then
  echo -e "zsh syntaxe hig... \e[35;1m não está instalado!\031[0m"
  echo -e "Realizando \e[35;1minstalação...!\032[0m"
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
  echo "source ${(q-)PWD}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ${ZDOTDIR:-$HOME}/.zshrc
  echo "zsh-syntax-highlighting installed."
else
  echo -e "zsh-syntaxe-high... \e[35;1m OK\033[0m"
fi

if ! grep -q "zsh-syntax-highlighting" $HOME/.zshrc; then
  echo "Adding zsh-syntax-highlighting to .zshrc"
  echo "source ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> $HOME/.zshrc
  echo "zsh-syntax-highlighting added to .zshrc"
else
  echo "zsh-syntax-highlighting is already in .zshrc"
fi



# Configura o .zshrc

echo -e "\e[35;1m TMD - customização do ZSH concluída! Reinicie e seção para validar as alterações.\e[0m"
echo -e "\033[1;32mObrigado por instalar e configurar o zsh no Termux!\033[0m"
echo -e "\033[1;36mO zsh é uma ótima escolha para desenvolvedores.\033[0m"
echo -e "\033[1;31mAgradecemos pela escolha do Termux como seu ambiente de desenvolvimento!\033[0m"