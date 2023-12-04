import time
import requests

# Function to query the frontend and calculate latency
def calculate_latency():
    latencies = []
    for i in range(30):
        response = requests.get('http://frontend-canary.default.svc.cluster.local:80')
        latency = response.elapsed.total_seconds()
        latencies.append(latency)
        print("Request ",i," Latency: ", latency)
        time.sleep(1)

    average_latency = sum(latencies) / len(latencies)
    return average_latency

# Main function to check latency and return status
def check_latency():
    
    average_latency = calculate_latency()
    print("Average latency:", average_latency)
    
    if average_latency > 1.5:
        return 1
    else:
        return 0

print("Started frontend latency test")
result = check_latency()
print("Exiting with code :", result)
exit(result)
