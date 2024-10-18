# Network interface to monitor (e.g., Ethernet or Wi-Fi)
# Мережевий інтерфейс для моніторингу (наприклад, Ethernet або Wi-Fi)
$Interface = "Ethernet"

# File to log bandwidth usage
# Файл для запису використання пропускної здатності
$LogFile = "C:\bandwidth_log.txt"

# Time interval between checks (in seconds), 5 minutes = 300 seconds
# Інтервал часу між перевірками (у секундах), 5 хвилин = 300 секунд
$Interval = 300

# Display the current state of the network interface
# Вивести поточний стан мережевого інтерфейсу
Write-Host "Monitoring interface $Interface every $Interval seconds..."
Write-Host "Results will be saved to $LogFile."
Write-Host "Моніторинг інтерфейсу $Interface кожні $Interval секунд..."
Write-Host "Результати будуть записані у файл $LogFile."

# Function to read current transmitted and received data
# Функція для зчитування поточних переданих та отриманих даних
function Get-Data {
    $stats = Get-NetAdapterStatistics -Name $Interface
    return $stats
}

# Initialize initial values for comparison
# Ініціалізація початкових значень для порівняння
$PrevStats = Get-Data
$PrevRxBytes = $PrevStats.ReceivedBytes
$PrevTxBytes = $PrevStats.SentBytes

# Start monitoring loop
# Запуск циклу моніторингу
while ($true) {
    # Wait for the defined interval (e.g., 5 minutes)
    # Зачекайте вказаний інтервал (наприклад, 5 хвилин)
    Start-Sleep -Seconds $Interval

    # Get the current transmitted and received data
    # Отримати поточні передані та отримані дані
    $CurrentStats = Get-Data

    # Calculate the difference in transmitted and received bytes
    # Обчислення різниці у переданих та отриманих байтах
    $RxDiff = $CurrentStats.ReceivedBytes - $PrevRxBytes
    $TxDiff = $CurrentStats.SentBytes - $PrevTxBytes

    # Log the results to the file
    # Записати результати у файл
    $logEntry = "$(Get-Date) - Received: $RxDiff bytes, Transmitted: $TxDiff bytes"
    Add-Content -Path $LogFile -Value $logEntry

    # Display a message for the user
    # Вивести повідомлення для користувача
    Write-Host $logEntry
    Write-Host "Monitoring in progress... Data logged."
    Write-Host "Моніторинг виконується... Дані записані."

    # Update the previous values for the next check
    # Оновити попередні значення для наступної перевірки
    $PrevRxBytes = $CurrentStats.ReceivedBytes
    $PrevTxBytes = $CurrentStats.SentBytes
}

