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

