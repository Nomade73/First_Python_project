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
