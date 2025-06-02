# Reusebook

\*REUSE BOOK 📚 Reuse Book is interactive platform for connecting two users (specially for students) for selling and purchasing old books.It is very useful for one who want to buy books at low prices and one who want to sell their old books at half prices .The old books shopkeeper also include in this app.

Features
1.Book will be available in categorised format so one can easily find out their required book.
2.You can check the condition of book through pictures available on the app.
3.User friendly -One can easily understand the working of this app.
And there is one option also to see how it works .

Benefits

1. Environmental Impact : Reduces waste and the need for new resources, promoting sustainability.

2. Cost-Effective : Saves money compared to buying new books
3. Sustainable Practices : Encourages a culture of reuse, aligning with sustainable living principles
   Reusing books not only benefits individuals but also contributes positively to the community and the environment

---

## 🌟 Features

- 📖 **Buy and Sell Used Books**  
  List or browse pre-owned books by category, price, or seller.

- 🛒 **Add to Cart and Wishlist**  
  Save books for later or proceed to purchase.

- 🔍 **Advanced Search and Filters**  
  Find books quickly using filters like subject, author, condition, and price.

- 👤 **User Authentication**  
  Secure registration and login with role-based access for students and shopkeepers.

- 🧾 **User Roles: Student & Shopkeeper**  
  Role-based form rendering and access control.

- 📦 **Shopkeeper Dashboard**  
  Shopkeepers can manage book inventory and orders easily.

- 🖼️ **Profile with Image Upload**  
  Upload profile images with image preview and management.

- 🌐 **Multilingual Support**  
  Offers language selection to make the app accessible to diverse users.

---

## 🛠️ Tech Stack

### Frontend (Mobile)

- **Flutter** (UI Development)
- **GetX** (State Management & Routing)
- **Shared Preferences** (Local Storage)
- **Image Picker** (Image upload from gallery/camera)

### Backend

- **Node.js** (Express Framework)
- **MongoDB** (NoSQL Database)
- **Mongoose** (MongoDB ODM)
- **Multer** (Image Upload Middleware)
- **Sharp** (Image Processing)

---

## 🚀 Getting Started

Follow these steps to set up and run the **ReuseBook** project locally.

---

### 📁 1. Clone the Repository

```bash
git clone https://github.com/DevloperMahak/ReuseBook.git
cd ReuseBook
```

### 🖥️ 2. Backend Setup (Node.js + MongoDB)

➤ Prerequisites
Node.js

MongoDB (local or MongoDB Atlas)

➤ Installation

```bash
cd backend
npm install
```

➤ Environment Configuration
Create a .env file in the backend/ folder and add the following:

```bash
PORT=5000
MONGO_URI=your_mongodb_connection_string
```

Replace your_mongodb_connection_string with your MongoDB URI (local or Atlas).

➤ Run the Backend Server

```bash
cd src
node index.js
```

The backend will run on: http://localhost:5000

### 📱 3. Frontend Setup (Flutter)

➤ Prerequisites
Flutter SDK

An emulator or physical device

➤ Installation

```bash
cd frontend
flutter pub get
```

➤ API Configuration
Update the API base URL in your Flutter app (usually inside a constants or API service file) to match the backend server:

```bash
const String baseUrl = 'http://10.0.2.2:5000'; // For Android emulator
// OR
const String baseUrl = 'http://localhost:5000'; // For iOS or web
```

Note: For physical device testing, use your computer’s local IP (e.g., 192.168.x.x).

➤ Run the App

```bash
flutter run
```

The app should launch on your device or emulator and connect to the running backend.
