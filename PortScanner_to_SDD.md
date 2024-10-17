import socket 
import logging
from datetime import datetime
import time

# Setup logging
logging.basicConfig(filename='port_scanner.log', level=logging.INFO, 
                    format='%(asctime)s - %(levelname)s - %(message)s')

def scan_port(host, port):
    try:
        # Create a new socket for each port
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(1)  # Set timeout to avoid hanging indefinitely
            result = s.connect_ex((host, port))  # 0 means success (port is open)
            if result == 0:
                print(f"[DEBUG] Port {port} on {host} is open")
                return True  # Port is open
            else:
                print(f"[DEBUG] Port {port} on {host} is closed with result {result}")
                return False  # Port is closed
    except Exception as e:
        print(f"[DEBUG] Error scanning port {port}: {str(e)}")
    except socket.gaierror:
        logging.error(f"Hostname could not be resolved: {host}")
        print(f"Hostname could not be resolved: {host}")
        return None
    except socket.error:
        logging.error(f"Couldn't connect to server: {host}")
        print(f"Couldn't connect to server: {host}")
        return None

def port_scanner(host, start_port, end_port, rate_limit=0.5):
    open_ports = []
    logging.info(f"Starting scan on host: {host} from port {start_port} to {end_port}")
    print(f"Scanning {host} from port {start_port} to {end_port}...")
    
    # Input validation
    if not (0 <= start_port <= 65535) or not (0 <= end_port <= 65535):
        print("Invalid port range. Ports must be between 0 and 65535.")
        return

    if start_port > end_port:
        print("Invalid range. Start port must be less than or equal to end port.")
        return

    for port in range(start_port, end_port + 1):
        if scan_port(host, port):
            print(f"Port {port} is open")
            open_ports.append(port)
        else:
            print(f"Port {port} is closed")
        time.sleep(rate_limit)  # Rate limiting to avoid excessive scanning

    logging.info(f"Scan complete. Open ports: {open_ports}")
    return open_ports

# Main execution
if __name__ == "__main__":
    target_host = input("Enter the host to scan: ")
    
    try:
        # Validate IP address format or domain name
        socket.gethostbyname(target_host)
    except socket.gaierror:
        print("Invalid host. Please enter a valid IP address or domain.")
        exit(1)
    
    try:
        start_port = int(input("Enter the start port: "))
        end_port = int(input("Enter the end port: "))
    except ValueError:
        print("Port numbers must be integers.")
        exit(1)

    start_time = datetime.now()
    open_ports = port_scanner(target_host, start_port, end_port, rate_limit=0.5)
    end_time = datetime.now()

    print(f"\nScanning completed in {end_time - start_time}. Open ports: {open_ports}")
    logging.info(f"Scan duration: {end_time - start_time}")
