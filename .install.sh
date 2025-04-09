#!/bin/bash

# Exibir mensagem inicial
echo "Iniciando a configuração dos dotfiles..."

# Atualizar o sistema (opcional)
echo "Atualizando o sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar dependências essenciais
echo "Instalando pacotes necessários..."
sudo apt install -y bspwm sxhkd polybar rofi git curl neovim dunst

# Clonar o repositório se não estiver local
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Clonando repositório de dotfiles..."
  git clone https://github.com/alanascanferla/dotfiles.git ~/dotfiles
fi

# Copiar arquivos de configuração para os diretórios corretos
echo "Copiando arquivos de configuração..."
cp -r ~/dotfiles/.config/* ~/.config/
cp ~/dotfiles/.bashrc ~/.bashrc
cp ~/dotfiles/.zshrc ~/.zshrc

# Configurar permissões (exemplo para o BSPWM)
echo "Configurando permissões para o bspwmrc..."
chmod +x ~/.config/bspwm/bspwmrc

# Finalizar
echo "Configuração concluída! Certifique-se de reiniciar o terminal ou iniciar o BSPWM com 'startx'."