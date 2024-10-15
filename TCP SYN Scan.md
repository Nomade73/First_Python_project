### Step 3: Learning TCP SYN Scans

A **TCP SYN scan** is one of the most common and efficient methods for **identifying open ports** on a target machine. It’s widely used because of its speed and stealth compared to other port scanning techniques. Here's a detailed explanation:

### 1. What is TCP SYN Scan?
- **Purpose**: A TCP SYN scan is used to determine the status of a port on a target device—whether it is **open, closed,** or **filtered** . This scan is part of the three-way TCP handshake process, but it doesn’t complete the handshake, which is why it's often referred to as a **half-open scan** .
- **TCP Handshake**: Normally, when two systems communicate over TCP, they establish a connection using a three-way handshake:

![Alt text](https://www.hackercoolmagazine.com/wp-content/uploads/2023/09/Port_scanning_techniques_2.jpg)

 1. **SYN**: The client sends a SYN (synchronize) packet to the server to initiate the connection.
 2. **SYN-ACK**: If the server is listening on the port (open), it responds with a SYN-ACK (synchronize-acknowledge).
 3. **ACK**: The client acknowledges the SYN-ACK, and the connection is established.
In a TCP SYN scan, the client (the scanner) only sends the first SYN packet and doesn’t complete the full handshake, making it faster and stealthier than a full connection scan.

### 2. How a TCP SYN Scan Works
Here’s the basic process of how a TCP SYN scan is performed:

![Alt text](https://www.hackercoolmagazine.com/wp-content/uploads/2023/09/TCP_SYN_Scan.jpg)

 1. **SYN Packet Sent**: The scanning device sends a SYN packet to a target IP and port.
 2. **Response Received**: The scanner waits for a response:
 - **SYN-ACK (Open Port)**: If the port is open, the target responds with a SYN-ACK packet, indicating it's ready to establish a connection.
 - **RST (Closed Port)**: If the port is closed, the target responds with a TCP reset (RST) packet, indicating the port is not available.
 - **No Response (Filtered Port)** : If the target doesn’t respond at all, it’s possible that the port is filtered by a firewall or the traffic is being dropped for security reasons.
No ACK Sent: Instead of completing the handshake by sending an ACK packet, the scanner sends an RST packet to abort the connection after receiving the SYN-ACK. This way, a full connection is never established, keeping the scan stealthy.

### 3. Why Use a TCP SYN Scan?
- **Speed**: TCP SYN scans are faster than other types of scans (such as TCP Connect scans), because they don’t require the full three-way handshake.
- **Stealthiness**: Since a TCP SYN scan doesn’t complete the handshake, it can be less detectable by security systems. Firewalls and intrusion detection systems (IDS) might miss this type of scan because it doesn’t establish a full connection.
- **Efficiency**: It consumes fewer system resources than a full connection scan. For example, with a TCP Connect scan (which completes the full handshake), the system has to allocate resources to establish and tear down a connection for every scanned port. A TCP SYN scan avoids this overhead.

### 4. Interpreting the Results of a TCP SYN Scan
- **Open Port (SYN-ACK Response)**: If you receive a SYN-ACK response from the target, it means the port is open and accepting connections.
- **Closed Port (RST Response)**: If the target sends back an RST packet, the port is closed, and no connection can be established.
- **Filtered Port (No Response or ICMP)**: If no response is received, or an ICMP "unreachable" message is returned, it likely means the port is filtered (usually by a firewall).

### 5. Using Scapy for TCP SYN Scanning
You can use Scapy, a powerful Python library for packet crafting, to create and send SYN packets for scanning. Here's a simple example of how to perform a TCP SYN scan using Scapy:

### 6. Why Scapy is Useful for TCP SYN Scanning
- **Flexibility**: Scapy gives you full control over crafting packets and inspecting responses. This allows you to implement a variety of scanning techniques, not just TCP SYN scans.
- **Customizability**: You can define custom port ranges, timeouts, and flags, making your scanning more tailored to specific environments.
- **Simplicity**: Scapy simplifies network programming tasks, allowing you to send and receive raw packets with just a few lines of code.

### 7. Limitations of TCP SYN Scanning
1. **Detection**: While stealthier than some methods, TCP SYN scans can still be detected by advanced Intrusion Detection Systems (IDS) that monitor incomplete handshakes.
2. **Firewalls and Filtering**: If a target is protected by a firewall, the TCP SYN scan may show ports as filtered, and you won’t be able to distinguish between closed and filtered ports.
3. **Legal and Ethical Considerations**: Scanning networks or devices without explicit permission is often considered illegal and unethical. Be sure to only scan networks where you have permission to do so.


### ***Conclusion***
- A TCP SYN scan is a fast, efficient, and relatively stealthy way to discover open ports on a target machine. It leverages the half-open TCP handshake to identify open, closed, or filtered ports without completing the full connection.
- Using tools like Scapy allows you to implement your own TCP SYN scans and craft custom packets for scanning, making it an excellent choice for network exploration and testing within authorized environments.

