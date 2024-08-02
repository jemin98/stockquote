StockQuote App Documentation

Introduction
The StockQuote app is a Flutter application that allows users to search for stocks, view stock quotes grouped by industry sectors, manage a watchlist, and view detailed stock information including live data charts. The app is structured using a Test-Driven Development (TDD) approach with a clean architecture and state management as Riverpod.

Architecture
Clean Architecture Overview
The app follows a clean architecture pattern, which ensures separation of concerns, scalability, and maintainability. The architecture is divided into several layers:
Presentation Layer: Contains the UI components (screens and widgets) and manages the state using Riverpod.
Domain Layer: Contains business logic and domain entities.
Data Layer: Handles data fetching, parsing, and storage.

Screens
Search Screen
Purpose: Allows users to search for stocks in the US market.
Functionality:
Users can input a stock symbol or company name to search for relevant stocks.
Displays a list of matching stocks with basic information.
Category Screen
Purpose: Displays stock quotes grouped by industry sectors.
Functionality:
Fetches data from the search screen.
Groups stocks by industry sectors such as Oil & Gas, IT, Defense, etc.
Watchlist Screen
Purpose: Allows users to manage their watchlist.
Functionality:
Users can add stocks to their watchlist from the search screen.
Displays a list of watchlisted stocks.
Users can remove stocks from the watchlist.
Stock Details Screen
Purpose: Provides detailed information about a selected stock.
Functionality:
Displays stock logo, symbol, company name, current rate, and rate changes in the previous day.
Includes a live data chart (limited to a few stocks like "AAPL" due to API limitations).

Test Cases
The app includes comprehensive test cases to ensure the functionality of all APIs.






