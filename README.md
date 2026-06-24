# Aurora – AI Wellness Companion

Aurora is an AI-powered wellness companion built for iOS using SwiftUI and Firebase. The application helps users build healthier habits through personalized insights, hydration tracking, habit monitoring, memory management, and AI-assisted wellness conversations.

Aurora focuses on delivering a companion-first experience that helps users understand their overall wellness status and make better daily health decisions.

## Features

- AI Wellness Assistant
- Personalized Health Insights
- Habit Tracking
- Hydration Monitoring
- Wellness Dashboard
- Aurora Memory
- Voice-Based Interaction
- Firebase Authentication
- Cloud Data Synchronization
- Modern SwiftUI User Interface

## Tech Stack

- Swift
- SwiftUI
- Firebase Authentication
- Firebase Firestore
- Gemini AI
- MVVM Architecture
- AVFoundation
- Git & GitHub

## Architecture

Aurora follows the MVVM (Model-View-ViewModel) architecture pattern.

### Components

- **Models** – User, Habit, Memory, and Wellness data models.
- **Views** – SwiftUI screens and reusable UI components.
- **ViewModels** – Business logic, state management, and AI interactions.
- **Services** – Firebase, AI, and data management services.

## Core Modules

### Dashboard

- Wellness overview
- Health score visualization
- Daily progress tracking
- Personalized recommendations

### Habit Tracking

- Create and manage habits
- Track daily completion
- Progress monitoring
- Habit consistency insights

### Hydration Tracking

- Water intake monitoring
- Daily hydration goals
- Progress visualization

### Aurora Memory

- Store personal notes and memories
- Context-aware AI interactions
- Personalized wellness conversations

### Voice AI Assistant

- Conversational wellness support
- Habit-related recommendations
- Health summaries
- Natural language interaction

## Firebase Integration

### Authentication

- Anonymous Sign-In
- Secure user management

### Firestore Database

Collections used:

- Users
- Habits
- Memories

Provides:

- Real-time synchronization
- Cloud storage
- User-specific data management

## Project Structure

```text
Aurora
├── Models
├── Views
├── ViewModels
├── Services
└── Assets
```

## Installation

### Clone Repository

```bash
git clone https://github.com/yourusername/Aurora.git
```

### Open Project

```bash
open Aurora.xcodeproj
```

### Firebase Setup

1. Create a Firebase project.
2. Enable Authentication.
3. Enable Firestore Database.
4. Download `GoogleService-Info.plist`.
5. Add the file to the project.

### Run

Build and run using Xcode.

## Requirements

- Xcode 15+
- iOS 15.0+
- Swift 5+
- Firebase Account

## Learning Outcomes

This project provided hands-on experience with:

- SwiftUI Development
- MVVM Architecture
- Firebase Authentication
- Firestore Database
- AI Integration
- State Management
- Cloud Data Synchronization
- Modern iOS UI/UX Design

## Future Improvements

- Apple Health Integration
- Push Notifications
- Advanced AI Personalization
- Wellness Analytics
- HealthKit Support
- Multi-device Synchronization

## Author

**Arjun U M**

- Email: arjunum88@gmail.com
- GitHub: https://github.com/arjunum
