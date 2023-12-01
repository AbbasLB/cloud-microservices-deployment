import argparse
import pandas as pd
import matplotlib.pyplot as plt
import os
from datetime import timedelta

# Function to plot Requests/s and Average Latency with the specified time offset
def plot_requests_latency(file_path, time_offset):
    # Read CSV file into a pandas DataFrame
    df = pd.read_csv(file_path)

    # Convert Timestamp to datetime format and add time offset
    df['Timestamp'] = pd.to_datetime(df['Timestamp'], unit='s') + timedelta(hours=time_offset)

    # Calculate average latency
    df['Average Latency'] = df['Total Average Response Time']  # Assuming this column contains the average latency

    # Plotting
    plt.figure(figsize=(10, 6))

    # Plot Requests/s without markers
    plt.plot(df['Timestamp'], df['Requests/s'], color='blue', label='Requests/s')

    # Plot Average Latency without markers on the secondary y-axis
    plt.twinx()
    plt.plot(df['Timestamp'], df['Average Latency'], color='green', label='Average Latency (ms)')

    # Set y-axis labels and legends
    plt.ylabel('Requests/s & Average Latency (ms)')
    plt.xlabel('Time')
    plt.title('Graph for Requests/s and Average Latency')
    plt.legend(loc='upper left')

    # Format x-axis to display only hours and minutes
    plt.gca().xaxis.set_major_formatter(plt.matplotlib.dates.DateFormatter('%H:%M'))

    # Rotate x-axis labels for better readability
    plt.xticks(rotation=45)

    # Show plot
    plt.tight_layout()
    plt.show()

# Function to iterate through files in a directory and plot graphs
def plot_graphs_in_directory(directory_path, time_offset):
    # Loop through each CSV file in the directory and plot graph for Requests/s and Average Latency
    for filename in os.listdir(directory_path):
        if filename.endswith(".csv"):
            file_path = os.path.join(directory_path, filename)
            plot_requests_latency(file_path, time_offset)

# Parse command-line arguments
parser = argparse.ArgumentParser(description='Plot Requests/s and Average Latency from CSV files.')
parser.add_argument('directory_path', type=str, help='Path to the directory containing CSV files')
parser.add_argument('--time_offset', type=int, default=3, help='Time offset in hours (default: 3)')
args = parser.parse_args()

# Call function to plot graphs with directory path and time offset
plot_graphs_in_directory(args.directory_path, args.time_offset)
