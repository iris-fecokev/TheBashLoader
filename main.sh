#!/bin/bash

# TheBashTestLoader - Фейковый системный загрузчик
# Версия 1.0

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Функция для имитации случайных задержек
random_delay() {
    local min=$1
    local max=$2
    local duration=$(($RANDOM % ($max - $min + 1) + $min))
    sleep $(echo "scale=2; $duration/100" | bc)
}

# Функция прогресс-бара
progress_bar() {
    local duration=$1
    local steps=50
    local step_delay=$(echo "scale=2; $duration/$steps" | bc)
    
    for ((i=0; i<=steps; i++)); do
        printf "\r[${BLUE}"
        for ((j=0; j<i; j++)); do printf "█"; done
        for ((j=i; j<steps; j++)); do printf "░"; done
        printf "${NC}] %d%%" $((i*2))
        sleep $step_delay
    done
    printf "\n"
}

# Основная функция загрузки
main() {
    clear
    echo -e "${GREEN}TheBashTestLoader v1.0${NC}"
    echo -e "${YELLOW}Initializing system...${NC}"
    echo ""
    
    # Этап 1: Проверка оборудования
    echo -e "[1/6] Checking hardware..."
    random_delay 50 150
    echo -e "   ${GREEN}✓${NC} CPU: OK"
    random_delay 30 100
    echo -e "   ${GREEN}✓${NC} Memory: 16384MB OK"
    random_delay 40 120
    echo -e "   ${GREEN}✓${NC} Storage: OK"
    echo ""
    
    # Этап 2: Загрузка ядра
    echo -e "[2/6] Loading kernel modules..."
    progress_bar 3
    echo ""
    
    # Этап 3: Инициализация сети
    echo -e "[3/6] Initializing network..."
    random_delay 100 200
    echo -e "   ${GREEN}✓${NC} Network interface: eth0"
    random_delay 50 100
    echo -e "   ${GREEN}✓${NC} IP: 192.168.1.100"
    echo ""
    
    # Этап 4: Загрузка служб
    echo -e "[4/6] Starting system services..."
    progress_bar 4
    echo -e "   ${GREEN}✓${NC} Service: sshd"
    echo -e "   ${GREEN}✓${NC} Service: cron"
    echo -e "   ${GREEN}✓${NC} Service: syslog"
    echo ""
    
    # Этап 5: Проверка файловой системы
    echo -e "[5/6] Checking filesystems..."
    random_delay 150 300
    echo -e "   ${GREEN}✓${NC} /dev/sda1: clean"
    echo -e "   ${GREEN}✓${NC} /dev/sda2: clean"
    echo ""
    
    # Финальный этап
    echo -e "[6/6] Finalizing boot process..."
    progress_bar 2
    echo ""
    
    # Имитация загрузки системы
    echo -e "${GREEN}System boot completed successfully!${NC}"
    echo -e "${YELLOW}Welcome to TheBashTestLoader environment${NC}"
    echo ""
    
    # Фейковое приглашение командной строки
    echo -n "bash-5.1$ "
    sleep 1
    echo "echo 'System ready for testing'"
    echo "System ready for testing"
}

# Проверка наличия bc для дробных чисел
if ! command -v bc &> /dev/null; then
    echo "Error: bc command not found. Please install bc."
    exit 1
fi

# Запуск основного процесса
main "$@"
