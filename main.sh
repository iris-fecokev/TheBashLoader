#!/bin/bash

# TheBashTestLoader - Фейковый системный загрузчик (версия без bc)

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

# Функция прогресс-бара без bc
progress_bar() {
    local duration=$1
    local steps=50
    local step_delay=$(echo "$duration $steps" | awk '{printf "%.2f", $1/$2}')
    
    for ((i=0; i<=steps; i++)); do
        printf "\r[${BLUE}"
        for ((j=0; j<i; j++)); do printf "█"; done
        for ((j=i; j<steps; j++)); do printf "░"; done
        printf "${NC}] %d%%" $((i*2))
        sleep $step_delay
    done
    printf "\n"
}

# Основная функция
main() {
    clear
    echo -e "${GREEN}TheBashTestLoader v1.0${NC}"
    echo -e "${YELLOW}Initializing system...${NC}"
    echo ""
    
    echo -e "[1/6] Checking hardware..."
    sleep 0.8
    echo -e "   ${GREEN}✓${NC} CPU: OK"
    sleep 0.5
    echo -e "   ${GREEN}✓${NC} Memory: 16384MB OK"
    sleep 0.6
    echo -e "   ${GREEN}✓${NC} Storage: OK"
    echo ""
    
    echo -e "[2/6] Loading kernel modules..."
    progress_bar 3
    echo ""
    
    echo -e "[3/6] Initializing network..."
    sleep 1.2
    echo -e "   ${GREEN}✓${NC} Network interface: eth0"
    sleep 0.7
    echo -e "   ${GREEN}✓${NC} IP: 192.168.1.100"
    echo ""
    
    echo -e "[4/6] Starting system services..."
    progress_bar 4
    echo -e "   ${GREEN}✓${NC} Service: sshd"
    echo -e "   ${GREEN}✓${NC} Service: cron"
    echo -e "   ${GREEN}✓${NC} Service: syslog"
    echo ""
    
    echo -e "[5/6] Checking filesystems..."
    sleep 2.1
    echo -e "   ${GREEN}✓${NC} /dev/sda1: clean"
    echo -e "   ${GREEN}✓${NC} /dev/sda2: clean"
    echo ""
    
    echo -e "[6/6] Finalizing boot process..."
    progress_bar 2
    echo ""
    
    echo -e "${GREEN}System boot completed successfully!${NC}"
    echo -e "${YELLOW}Welcome to TheBashTestLoader environment${NC}"
    echo ""
    
    echo -n "bash-5.1$ "
    sleep 1
    echo "echo 'System ready for testing'"
    echo "System ready for testing"
}

main "$@"
