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

# Initialize values for total, average, min, and max tracking
TOTAL_RX=0
TOTAL_TX=0
MAX_RX=0
MAX_TX=0
MIN_RX=-1
MIN_TX=-1
COUNT=0

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

    # Update total usage
    TOTAL_RX=$((TOTAL_RX + RX_DIFF))
    TOTAL_TX=$((TOTAL_TX + TX_DIFF))

    # Increment the count (number of intervals)
    COUNT=$((COUNT + 1))

    # Update max and min usage for received data
    if [ $RX_DIFF -gt $MAX_RX ]; then
        MAX_RX=$RX_DIFF
    fi
    if [ $MIN_RX -eq -1 ] || [ $RX_DIFF -lt $MIN_RX ]; then
        MIN_RX=$RX_DIFF
    fi

    # Update max and min usage for transmitted data
    if [ $TX_DIFF -gt $MAX_TX ]; then
        MAX_TX=$TX_DIFF
    fi
    if [ $MIN_TX -eq -1 ] || [ $TX_DIFF -lt $MIN_TX ]; then
        MIN_TX=$TX_DIFF
    fi

    # Calculate average usage
    AVG_RX=$((TOTAL_RX / COUNT))
    AVG_TX=$((TOTAL_TX / COUNT))

    # Log the results to the file
    # Записати результати у файл
    echo "$(date) - Interval: $COUNT" >> "$LOG_FILE"
    echo "  Received: $RX_DIFF bytes, Transmitted: $TX_DIFF bytes" >> "$LOG_FILE"
    echo "  Total Received: $TOTAL_RX bytes, Total Transmitted: $TOTAL_TX bytes" >> "$LOG_FILE"
    echo "  Average Received: $AVG_RX bytes, Average Transmitted: $AVG_TX bytes" >> "$LOG_FILE"
    echo "  Max Received: $MAX_RX bytes, Max Transmitted: $MAX_TX bytes" >> "$LOG_FILE"
    echo "  Min Received: $MIN_RX bytes, Min Transmitted: $MIN_TX bytes" >> "$LOG_FILE"
    echo "---------------------------------------" >> "$LOG_FILE"

    # Update the previous values for the next check
    # Оновити попередні значення для наступної перевірки
    PREV_RX=$RX_BYTES
    PREV_TX=$TX_BYTES

    # Display a message for the user
    # Вивести повідомлення для користувача
    echo "Monitoring in progress... Data logged."
    echo "Моніторинг виконується... Дані записані."
done 
