import socket

# Function to scan ports 
def scan_ports(host, start_port, end_port):
    print(f"Scanning ports {start_port} to {end_port} on {host}...")

    # Loop through the specified range of ports
    for port in range(start_port, end_port + 1):
        # Create a new socket
        with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
            s.settimeout(0.1) # Set a timeout for each connection attempt
            result = s.connect_ex((host, port)) # Try to connect to the port 

            # If the connection was successful 
            if result ==  0:
                print(f"Port {port}: OPEN")
            else:
                print(f"Port {port}: CLOSED")


if __name__ == "__main__":
    #Scan localhost for ports in the range 1-1024
    host = "127.0.0.1"
    start_port = 500
    end_port = 1024
    scan_ports(host, start_port, end_port)
