#!/bin/sh
#### CONFIG PROXMOX 6.0 
#        version:"1.0"
#        maintainer:paulo_bortoloto@outlook.com
#                   github.com/fenixinfo/conf-linux
#####################################################################

T="sleep 2"
T2="sleep 1"
echo "INICIALIZANDO AJUSTES E ATUALIZAÇÃO PROXMOX"
echo "INECIALIZANDO..."
$T 
echo "REMOVENDO SUBSCRIÇÃO (pve-enterprise.list)"
rm -rf /etc/apt/sources.list.d/pve-enterprise.list
$T2
echo "..........................ok"
echo "ADICIONANDO REPOSITORIO"
echo deb http://download.proxmox.com/debian/pve buster pve-no-subscription >> /etc/apt/sources.list
$T2
echo "..........................ok"
echo "ATUALIZANDO DITETORIO E INSTALAÇÃO"
apt update && apt upgrade -y && apt clean
$T2
echo "..........................ok"
echo "ATUALIZANDO TEMPLETES"
pveam update
$T2
echo "..........................ok"
echo "INSTALANDO PACOTES ADICIONAIS"
apt install -y curl vim  openvswitch-switch aptitude openssh-server net-tools rcconf iproute2 ntfs-3g tcpdump hdparm sshpass nfs-common nfs-kernel-server dnsutils postfix mutt gpgsm mailutils
$T2
echo "..........................ok"
echo "..........................ok"
echo "..........................ok"
echo "..........................ok"
echo "..........................ok"
echo "FIM"

