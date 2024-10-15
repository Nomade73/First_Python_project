### Step 3: Learning TCP SYN Scans

A ** TCP SYN scan ** is one of the most common and efficient methods for ** identifying open ports ** on a target machine. It’s widely used because of its speed and stealth compared to other port scanning techniques. Here's a detailed explanation:

### 1. What is TCP SYN Scan?
- Purpose: A TCP SYN scan is used to determine the status of a port on a target device—whether it is ** open, closed, or filtered ** . This scan is part of the three-way TCP handshake process, but it doesn’t complete the handshake, which is why it's often referred to as a ** half-open scan ** .
- TCP Handshake: Normally, when two systems communicate over TCP, they establish a connection using a three-way handshake:
SYN: The client sends a SYN (synchronize) packet to the server to initiate the connection.
SYN-ACK: If the server is listening on the port (open), it responds with a SYN-ACK (synchronize-acknowledge).
ACK: The client acknowledges the SYN-ACK, and the connection is established.
In a TCP SYN scan, the client (the scanner) only sends the first SYN packet and doesn’t complete the full handshake, making it faster and stealthier than a full connection scan.

How a TCP SYN Scan Works
Here’s the basic process of how a TCP SYN scan is performed:

SYN Packet Sent: The scanning device sends a SYN packet to a target IP and port.
Response Received: The scanner waits for a response:
SYN-ACK (Open Port): If the port is open, the target responds with a SYN-ACK packet, indicating it's ready to establish a connection.
RST (Closed Port): If the port is closed, the target responds with a TCP reset (RST) packet, indicating the port is not available.
No Response (Filtered Port): If the target doesn’t respond at all, it’s possible that the port is filtered by a firewall or the traffic is being dropped for security reasons.
No ACK Sent: Instead of completing the handshake by sending an ACK packet, the scanner sends an RST packet to abort the connection after receiving the SYN-ACK. This way, a full connection is never established, keeping the scan stealthy.
Why Use a TCP SYN Scan?
Speed: TCP SYN scans are faster than other types of scans (such as TCP Connect scans), because they don’t require the full three-way handshake.
Stealthiness: Since a TCP SYN scan doesn’t complete the handshake, it can be less detectable by security systems. Firewalls and intrusion detection systems (IDS) might miss this type of scan because it doesn’t establish a full connection.
Efficiency: It consumes fewer system resources than a full connection scan. For example, with a TCP Connect scan (which completes the full handshake), the system has to allocate resources to establish and tear down a connection for every scanned port. A TCP SYN scan avoids this overhead.
Interpreting the Results of a TCP SYN Scan
Open Port (SYN-ACK Response): If you receive a SYN-ACK response from the target, it means the port is open and accepting connections.
Closed Port (RST Response): If the target sends back an RST packet, the port is closed, and no connection can be established.
Filtered Port (No Response or ICMP): If no response is received, or an ICMP "unreachable" message is returned, it likely means the port is filtered (usually by a firewall).
