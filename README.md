![logo](https://github.com/user-attachments/assets/5d65cf56-52ca-4f25-9b3d-44f1bf902b88)
# Codenames 🎯

## 🔎 Overview
Codenames is an online multiplayer game inspired by the popular party game. This project is a collaborative effort: I developed the client side using Flutter, while [my friend](https://github.com/AlexShatokhin) handled the server-side development. The project is built using WebSockets (socket.io) for real-time communication. The game supports three languages: Ukrainian, Russian, and English.

## 🚀 Demonstration
⚠️ You can try the web version [here](https://artemhula.github.io/codenames_web_demo/). Please note that the server might take a little longer to load after periods of inactivity. 

### Screenshots:
![Screenshots](https://github.com/user-attachments/assets/f696327e-1d2f-49a9-8d63-efba70bb692a)

## Features
- 🎮 Real-time multiplayer gameplay
- 💡 Interactive and responsive UI
- 🔗 Smooth WebSocket-based communication
- 🔊 Sound effects and vibration feedback
- 🌗 Theme switching (light/dark mode)
- 🌍 Language switching (Ukrainian, Russian, English)

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
- **Flutter_intl (l10n)**

## Game Rules 📝
- Minimum number of players: 4
- The game is played in two teams: **red** and **blue**.  
- Each team has a **spymaster** and **field operatives**.  
- The spymaster gives one-word clues and a number, hinting at specific words on the board.  
- Operatives try to guess their team’s words based on the clue.  
- Be careful! Guessing the opponent’s words helps the other team, and guessing the **assassin word** ends the game instantly.  
- The first team to find all their words wins! 🎯  
