## Explanation/ Пояснення:
1. **Whois Lookup**: Performs a Whois lookup to retrieve details like netname, description, country, role, and abuse-mailbox.
1.1 **Whois запит**: Виконує Whois запит для отримання таких деталей, як netname, description, country, role, і abuse-mailbox.

2. **Reverse DNS Lookup**: Finds the domain name associated with the given IP address.
2.1 **Зворотний DNS запит**: Знаходить доменне ім'я, пов'язане з вказаною IP адресою.

3. **HTTP/HTTPS Query**: Performs an HTTP and HTTPS query to check the response code from the IP.
3.1 **HTTP/HTTPS запит**: Виконує HTTP та HTTPS запити для перевірки коду відповіді від IP.

4. **GeoLocation**: Uses a free API to retrieve information about the physical location (city, region, country) of the IP address.
4.1 **Геолокація**: Використовує безкоштовний API для отримання інформації про фізичне місцезнаходження IP адреси (місто, регіон, країна).

## How to run this script:
1. Open PowerShell.
2. Copy the code into a file and save it as ip_scanner_windows.ps1.
3. Run the script with the following command:
   
```powershell
.\ip_scanner.ps1
````

1. These scripts allow you to monitor network traffic and scan IP addresses using PowerShell on Windows.
2. Ці скрипти дозволяють здійснювати моніторинг мережевого трафіку та сканувати IP адреси, використовуючи PowerShell у Windows.

```powershell

# Get the IP address from the user
# Отримуємо IP адресу від користувача
$IP = Read-Host "Enter the IP address to scan"

# Function for Whois Lookup
# Функція для Whois запиту
function Whois-Lookup {
    Write-Host "Performing Whois lookup for $IP..."
    $whoisOutput = whois $IP
    Write-Host "Netname: $(echo $whoisOutput | Select-String 'netname')"
    Write-Host "Description: $(echo $whoisOutput | Select-String 'descr')"
    Write-Host "Country: $(echo $whoisOutput | Select-String 'country')"
    Write-Host "Role: $(echo $whoisOutput | Select-String 'role')"
    Write-Host "Abuse-Mailbox: $(echo $whoisOutput | Select-String 'abuse-mailbox')"
}

# Function for Reverse DNS Lookup
# Функція для зворотного DNS запиту
function Reverse-DNS-Lookup {
    Write-Host "Performing Reverse DNS lookup for $IP..."
    try {
        $reverseDNS = [System.Net.Dns]::GetHostEntry($IP)
        Write-Host "Domain name: $($reverseDNS.HostName)"
    } catch {
        Write-Host "No domain name found for this IP."
    }
}

# Function for HTTP Query
# Функція для HTTP запиту
function HTTP-Query {
    Write-Host "Performing HTTP query for $IP..."
    try {
        $response = Invoke-WebRequest -Uri "http://$IP" -UseBasicParsing
        Write-Host "HTTP Response Code: " $response.StatusCode
    } catch {
        Write-Host "No response from the HTTP server."
    }
}

# Function for HTTPS Query
# Функція для HTTPS запиту
function HTTPS-Query {
    Write-Host "Performing HTTPS query for $IP..."
    try {
        $response = Invoke-WebRequest -Uri "https://$IP" -UseBasicParsing
        Write-Host "HTTPS Response Code: " $response.StatusCode
    } catch {
        Write-Host "No response from the HTTPS server."
    }
}

# Function for GeoLocation
# Функція для геолокації
function GeoLocation-Lookup {
    Write-Host "Performing Geolocation lookup for $IP..."
    try {
        $locationInfo = Invoke-RestMethod -Uri "http://ip-api.com/json/$IP"
        Write-Host "City: " $locationInfo.city
        Write-Host "Region: " $locationInfo.regionName
        Write-Host "Country: " $locationInfo.country
    } catch {
        Write-Host "Unable to retrieve geolocation data."
    }
}

# Main script execution
# Основна частина скрипту
Whois-Lookup
Reverse-DNS-Lookup
HTTP-Query
HTTPS-Query
GeoLocation-Lookup

```
