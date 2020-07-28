#!/bin/sh
T="sleep 2"
T2="sleep 1"
echo "inicializando atualização sistema......."
$T
apt update && apt -y upgrade && apt clean
echo "baixando agente......."
$T
wget https://repo.zabbix.com/zabbix/4.2/debian/pool/main/z/zabbix-release/zabbix-release_4.2-1+buster_all.deb
echo "Instalando sistema........"
$T
apt install -y ./zabbix-release_4.2-1+buster_all.deb 
apt update
apt install -y zabbix-agent
$T
echo "Instalação OK"
systemctl restart zabbix-agent
systemctl status zabbix-agent.service | grep active
$T
echo "..........................................OK"
echo "..........................................OK"
echo "..........................................OK"
echo "Configurar ips do Server e Hostname /etc/zabbix/zabbix_agentd.conf"
