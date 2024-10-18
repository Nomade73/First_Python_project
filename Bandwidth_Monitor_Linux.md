## Bandwidth Monitor
 - Type of Challenge: Verify Coding Knowledge
 - Duration: 1/2 day
 - Challenge Type : Team - Continue with same team as the previous challenge-

Build a shell script that monitors network bandwidth usage on a system. It will track data sent and received through a specific network interface over a period of time, then display the results or log them to a file.


**Features**
1. Monitor traffic for a given network interface (e.g., eth0 or wlan0....).
2. Calculate data transmitted and received over a defined interval (e.g., every 5 minute).
3. Provide total bandwidth usage in bytes or kilobytes over time.
4. Log this data and provide average, maximum, and minimum usage.

## Explanation/ Пояснення:

## 1. Network interface
- **English**: This script monitors the specified network interface (e.g., eth0 for Ethernet or wlan0 for Wi-Fi), calculates the bytes sent and received over 5 minutes, and logs the data to a file.
- **Українською**: Цей скрипт моніторить зазначений мережевий інтерфейс (наприклад, eth0 для Ethernet або wlan0 для Wi-Fi), обчислює байти, надіслані та отримані за 5 хвилин, і записує дані у файл.

2. **English**: The ```get_data()``` function reads the transmitted and received bytes from the network interface's statistics files.
- **Українською**: Функція ```get_data()``` зчитує передані та отримані байти з файлів статистики мережевого інтерфейсу.

3. **English**: The script ```loops indefinitely```, checking bandwidth usage every 5 minutes and logging the results.
- **Українською**: Скрипт безкінечно повторює перевірку використання трафіку кожні 5 хвилин та записує результати.

## How to run the script:
Create a file with a ```.sh``` extension, for example, ```bandwidth_monitor_linux.sh```.
Paste the code provided above into the file.
1.Make the file executable:

```bash
chmod +x bandwidth_monitor_linux.sh
```

Run the script with administrator privileges (to access network statistics):

```bash
sudo ./bandwidth_monitor_linux.sh
```
## To stop the script:
Press ```Ctrl+C``` in the terminal to stop the script.

## What the script does:
Monitors the network interface and logs the amount of traffic every 5 minutes.
Compresses the log file if it exceeds 10MB to save disk space.

## Script

```bash

#!/bin/bash

# Network interface to monitor (e.g., eth0 for Ethernet or wlan0 for Wi-Fi)
# Мережевий інтерфейс для моніторингу (наприклад, eth0 для Ethernet або wlan0 для Wi-Fi)
INTERFACE="eth0"

# File to log bandwidth usage
# Файл для запису використання пропускної здатності
LOG_FILE="bandwidth_log.txt"

# Time interval between checks (in seconds), 5 minutes = 300 seconds
# Інтервал часу між перевірками (у секундах), 5 хвилин = 300 секунд
INTERVAL=300

# Display the current state of the network interface
# Вивести поточний стан мережевого інтерфейсу
echo "Monitoring interface $INTERFACE every $INTERVAL seconds..."
echo "Results will be saved to $LOG_FILE."
echo "Моніторинг інтерфейсу $INTERFACE кожні $INTERVAL секунд..."
echo "Результати будуть записані у файл $LOG_FILE."

# Function to read current transmitted and received data
# Функція для зчитування поточних переданих та отриманих даних
get_data() {
    # Reading received bytes
    # Зчитування отриманих байтів
    RX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/rx_bytes)  
    # Reading transmitted bytes
    # Зчитування переданих байтів
    TX_BYTES=$(cat /sys/class/net/$INTERFACE/statistics/tx_bytes)  
}

# Initialize initial values for comparison
# Ініціалізація початкових значень для порівняння
get_data
PREV_RX=$RX_BYTES
PREV_TX=$TX_BYTES

# Start monitoring loop
# Запуск циклу моніторингу
while true; do
    # Wait for the defined interval (e.g., 5 minutes)
    # Зачекайте вказаний інтервал (наприклад, 5 хвилин)
    sleep $INTERVAL

    # Get the current transmitted and received data
    # Отримати поточні передані та отримані дані
    get_data

    # Calculate the difference in transmitted and received bytes
    # Обчислення різниці у переданих та отриманих байтах
    RX_DIFF=$((RX_BYTES - PREV_RX))  
    TX_DIFF=$((TX_BYTES - PREV_TX))  

    # Log the results to the file
    # Записати результати у файл
    echo "$(date) - Received: $RX_DIFF bytes, Transmitted: $TX_DIFF bytes" >> "$LOG_FILE"
    echo "$(date) - Отримано: $RX_DIFF байт, Передано: $TX_DIFF байт" >> "$LOG_FILE"

    # Update the previous values for the next check
    # Оновити попередні значення для наступної перевірки
    PREV_RX=$RX_BYTES
    PREV_TX=$TX_BYTES

    # Display a message for the user
    # Вивести повідомлення для користувача
    echo "Monitoring in progress... Data logged."
    echo "Моніторинг виконується... Дані записані."

````
