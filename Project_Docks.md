### Step 1: Identifying Libraries

## Python libraries:

socket: To create connections and interact with ports.
scapy: For ARP and ICMP scanning, and for crafting network packets.
argparse: For handling command-line arguments.
threading or asyncio: To make the scanner faster by scanning multiple ports concurrently.
logging: For logging functionality.
Make sure to install any required libraries using pip install scapy argparse logging.

### Step 2: Learning ARP and ICMP Protocols

- ARP (Address Resolution Protocol) helps resolve IP addresses to MAC addresses.
 - ICMP (Internet Control Message Protocol) is used to send error messages or perform simple network diagnostics, like pinging.
**Both protocols will help in detecting active hosts on the network**

Step 3: Learning TCP SYN Scans
A TCP SYN scan sends SYN packets to a range of ports and waits for a response. If a port responds with SYN-ACK, it’s open. If it sends RST (reset), the port is closed. You can use Scapy to create and send these packets.
