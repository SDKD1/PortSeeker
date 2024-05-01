#!/bin/bash
 
#########################
# PORTSCAN SHELL SCRIPT #
#########################

COR_VERDE='\033[0;32m'
COR_AMARELA='\033[0;33m'
COR_VERMELHA='\033[0;31m'
COR_RESET='\033[0m'

if [ $# -ne 1 ]; then
    echo -e "${COR_AMARELA}++++++++++++++++++++++++++++++++++++++++++${COR_RESET}"
    echo -e "${COR_AMARELA}+${COR_RESET} ${COR_VERDE}PORTSCAN - SDKD1  |   www.InfraSec.com ${COR_AMARELA}|${COR_RESET}"
    echo -e "${COR_AMARELA}+----------------------------------------+${COR_RESET}"
    echo -e "${COR_AMARELA}+${COR_RESET} ${COR_VERMELHA}Modo de uso:${COR_RESET} $0 ${COR_VERDE}<endereço_IP>${COR_AMARELA} +${COR_RESET}"
    echo -e "${COR_AMARELA}+${COR_RESET} ${COR_VERMELHA}Exemplo uso:${COR_RESET} $0  192.168.0.1  ${COR_AMARELA}+${COR_RESET}"
    echo -e "${COR_AMARELA}++++++++++++++++++++++++++++++++++++++++++${COR_RESET}"
    exit 1
fi

IP=$1

check_port() {
    local response
    response=$(timeout 1 bash -c "</dev/tcp/$IP/$1" 2>/dev/null)
    if [ $? -eq 0 ]; then
        echo -e "${COR_VERDE}Porta $1 aberta${COR_RESET}"
    fi
}

#ALTERE O RANGE DE PORTAS CONFORME  NECESSÁRIO
for port in {1..1024}; do
    check_port $port &
done
wait
echo -e "${COR_AMARELA}Verificação concluída.${COR_RESET}"


############
# BY SDKD1 #
############
