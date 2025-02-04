![logo](https://github.com/user-attachments/assets/5d65cf56-52ca-4f25-9b3d-44f1bf902b88)
# Codenames 🎯

## 🔎 Overview
Codenames is an online multiplayer game inspired by the popular party game. This project is a collaborative effort: I developed the client side using Flutter, while [my friend](https://github.com/AlexShatokhin) handled the server-side development. The project is built using WebSockets (socket.io) for real-time communication.

## 🚀 Demonstration
⚠️ You can try the web version [here](https://artemhula.github.io/codenames_web_demo/). Please note that the server might take a little longer to load after periods of inactivity. 

Video TBA

## Features
- 🎮 Real-time multiplayer gameplay
- 💡 Interactive and responsive UI
- 🔗 Smooth WebSocket-based communication
- 🔊 Sound effects and vibration feedback
- 🌗 Theme switching (light/dark mode)

## Requirements ⚙️
- Flutter SDK >= 3.2.6
- Dart SDK >= 2.17.0

## Installation 🛠️
### Server:
For server setup instructions, please refer to the [server documentation](https://github.com/AlexShatokhin/webSocketForCodenames). It contains detailed guidelines on environment configuration and deployment.

### Client:
1. Clone the repository:
   ```bash
   git clone https://github.com/artemhula/codenames.git
   ```
2. Navigate to the client directory:
   ```bash
   cd codenames
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create `.env` file in the root directory of the project and add the necessary environment variables. For example:
   ```
   SOCKET_URL=http://localhost:3000
   ```
5. Run the app:
   ```bash
   flutter run
   ```

## Technologies Used 🖥️
- **Redux**
- **Socket_IO**
- **Shared Preferences**
