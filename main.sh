#!/bin/bash

# TheBashTestLoader - Фейковый системный загрузчик
# Версия 2.0 - Улучшенная реалистичность

# Цвета для вывода
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

# Функция прогресс-бара
progress_bar() {
    local duration=$1
    local steps=50
    local step_delay=$(echo "scale=2; $duration/$steps" | awk '{print $1}')
    
    for ((i=0; i<=steps; i++)); do
        printf "\r[${BLUE}"
        for ((j=0; j<i; j++)); do printf "█"; done
        for ((j=i; j<steps; j++)); do printf "░"; done
        printf "${NC}] %d%%" $((i*2))
        sleep $step_delay
    done
    printf "\n"
}

# Функция для вывода системных сообщений
system_msg() {
    local timestamp=$(date +"%H:%M:%S")
    echo -e "${CYAN}[$timestamp]${NC} $1"
}

# Функция проверки оборудования
hardware_check() {
    system_msg "Starting hardware initialization sequence"
    sleep 0.8
    
    local devices=(
        "ACPI: Core subsystem"
        "CPU: Intel(R) Xeon(R) CPU E5-2697 v4 @ 2.30GHz"
        "Memory: Testing 65536MB"
        "PCI: Probing PCI hardware"
        "SATA: Link up 6.0 Gbps"
        "NVMe: Samsung SSD 960 PRO 512GB"
        "Network: Intel I219-LM Ethernet"
        "USB: USB 3.0 controller"
    )
    
    for device in "${devices[@]}"; do
        echo -e "   ${GREEN}✓${NC} $device"
        sleep 0.3
    done
    
    # Случайная ошибка (для реалистичности)
    if [ $((RANDOM % 5)) -eq 0 ]; then
        echo -e "   ${YELLOW}⚠${NC} USB device over current state"
        sleep 0.5
        echo -e "   ${GREEN}✓${NC} USB over current condition cleared"
    fi
}

# Функция загрузки ядра
kernel_load() {
    system_msg "Loading Linux kernel 5.15.0-91-generic"
    sleep 0.5
    
    local modules=(
        "ext4"
        "usbcore" 
        "uhci_hcd"
        "ehci_pci"
        "ahci"
        "nvme"
        "e1000e"
        "i915"
    )
    
    for module in "${modules[@]}"; do
        echo -e "   ${GREEN}[OK]${NC} Loaded module: $module"
        sleep 0.2
    done
    
    system_msg "Kernel command line: BOOT_IMAGE=/vmlinuz-5.15.0-91-generic root=/dev/mapper/debian--vg-root ro quiet splash"
    sleep 0.8
}

# Функция инициализации сети
network_init() {
    system_msg "Initializing network interfaces"
    sleep 0.7
    
    echo -e "   ${GREEN}✓${NC} eth0: Link is up - 1Gbps/Full"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} eth0: DHCP assigned 192.168.1.105/24"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} DNS: 192.168.1.1, 8.8.8.8"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} Gateway: 192.168.1.1"
    sleep 0.5
    
    system_msg "Testing network connectivity"
    sleep 1
    echo -e "   ${GREEN}✓${NC} Ping to gateway successful"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} Internet connectivity verified"
}

# Функция проверки файловой системы
filesystem_check() {
    system_msg "Running filesystem checks"
    sleep 1
    
    local mounts=(
        "/dev/nvme0n1p1: /boot/efi"
        "/dev/mapper/debian--vg-root: /"
        "/dev/mapper/debian--vg-var: /var"
        "/dev/mapper/debian--vg-tmp: /tmp"
        "/dev/mapper/debian--vg-home: /home"
    )
    
    for mount in "${mounts[@]}"; do
        echo -e "   ${GREEN}✓${NC} $mount: Clean, 1.2TB available"
        sleep 0.4
    done
    
    system_msg "Mounting filesystems"
    progress_bar 2
}

# Функция запуска системных служб
services_start() {
    system_msg "Starting system services"
    
    local services=(
        "systemd-journald: Journal service"
        "dbus: System message bus"
        "systemd-networkd: Network management"
        "systemd-resolved: DNS resolution"
        "ssh: OpenSSH server"
        "cron: Scheduled tasks"
        "rsyslog: System logging"
        "apparmor: Security framework"
        "polkit: Authorization framework"
        "accounts-daemon: User accounts"
    )
    
    for service in "${services[@]}"; do
        if [ $((RANDOM % 10)) -eq 0 ]; then
            echo -e "   ${YELLOW}[DELAYED]${NC} $service"
            sleep 0.8
            echo -e "   ${GREEN}[OK]${NC} $service"
        else
            echo -e "   ${GREEN}[OK]${NC} $service"
        fi
        sleep 0.3
    done
}

# Функция системного мониторинга
system_monitoring() {
    system_msg "Starting system monitoring"
    sleep 0.5
    
    echo -e "   ${GREEN}✓${NC} CPU: 4% load, 2.30GHz, 48°C"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} Memory: 8.2GB/64GB used"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} Storage: 245GB/1.2TB used"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} Network: eth0 124Kbps/87Kbps"
    sleep 0.3
    echo -e "   ${GREEN}✓${NC} Temperature: Normal"
    sleep 0.5
}

# Функция безопасности
security_init() {
    system_msg "Initializing security subsystems"
    
    local security_checks=(
        "AppArmor: Profiles loaded"
        "Firewall: UFW activated"
        "SSH: Key-based authentication"
        "Updates: Security patches current"
        "Audit: Audit daemon started"
        "Encryption: LUKS volumes mounted"
    )
    
    for check in "${security_checks[@]}"; do
        echo -e "   ${GREEN}✓${NC} $check"
        sleep 0.4
    done
    
    system_msg "Security scan completed - No threats detected"
}

# Основная функция загрузки
main() {
    clear
    echo -e "${GREEN}TheBashTestLoader v2.0${NC}"
    echo -e "${YELLOW}UEFI Firmware Initializing...${NC}"
    sleep 1.5
    
    # Этап 1: Инициализация оборудования
    echo -e "\n${PURPLE}[1/8] Hardware Initialization${NC}"
    hardware_check
    progress_bar 3
    
    # Этап 2: Загрузка ядра
    echo -e "\n${PURPLE}[2/8] Kernel Loading${NC}"
    kernel_load
    progress_bar 2
    
    # Этап 3: Ранняя инициализация
    echo -e "\n${PURPLE}[3/8] Early Userspace${NC}"
    system_msg "Setting up temporary filesystem"
    sleep 0.8
    system_msg "Loading initial ramdisk"
    progress_bar 2
    
    # Этап 4: Сеть
    echo -e "\n${PURPLE}[4/8] Network Configuration${NC}"
    network_init
    progress_bar 2
    
    # Этап 5: Файловая система
    echo -e "\n${PURPLE}[5/8] Filesystem Setup${NC}"
    filesystem_check
    progress_bar 3
    
    # Этап 6: Системные службы
    echo -e "\n${PURPLE}[6/8] System Services${NC}"
    services_start
    progress_bar 4
    
    # Этап 7: Безопасность
    echo -e "\n${PURPLE}[7/8] Security Initialization${NC}"
    security_init
    progress_bar 2
    
    # Этап 8: Финальная настройка
    echo -e "\n${PURPLE}[8/8] Final System Setup${NC}"
    system_monitoring
    system_msg "Setting hostname: debian-server"
    sleep 0.5
    system_msg "Configuring locales: en_US.UTF-8"
    sleep 0.5
    system_msg "Starting user sessions"
    progress_bar 3
    
    # Завершение загрузки
    echo -e "\n${GREEN}System boot completed successfully!${NC}"
    echo -e "${YELLOW}Boot time: 12.7s (firmware) + 8.3s (loader) + 15.2s (kernel) = 36.2s${NC}"
    echo -e "${CYAN}Debian GNU/Linux 11 (bullseye) - Kernel 5.15.0-91-generic x86_64${NC}"
    echo ""
    
    # Фейковое приглашение командной строки
    echo -n "debian-server login: "
    sleep 1.2
    echo "admin"
    sleep 0.8
    echo -n "Password: "
    sleep 1.5
    echo "********"
    sleep 0.5
    echo -e "${GREEN}Last login: Mon Jan 15 14:30:22 2024 from 192.168.1.50${NC}"
    echo ""
    echo -n "admin@debian-server:~$ "
    sleep 1
    echo "systemctl status --all"
    sleep 0.8
    echo -e "${GREEN}● systemd\n   State: running${NC}"
    echo -n "admin@debian-server:~$ "
    sleep 1
    echo "echo 'System fully operational'"
    echo "System fully operational"
}

# Проверка на Debian и запуск
if [ -f /etc/debian_version ]; then
    main "$@"
else
    echo "This loader is optimized for Debian systems"
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        main "$@"
    else
        echo "Aborted."
        exit 1
    fi
fi
