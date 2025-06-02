# Reusebook

\*REUSE BOOK 📚 Reuse Book is interactive platform for connecting two users (specially for students) for selling and purchasing old books.It is very useful for one who want to buy books at low prices and one who want to sell their old books at half prices .The old books shopkeeper also include in this app.

---

## 🌍 Real-World Use Case & Impact

### 🎯 Use Case

**ReuseBook** addresses a common problem faced by students and educational institutions: the underutilization and wastage of educational books. In schools, colleges, and universities, students frequently purchase new textbooks every semester or year — leaving their old ones unused, discarded, or stored away.

**ReuseBook** connects:

- 📘 **Students** who want to sell or donate old books
- 🏪 **Shopkeepers** who want to buy used books and resell them affordably
- 🎓 **New students** who seek quality books at lower prices

With an easy-to-use interface and powerful filtering/search, ReuseBook facilitates the exchange of academic resources across campuses and communities.

---

### 🌱 Environmental Impact

- ♻️ **Reduces Paper Waste:** Every reused book saves paper, printing ink, and production energy.
- 🌳 **Saves Trees:** Promotes circular usage of books, decreasing the demand for newly printed materials.
- 💡 **Sustainable Education:** Encourages a culture of sharing and recycling in the academic world.

> 📊 **Did you know?** Manufacturing one ton of paper uses over 17 trees and 26,000 liters of water. Reusing books saves both.

---

### 💸 Economic & Social Impact

- 👩‍🎓 **Saves Money:** Students from economically weaker backgrounds can access study material at a much lower cost.
- 🧑‍🏫 **Empowers Shopkeepers:** Local book vendors gain a digital platform to increase sales and inventory turnover.
- 🤝 **Fosters Community Sharing:** Makes donating or passing on books part of a student culture.

---

**ReuseBook** is not just an app — it's a movement towards affordable, sustainable, and collaborative education.

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

➤ **Prerequisites**

- Node.js
- MongoDB (local or MongoDB Atlas)

➤ **Installation**

```bash
cd backend
npm install
```

➤ **Environment Configuration** <br><br>
Create a .env file in the backend/ folder and add the following:

```bash
PORT=5000
MONGO_URI=your_mongodb_connection_string
```

Replace your_mongodb_connection_string with your MongoDB URI (local or Atlas).

➤ **Run the Backend Server**

```bash
cd src
node index.js
```

The backend will run on: http://localhost:5000

### 📱 3. Frontend Setup (Flutter)

➤ **Prerequisites**

- Flutter SDK
- An emulator or physical device

➤ **Installation**

```bash
cd frontend
flutter pub get
```

➤ **API Configuration** <br><br>
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
