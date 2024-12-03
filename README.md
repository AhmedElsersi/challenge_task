# E-Commerce Orders Insights App

This Flutter app provides insights from an e-commerce orders dataset. It showcases key metrics and trends through an intuitive and user-friendly interface, making it accessible to both technical and non-technical users. The app runs seamlessly on **iOS**, **Android**, and **Web** platforms.

## Features

### Screen 1: Metrics Overview
- **Total Orders**: Displays the total number of orders.
- **Average Order Price**: Calculates and shows the average price of all orders.
- **Number of Returns**: Indicates the total number of returned orders.
- **Total revenues**: Calculates and shows the total revenue from all orders.
- **Latest orders**: Shows the latest 5 orders.
- **view all button**: Provides a navigation to screen that views all orders.

### Screen 2: Orders Trends
- **Interactive Graph**:
    - X-Axis: Time (Date of orders).
    - Y-Axis: Number of orders.
    - Displays trends to help users understand order activity over time.
    - Tooltip-enabled for precise data points.
    - button to show time by day and by month.

### Screen 3: Orders screen
- **Orders List**:
    - Displays a list of all orders with details.
    - filters to filter by order status.

## Installation

### Prerequisites
- **Flutter SDK**: Ensure Flutter is installed. [Get Flutter](https://flutter.dev/docs/get-started/install)
- **IDE**: Use any Flutter-compatible IDE (e.g., Android Studio, VS Code).
- **Device/Simulator**: Android, iOS, or Web browser.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/AhmedElsersi/challenge_task.git
   cd challenge_task
2. Install dependencies:
    flutter pub get
3. Run the app: 
    flutter run
4. Build for web:
    flutter build web

## Usage
- **Metrics Overview**: Get a quick overview of key metrics.
- **Orders Trends**: Analyze order activity over time.
- **Orders List**: View all orders with details.
- **Filters**: Filter orders by status.
- **Interactive Graph**: Visualize order trends.
- **Responsive Design**: Works on various devices and screen sizes.
