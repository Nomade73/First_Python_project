## Explanation:
- **Network Interface**: Select the network interface you want to monitor, such as ```eth0 (Ethernet)``` or ```wlan0 (Wi-Fi)```. The interface is configured with the ```INTERFACE variable```.
- **Log File**: The script logs traffic data (received and transmitted bytes) every 5 minutes (300 seconds) into a file called ```bandwidth_usage.log```.
- **Log Size Limit**: If the log file size exceeds 10MB, the file will be automatically compressed and renamed with the current date in the filename.
- **Monitoring Function**: The script runs in an infinite loop, continuously updating the amount of data received and transmitted, and logs it to a file. Each log entry is timestamped.

## Пояснення:
**Мережевий інтерфейс**: Виберіть інтерфейс, який ви хочете моніторити, наприклад, eth0 (Ethernet) або wlan0 (Wi-Fi). Інтерфейс налаштовується змінною INTERFACE.
**Лог-файл**: У скрипті ведеться запис трафіку (отриманих і переданих байтів) кожні 5 хвилин (300 секунд) у файл bandwidth_usage.log.
**Обмеження логу**: Якщо розмір файлу логу перевищить 10 МБ, файл автоматично буде стиснутий та перейменований з датою у назві.
**Функція моніторингу**: Скрипт безкінечно працює у циклі, оновлюючи кількість отриманих та переданих даних і записуючи їх у файл. Кожен запис фіксується у форматі дати та часу.

## How to run the script:
Create a file with a ```.sh``` extension, for example, ```bandwidth_monitor.sh```.
Paste the code provided above into the file.
1.Make the file executable:

```bash
chmod +x bandwidth_monitor.sh
```

Run the script with administrator privileges (to access network statistics):

```bash
sudo ./bandwidth_monitor.sh
```
