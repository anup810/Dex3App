# Dex3App

Dex3App is an iOS application that fetches Pokémon data using the [PokéAPI](https://pokeapi.co/), stores it using Core Data, and allows users to browse and view Pokémon information. 

## Table of Contents

- [Introduction](#introduction)
- [Features](#features)
- [Architecture](#architecture)
- [Core Data](#core-data)
- [API Integration](#api-integration)
- [Running the Project](#running-the-project)
- [Contributing](#contributing)


## Introduction

Dex3App is a sample project designed to demonstrate the integration of Core Data with a RESTful API in an iOS app. The app fetches data from the PokéAPI, stores it locally, and provides functionality to view and interact with the data.

## Features

- Fetch all 386 Pokémon from the PokéAPI.
- Store Pokémon data locally using Core Data.
- Check if Pokémon data already exists before making API calls.
- Display detailed Pokémon information including types, stats, and images.
- Sample Pokémon data for quick preview.

## Architecture

This app is built using a combination of MVC (Model-View-Controller) and structured using the following key components:

- **PersistenceController:** Handles Core Data setup and management.
- **FetchController:** Manages API requests and data parsing.
- **SamplePokemon:** Provides sample Pokémon data for previews and testing.

## Core Data

Core Data is used to persist Pokémon data locally, allowing the app to operate without a network connection once data has been fetched. The app uses an `NSPersistentContainer` to manage the Core Data stack and provides a sample Pokémon entry for testing.

### Sample Pokémon

The sample Pokémon data is provided by the `SamplePokemon` struct, which includes:

- **Bulbasaur:** The first Pokémon in the Pokédex, with type, stats, and image data.

### Checking for Existing Data

Before making a network request, the app checks if the first and last Pokémon (IDs 1 and 386) exist in the local database to avoid redundant network calls.

## API Integration

Dex3App integrates with the PokéAPI to fetch Pokémon data. The `FetchController` struct is responsible for:

- Building the request URL with a limit of 386 Pokémon.
- Fetching data from the API.
- Decoding JSON data into a custom `TempPokemon` model.

### Error Handling

The `FetchController` struct includes error handling for common network errors:

- `badURL`: The request URL is invalid.
- `badResponse`: The server response is invalid.
- `badData`: The fetched data is not in the expected format.

## Running the Project

To run the project:

1. Clone the repository.
2. Open `Dex3App.xcodeproj` in Xcode.
3. Build and run the project on your preferred simulator or device.

### Requirements

- Xcode 14.0 or later.
- iOS 16.0 or later.

## Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature/YourFeature`).
3. Commit your changes (`git commit -m 'Add some feature'`).
4. Push to the branch (`git push origin feature/YourFeature`).
5. Open a pull request.


