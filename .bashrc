remove-old-kernels() { dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge; }
t() { todo.sh; }
upgrade() { sudo apt-get update && sudo apt-get -y upgrade; sudo apt-get dist-upgrade; }
mecp () { scp "$@" ${SSH_CLIENT%% *}:Desktop/; }
ucp (){ scp ${SSH_CLIENT%% *}:Desktop/upload/* .; }
rmount (){
mkdir -p ~/mnt/"$1"/"$2"
sshfs "$1":"$2" ~/mnt/"$1"/"$2"
}
nlocate(){
locate $1 | sed -n $2p
}
psgrep() { ps axuf | grep -v grep | grep "$@" -i --color=auto; }
fname() { find . -iname "*$@*"; }
lt() { ls -ltrsa "$@" | tail; }
cp-settings(){ ssh-copy-id $1; scp .bashrc $1:; scp .vimrc $1:; scp -r .vim $1:; scp .screenrc $1:;}
f(){ find . -iname $1 | head -1;  }

cowsay `fortune`
export PROMPT_COMMAND="history -a; history -n;"
set -o vi
set editing-mode vi
