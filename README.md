# IT120-FinalProject
# 🍏 Fruit Detection App

## 🔄 Application Workflow

### 1. Application Initialization
- **Splash Screen**
  - Loads necessary services
  - Initializes camera and ML models
  - Fetches user preferences

### 2. Main Navigation
- **Bottom Navigation**
  - Home: Overview and quick actions
  - Detect: Start new detection
  - History: View past detections
  - Analytics: View detection statistics

### 3. Detection Flow
1. **Class Selection**
   - User selects fruit type (optional)
   - Configures detection parameters
   
2. **Camera Interface**
   - Live camera preview
   - Real-time object detection
   - Confidence level indicators
   
3. **Detection Processing**
   - Captures image/video frame
   - Processes through ML model
   - Analyzes and classifies fruits
   - Calculates confidence scores

4. **Results Display**
   - Shows detection results
   - Displays confidence levels
   - Option to save or retry

### 4. Data Management
- **Local Storage**
  - Saves detection history
  - Stores user preferences
  - Caches ML models

- **Cloud Sync**
  - Optional cloud backup
  - Cross-device synchronization
  - Data export functionality

### 5. Analytics & History
- **Detection History**
  - Browse past detections
  - Filter by date/type
  - View detailed records

- **Performance Metrics**
  - Accuracy statistics
  - Detection success rates
  - Processing speed
  - Confusion matrix

## 🛠 Technical Implementation

### Core Components
- **Camera Service**
  - Handles camera initialization
  - Manages frame capture
  - Processes image data

- **ML Model**
  - On-device inference
  - Real-time classification
  - Confidence scoring

- **State Management**
  - Local state for UI
  - Persistent storage
  - Event handling

## 📱 User Interface

### Key Screens
1. **Home Screen**
   - Quick access to features
   - Recent detections
   - System status

2. **Detection Screen**
   - Camera viewfinder
   - Detection overlay
   - Control buttons

3. **History Screen**
   - Detection timeline
   - Search and filter
   - Detailed views

4. **Analytics Screen**
   - Performance charts
   - Statistics overview
   - Export options

## � Getting Started

### Prerequisites
- Flutter SDK 3.0+
- Camera device (mobile/emulator)
- Sufficient storage for ML models

### Running the App
1. Clone the repository
2. Install dependencies: `flutter pub get`
3. Run the app: `flutter run`


GitHub Profile: https://github.com/Zen732
