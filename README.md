# First_Python_project

## Python : Create a port scanner

- Type of Challenge: `Verify Coding Knowledge` 
- Duration: `2 days`
- Challenge Type : `Team`

### Prerequisites

1. Identify libraries required.
2. Learn about ARP (Address Resolution Protocol) and ICMP (Internet Control Message Protocol) protocols used for scanning. 
3. Learn about TCP SYN scan for identifying open ports.
4. Creating a range of IP addresses within your local network subnet.
5. Understand ethical considerations and limited testing.
6. Understanding how you can detect port scanning.
7. Understanding how software design reports are written.


### To Do

1. Write the code to create a port scanner in Python.
2. Implement error handling and input validation to ensure the program handles unexpected scenarios gracefully.
2. Test the port scanner on localhost and a remote host to verify its functionality.(Note: Remote host must be within a subnet created with VMs)
3. Write a detailed software designing report.
4. Write a testing report.
5. Write a report on ethical considerations and whether you have complied to the condideration.
6. Write a report on how detection of port scanning can be achieved.

### Bonus

7. Enhance the port scanner with basic security measures, such as rate limiting to prevent excessive scanning.
8. Implement logging functionality to record scan results and any errors encountered.
9. Review the code for potential security vulnerabilities and apply best practices for secure coding.
10. Include the enhancements in the report.

### To Document

11. Planing.
12. Issues/Constraints.
13. Coding Considerations.
14. Properly Documented Code.

## Extra 

## 1. IP Scanner
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


 ## 2. Bandwidth Monitor
 - Type of Challenge: Verify Coding Knowledge
 - Duration: 1/2 day
 - Challenge Type : Team - Continue with same team as the previous challenge-

Build a shell script that monitors network bandwidth usage on a system. It will track data sent and received through a specific network interface over a period of time, then display the results or log them to a file.


**Features**
1. Monitor traffic for a given network interface (e.g., eth0 or wlan0....).
2. Calculate data transmitted and received over a defined interval (e.g., every 5 minute).
3. Provide total bandwidth usage in bytes or kilobytes over time.
4. Log this data and provide average, maximum, and minimum usage.
