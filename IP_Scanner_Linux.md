## IP Scanner
- Type of Challenge: Verify Coding Knowledge
- Duration: 1/2 day
- Challenge Type : Team - Continue with same team as the previous challenge

Create a script that will scan an IP in different ways, as follows. Take the IP as input from the user.

## Whois Lookup
- Do a whois on the IP and print the following: netname, descr, country, role, abuse-mailbox.
## Reverse DNS Lookup
- Do a reverse DNS lookup in the IP and print the domain name(s).
## HTTP(S) Query
- Do a HTTP query and print the response code (if any).
- Do a HTTPS query and print the response code (if any).
## GeoLocation
- Use a geolocation API to fetch additional information about the IP's physical location.
- Print and display details such as city, region, and country, if applicable.
  

## Explanation/Пояснення:

- **English**: The script asks the user to input an IP address and then performs several tasks: Whois lookup, Reverse DNS lookup, HTTP/HTTPS queries, and geolocation lookup.
- **Українською**: Скрипт запитує у користувача IP адресу і виконує кілька завдань: запит Whois, зворотний DNS запит, HTTP/HTTPS запити та визначення геолокації.

## Whois Lookup
- **English**: The function ```whois_lookup()``` performs a Whois query using the whois command and extracts key details such as ```netname, description, country, role, and abuse-mailbox```.
- **Українською**: Функція ```whois_lookup()``` виконує запит Whois за допомогою команди whois та витягує основні дані, такі як ```netname, опис, країну, роль і abuse-mailbox```.

## Reverse DNS Lookup
- **English**: The function ```reverse_dns_lookup()``` uses dig to perform a reverse DNS lookup to find domain names associated with the IP.
- **Українською**: Функція ```reverse_dns_lookup()``` використовує команду dig для виконання зворотного DNS запиту, щоб знайти доменні імена, пов'язані з IP.

## HTTP(S) Query
- **English**: The ```functions http_query()``` and ```https_query()``` use curl to make HTTP and HTTPS requests to the IP and print the HTTP status code (such as 200 for success).
- **Українською**: Функції ```http_query()``` та ```https_query()``` використовують команду curl для здійснення HTTP та HTTPS запитів до IP і виводять код відповіді (наприклад, 200 для успішного запиту).

## GeoLocation
- **English**: The ```geolocation_lookup()``` function uses a free geolocation API (ip-api.com) to retrieve and display the city, region, and country associated with the IP.
- **Українською**: Функція ```geolocation_lookup()``` використовує безкоштовний API геолокації (ip-api.com), щоб отримати і відобразити місто, регіон та країну, пов'язані з IP.


## How script is work/ Як запустити цей скрипт:
1. Create a file with a ```.sh``` extension, for example ```ip_scanner.sh```, aste the code provided above into the file.
2. Make the file executable:
    
```bash
chmod +x ip_scanner_linux.sh
```

4. Run the script with administrator privileges (to access network statistics):
 
```bash
./ip_scanner_linux.sh
```

## To stop the script:
Press ```Ctrl+C``` in the terminal to stop the script.

## What the script does:
This script will help you perform several types of scans for an IP address, including Whois lookup, reverse DNS lookup, HTTP/HTTPS lookup, and geolocation.

```
#!/bin/bash

# Get the IP address from the user
# Отримуємо IP адресу від користувача
read -p "Enter the IP address to scan: " IP_ADDRESS

# Function for Whois Lookup
# Функція для Whois запиту
whois_lookup() {
    echo "Performing Whois lookup for $IP_ADDRESS..."
    # Виконуємо Whois запит
    whois_output=$(whois $IP_ADDRESS)
    echo "Netname: $(echo "$whois_output" | grep -i "netname")"
    echo "Description: $(echo "$whois_output" | grep -i "descr")"
    echo "Country: $(echo "$whois_output" | grep -i "country")"
    echo "Role: $(echo "$whois_output" | grep -i "role")"
    echo "Abuse-mailbox: $(echo "$whois_output" | grep -i "abuse-mailbox")"
}

# Function for Reverse DNS Lookup
# Функція для зворотного DNS запиту
reverse_dns_lookup() {
    echo "Performing Reverse DNS lookup for $IP_ADDRESS..."
    # Виконуємо зворотний DNS запит
    domain_name=$(dig -x $IP_ADDRESS +short)
    if [ -z "$domain_name" ]; then
        echo "No domain name found for this IP."
    else
        echo "Domain name: $domain_name"
    fi
}

# Function for HTTP Query
# Функція для HTTP запиту
http_query() {
    echo "Performing HTTP query for $IP_ADDRESS..."
    # Виконуємо HTTP запит
    response_code=$(curl -o /dev/null -s -w "%{http_code}" http://$IP_ADDRESS)
    echo "HTTP Response Code: $response_code"
}

# Function for HTTPS Query
# Функція для HTTPS запиту
https_query() {
    echo "Performing HTTPS query for $IP_ADDRESS..."
    # Виконуємо HTTPS запит
    response_code=$(curl -o /dev/null -s -w "%{http_code}" https://$IP_ADDRESS)
    echo "HTTPS Response Code: $response_code"
}

# Function for GeoLocation
# Функція для геолокації
geolocation_lookup() {
    echo "Performing Geolocation lookup for $IP_ADDRESS..."
    # Використання безкоштовного API для визначення геолокації
    location_info=$(curl -s "http://ip-api.com/json/$IP_ADDRESS")
    city=$(echo $location_info | jq -r '.city')
    region=$(echo $location_info | jq -r '.regionName')
    country=$(echo $location_info | jq -r '.country')
    
    echo "City: $city"
    echo "Region: $region"
    echo "Country: $country"
}

# Main script execution
# Основна частина скрипту
whois_lookup
reverse_dns_lookup
http_query
https_query
geolocation_lookup

```
