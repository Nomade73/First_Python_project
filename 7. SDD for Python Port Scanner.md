## 1. Introduction

### 1.1 Purpose
The purpose of this document is to provide a detailed software design description for a Python-based port scanner. The scanner will be designed to scan a range of ports on a given target within a network, determine which ports are open, and report their status. The system will be implemented with basic security measures, error handling, and logging capabilities.

### 1.2 Scope
This software design focuses on developing a basic port scanner using the Python programming language. The scanner will operate by sending TCP SYN requests to a range of ports and will determine if the ports are open or closed. The primary environment for testing will include localhost and two virtual machines (VMs) set up in a network with the IP range 192.168.100.0/24.

The project will also address ethical considerations and include detailed documentation, testing, and security reports.

### 1.3 Definitions, Acronyms, and Abbreviations
1. **Port Scanner**: A software application that checks if ports on a target machine are open or closed.
2. **TCP SYN Scan**: A method to determine whether a port is open by sending a SYN packet and waiting for a response.
3. **ICMP**: Internet Control Message Protocol, used for diagnostics like pinging devices.
4. **ARP**: Address Resolution Protocol, used to resolve an IP address to a MAC address in local networks.
5.**VM**: 2 Virtual Machines, used for remote host testing in a controlled environment.

### 1.4 References
- Python Documentation: https://docs.python.org/3/
- Python Socket Library: https://docs.python.org/3/library/socket.html
- ChatGPT
- YouTube
  
## 2. System Overview

### 2.1 System Functionality
The system is designed to scan ports on a specified IP address and determine if they are open or closed by attempting a connection using TCP SYN scanning. The scanner will:
- Take user input for the target IP address, start port, and end port.
- Attempt to establish connections with the target machine on each port within the specified range.
- Report whether the port is open or closed based on the connection attempt.
- Implement error handling for timeouts, invalid inputs, and unexpected issues.
  
### 2.2 Target Environment
1. **Localhost Testing**: The scanner will first be tested on the local machine using the loopback address 127.0.0.1.
2. **Virtual Machine Testing**: The scanner will be tested on two virtual machines with IP addresses in the 192.168.100.0/24 subnet. These machines will simulate a real network environment.

## 3. Planning

## 3.1 Libraries Required
**socket**: The socket library in Python is used to create TCP connections to test port availability.

### 3.2 Protocols Used
- **TCP SYN Scan**: Sends a SYN (synchronize) packet to a target port and waits for a response. If the target responds with a SYN-ACK, the port is considered open.
- **ARP**: Address Resolution Protocol is essential in resolving IP addresses to MAC addresses, helping establish connections on the same local network.
- **ICMP**: This protocol is often used for diagnostic tools like ping and helps ensure the target machine is reachable.

## 4. Issues/Constraints

### 4.1 Ethical Considerations
**Authorization**: The scanner should only be used on networks or machines where the user has explicit permission to conduct scanning. Unauthorized scanning can be considered illegal and could result in legal consequences.

**Controlled Environment**: Testing will be restricted to localhost and virtual machines under the user's control to avoid unauthorized access or detection by intrusion detection systems (IDS).

### 4.2 Resource Constraints
**Network Traffic**: Scanning multiple ports across various IP addresses can generate significant traffic, which could be detected as malicious activity by firewalls or IDS.

**Performance**: For large port ranges or multiple IP addresses, scanning may take a considerable amount of time. A timeout is necessary to avoid hanging on unresponsive ports.

## 5. Coding Considerations

### 5.1 Input Validation
**IP Address Validation**: The system should validate that the provided IP address is valid and reachable. Invalid IP addresses can cause the scanner to fail.

**Port Range Validation**: The system should ensure that the user provides a valid port range, where the start port is less than or equal to the end port, and both ports are within the valid range (0-65535).

### 5.2 Error Handling
The system should handle various exceptions that might occur during scanning:
1. **Timeouts**: If a port does not respond within a specified time, it should be marked as closed, and the scanner should proceed without crashing.
2. **Invalid Inputs**: The system should prompt users with appropriate error messages if the IP address or port range is invalid.
3. **Network Issues**: In case of network disconnection or other unexpected issues, the system should safely handle the failure and exit gracefully.
   
### 5.3 Performance
**Connection Timeout**: To prevent the system from hanging on unresponsive ports, each connection attempt should have a short timeout (e.g., 0.1 seconds).
**Port Range Efficiency**: Efficient looping should be used to scan the ports within the provided range.

## 6. System Architecture

### 6.1 Functions and Components
**scan_ports(host, start_port, end_port)**: This function is responsible for scanning the ports between the specified start and end ports on the target IP address (host). It uses the socket library to create a connection to each port and determine if the port is open.

### 6.2 Workflow
- The user inputs the target IP address and port range.
- The system validates the IP address and port range.
- The system loops through the ports in the specified range and attempts a connection.
- Each port's status is printed as either "open" or "closed."
- If an error occurs (e.g., timeout, invalid IP), the system handles it gracefully and continues scanning the remaining ports.

### 6.3 System Setup
**Localhost**: The initial test will be conducted on 127.0.0.1, scanning ports in the range 500-1024.
**VM Testing**: The system will then be tested in a virtual environment on a remote host with an IP in the 192.168.100.0/24 subnet.

## 7. Testing

### 7.1 Test Environment
**Localhost**: The scanner will be tested on 127.0.0.1 to ensure it can detect open ports on the local machine.
**Remote VM Testing**: Two virtual machines will be set up in the 192.168.100.0/24 subnet. The scanner will be tested on one VM scanning the other to ensure that remote scanning is functional.

### 7.2 Test Cases
**Localhost Scan**: Scan the localhost IP (127.0.0.1) for ports in the range 500-1024. Verify that open ports are accurately detected.
**Remote Scan**: Scan the remote host within the VM subnet for open ports in the same range. Ensure that the system correctly identifies open and closed ports on the remote machine.

## 8. Ethical Considerations
**Limited Testing**: Scanning is restricted to authorized environments, such as the localhost and VMs.
**Detectability**: Systems with intrusion detection systems (IDS) can detect port scanning. The system should only be used in an environment where this detection is not problematic.
**Compliance**: Ensure that all testing is done in compliance with legal and ethical guidelines. Unauthorized scanning can be classified as hacking and should be avoided.

## 9. Enhancements

### 9.1 Security Measures
Rate Limiting: Implementing a delay between port scans to prevent excessive scanning and reduce the risk of detection.
Logging: Adding a logging mechanism to store the results of the scan (e.g., which ports are open or closed) along with timestamps.

### 9.2 Secure Coding
Review the code for vulnerabilities that could allow input validation attacks (e.g., malicious IP addresses) or unhandled exceptions.

## 10. Properly Documented Code
The code will be well-documented with comments explaining each function and line of code.

```python
import socket

# Function to scan ports 
def scan_ports(host, start_port, end_port):
    print(f"Scanning ports {start_port} to {end_port} on {host}...")
    """ Scans a range of ports on the specified host.
    
    Args:
        host (str): Target IP address.
        start_port (int): First port in the range.
        end_port (int): Last port in the range.
    
    Returns:
        None: Prints the status of each port (open/closed).
    """
    # Loop through the specified range of ports
    for port in range(start_port, end_port + 1):
        # Create a new socket
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(0.1) # Set a timeout for each connection attempt
            result = s.connect_ex((host, port)) # Try to connect to the port 

            # If the connection was successful 
            if result ==  0: # Port is open
                print(f"Port {port}: OPEN") 
            else: # Port is closed
                print(f"Port {port}: CLOSED")


if __name__ == "__main__":
    #Scan localhost for ports in the range 1-1024
    host = "127.0.0.1"
    start_port = 500
    end_port = 1024
    scan_ports(host, start_port, end_port)
```

### 11. Conclusion
This SDD outlines the design and functionality of a Python-based port scanner. The system is designed to scan ports efficiently and safely, with built-in error handling and ethical considerations. The project also includes potential enhancements such as rate limiting and logging for better performance and security. Testing will be conducted in a controlled environment with VMs to ensure compliance with ethical standards.
