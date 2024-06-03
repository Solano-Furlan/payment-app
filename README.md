# Payment App

A Flutter mobile application designed to facilitate easy and efficient mobile phone recharges. This user-friendly app offers a seamless experience for topping up prepaid mobile plans quickly, securely, and on-the-go.

## Video Overview

[![Walkthrough Video](https://img.youtube.com/vi/uCVrS1ATcX4/0.jpg)](https://youtu.be/uCVrS1ATcX4)



## Getting Started
1. Install Flutter 3.22.1
2. Run in your terminal $: flutter clean && flutter pub get
4. Launch an Android or iOS simulator
3. Run in your terminal $: flutter run

## Software Architecture
Feature based clean architecture. Each feature has four layers/folders (domain, data, state, presentation):

* Domain: Interfaces for data models, repository abstract interfaces, models, dtos, enums, events, etc.
* Data: Data repositories & data normalizer (json to dart models from the domain).
* State: The state management is going to be Cubit, similar to Redux, where different states are emitted in the cubit class (loading, loaded/success,error). Then cubit builder is used in the presentation screen & widget to manage the app state. The repositories are injected to the cubit, so unit testing can easily be properly implemented.
* Presentation: UI Screen & Widgets/Components

## API/Backend
Mocked http client API responses with DioAdapater to simulate the payments API.

## State Management
[Cubits](https://pub.dev/packages/flutter_bloc) are used for efficient state management, ensuring a seamless and reactive user experience. Cubits, part of the Bloc library, provide a straightforward and scalable approach to managing application state.

## Dependency Injection
The [Injectable](https://pub.dev/packages/injectable) package is implemeted for streamlined dependency injection, significantly enhancing code cleanliness, maintainability, and facilitating unit testing.

## Router & Navigation
To handle navigation, [Go Router](https://pub.dev/packages/go_router) was implemented, optimizing routing throughout the application for a smooth user experience. With Go Router, the app benefits from streamlined routing between screens and routes, following a declarative approach that simplifies setup and maintenance.

## Event Bus
Event Bus was implemented to facilitate smooth communication between various Cubits, fostering a modular and flexible architecture. This Event Bus acts as a centralized channel through which Cubits can publish and subscribe to events, enabling them to exchange messages and trigger actions independently.

## Design System
The core 'design_system' folder was implemented to manage common components, color palettes, and themes, streamlining the design process and ensuring consistency across the application. This folder houses essential UI elements like buttons, cards, and input fields, all designed to adhere to established design guidelines and facilitate easy reuse throughout various screens and features.

## File naming conventions
* Domain: example.interface.dart; example.enum.dart example.dto.dart; example.repository.interface.dart;
* Data: example.repository.dart; example.repository.normalizer.dart; example.repository.unit_test.dart;
* State: example.state.dart; example.cubit.dart; example.cubit.unit_test.dart;
* Presentation: example.screen.dart; example.widget.dart;


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
