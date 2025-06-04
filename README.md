## 🎯 **Project Title**: Flutter Tic-Tac-Toe Game

---

## 🧠 What is this project?

This is a **two-player Tic-Tac-Toe game** (also known as *noughts and crosses*) made with **Flutter and Dart**.
It includes a clean UI, real-time score tracking, a countdown timer, and a fun **confetti effect** when someone wins.

It was designed to:

* Practice Flutter state management
* Implement game logic and animations
* Create a complete mobile app from scratch

---

## 💡 Features Explained (in detail):

### 🎮 1. Game Grid

* A 3x3 matrix where each player taps to make a move.
* Each cell in the grid is represented by a `Box`, and the game tracks the state using a `List<String>`.

### 🔄 2. Turn-Based Logic

* Players alternate turns using a boolean flag `Xturn`.
* If X made a move, next time it’ll be O's turn — and vice versa.

### 🧠 3. Winner Detection

* A list of **winning patterns** (rows, columns, diagonals) is stored.
* After every move, the game checks if the current player has matched a winning pattern.
* If a player wins:

  * Their score is incremented.
  * Winning cells are highlighted.
  * Confetti explodes! 🎉

### 😵 4. Draw Condition

* If all 9 boxes are filled and there’s no winner → game ends in a draw.

### ⏳ 5. Timer

* Each game starts with a **30-second timer**.
* If the timer runs out before the game ends, the match is auto-drawn.
* A `CircularProgressIndicator` shows remaining time visually.

### 🏆 6. Scoreboard

* A header shows Player X and Player O’s current score.
* Score persists through multiple games unless reset.

### 🧽 7. Controls

* **Start**: Begins a new game.
* **Reset Scores**: Resets both players’ scores to zero.

### ✨ 8. Confetti Animations

* Implemented using the `confetti` package.
* Celebrates player victories with color blasts — pink, purple, and blue!

---

## 📦 Tech Stack

| Tool                 | Purpose                         |
| -------------------- | ------------------------------- |
| **Flutter**          | Front-end development framework |
| **Dart**             | Programming language            |
| **Confetti package** | For visual win celebrations     |
| **VS Code**          | Development IDE                 |
| **GitHub**           | Version control + code hosting  |

---

## 📌 Learning Outcomes

Through this project, I improved:

* Flutter UI building and layout skills
* State management using `setState()`
* Writing clean, structured Dart code
* Using third-party packages like `confetti`
* Understanding and implementing game logic
* Git & GitHub basics: pushing code, writing README, repo setup

---

## 🛠 Future Improvements (Optional Ideas)

* Add **single-player mode** with basic AI
* Sound effects for moves & wins
* Add dark mode toggle
* Create a more advanced animation using `Rive` or `Lottie`
