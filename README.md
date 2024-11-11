
# Cabify

My Project "Cabify" is a sustainable real time cab booking application developed with flutter and allows users to book cabs by connecting them in real-time with drivers using google maps APIs. Cabify includes a unique feature that estimates carbon footprint based on trip distance, promoting eco-friendly travel.

## Table of Contents

 - Project Overview
 - Architecture
 - Tech Stack used
 - Installation and Setup
 - Usage/Documentation
 - Results
 - Future work

## Project Overview

With the rise in urbanization, personal transportation needs have skyrocketed, leading to an increased number of cabs on the roads. While cab services offer convenience, they also contribute to traffic congestion and environmental pollution. Currently, most cab services focus on optimizing routes and costs but often overlook the environmental impact of individual rides. Additionally, users lack visibility into how their travel choices affect the environment.

Solution: This Cab Booking App addresses these issues by:

Simplifying Cab Booking: Provides an intuitive interface for booking cabs, offering quick and easy access to transportation.
Mock Carbon Footprint Tracking: Introduces a unique feature to estimate the carbon emissions of each ride, allowing users to make informed decisions about their travel impact.
Promoting Environmental Awareness: By quantifying the environmental impact, the app encourages users to consider greener alternatives, such as carpooling, using public transport, or opting for rides with lower emissions.

## Architecture

This project follows MVC (Model View Controller) Architecture.

1. **Model**
consists of all the data models such as user model, driver    model, location model etc.

2. **View**
consists of all the UI parts, the client side of project where users can interact with it.

3. **Controller**
All the business login inclding APIs, location services, authentication services, datbase operations lie here.

## Tech Stack

**Databse:** Firebase

**Fronted:** Dart, Flutter

**API Management:** Google Cloud


## Installation

    1. Clone the repository

```bash
  https://github.com/thisgurjeet/cab-booking-app
```
    2. Install required dependencies

```bash
   flutter pub get
```    
  
    3. Run the Emulator

```bash
  flutter run
```     
## Usage

Once the project is set up, you can sign in using your mobile phone no as a customer or a driver.

1. Enter your necessary details in textfield after getting verified by the OTP.

2. Choose sign in as either "CUSTOMER" or "PARTNER".

3. For customers, there are two textfields to enter your current location and destination location.

4. Cabify will start locating nearby online drivers to accept the ride, once the ride is accepted users can have a ride.

5. Partners need to swipe Go online button to get notified for rides, the fair prices will be shown to both the parties.





## Results

Users can enjoy their rides seamlessly using cabify by entering destination address.
## Future Work

1. Implementing a payment integration to accept fair with online wallets.

2. Gamification needs to be done to enhance user enagagements.

3. A real-time carbon tracking API implementation to encourage users to choose eco friendly rides.
