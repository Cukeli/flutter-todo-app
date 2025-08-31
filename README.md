# Todo List Application

A simple todo list application built with Flutter frontend and Python FastAPI backend, using MySQL database.

## Project Structure

```
flutterbasic/
├── lib/                          # Flutter frontend
│   ├── features/                 # Feature-first architecture
│   │   └── todo/                # Todo feature
│   │       ├── models/          # Data models
│   │       ├── services/        # Business logic
│   │       └── views/           # UI components
│   ├── core/                    # Core functionality
│   │   ├── api/                 # API services
│   │   └── utils/               # Utility functions
│   └── shared/                  # Shared components
│       ├── widgets/             # Reusable widgets
│       └── constants/           # App constants
├── backend/                      # Python FastAPI backend
│   ├── features/                # Feature-first architecture
│   │   └── todo/                # Todo feature
│   │       ├── models/          # Database models
│   │       ├── services/        # Business logic
│   │       └── controllers/     # API endpoints
│   ├── core/                    # Core functionality
│   │   ├── database/            # Database configuration
│   │   └── config/              # App configuration
│   ├── utils/                   # Utility functions
│   ├── venv/                    # Python virtual environment
│   ├── requirements.txt         # Python dependencies
│   ├── config.env               # Environment variables
│   └── main.py                  # FastAPI application
└── README.md                    # This file
```

## Prerequisites

- Flutter SDK (latest stable version)
- Python 3.8+
- MySQL Server
- Git

## Setup Instructions

### 1. Clone and Setup Project

```bash
# Clone the repository
git clone <your-repo-url>
cd flutterbasic

# Install Flutter dependencies
flutter pub get
```

### 2. Backend Setup

#### 2.1 Navigate to Backend Directory
```bash
cd backend
```

#### 2.2 Create Virtual Environment
```bash
# Create virtual environment
python -m venv venv

# Activate virtual environment
# On Windows:
venv\Scripts\activate
# On macOS/Linux:
source venv/bin/activate
```

#### 2.3 Install Dependencies
```bash
# Install required packages
pip install -r requirements.txt

# Note: If you encounter Pydantic import errors, the pydantic-settings package 
# is already included in requirements.txt and will be installed automatically.
```

#### 2.4 Configure Database
1. Create a MySQL database named `todo_db`
2. Update `config.env` file with your database credentials:
   ```
   DB_HOST=localhost
   DB_PORT=3306
   DB_USER=your_username
   DB_PASSWORD=your_password
   DB_NAME=todo_db
   ```

#### 2.5 Initialize Database
```bash
# Create database tables
python core/database/init_db.py
```

#### 2.6 Run Backend Server
```bash
# Start the FastAPI server
python main.py
# Or using uvicorn directly:
uvicorn main:app --host 0.0.0.0 --port 8000 --reload
```

The backend will be available at: http://localhost:8000
API documentation: http://localhost:8000/docs

### 3. Frontend Setup

#### 3.1 Navigate to Project Root
```bash
cd ..  # Go back to project root
```

#### 3.2 Update API Configuration (if needed)
Edit `lib/core/api/api_service.dart` and update the `baseUrl`:
- For Android emulator: `http://10.0.2.2:8000/api/todos`
- For web: `http://localhost:8000/api/todos`
- For physical device: Use your computer's IP address

#### 3.3 Run Flutter App
```bash
# Run on connected device/emulator
flutter run

# Or run on specific platform
flutter run -d chrome    # Web
flutter run -d windows   # Windows
flutter run -d macos     # macOS
flutter run -d linux     # Linux
```

## Features

### Backend (FastAPI)
- ✅ Create, Read, Update, Delete (CRUD) operations for todos
- ✅ MySQL database integration
- ✅ RESTful API endpoints
- ✅ Input validation with Pydantic
- ✅ CORS middleware for frontend communication
- ✅ Feature-first architecture

### Frontend (Flutter)
- ✅ Modern Material Design 3 UI
- ✅ Add new todos with title and description
- ✅ Mark todos as complete/incomplete
- ✅ Delete todos
- ✅ Real-time updates
- ✅ Error handling and user feedback
- ✅ Responsive design
- ✅ Feature-first architecture

## API Endpoints

| Method | Endpoint | Description |
|--------|----------|-------------|
| GET | `/api/todos` | Get all todos |
| POST | `/api/todos` | Create a new todo |
| GET | `/api/todos/{id}` | Get a specific todo |
| PUT | `/api/todos/{id}` | Update a todo |
| DELETE | `/api/todos/{id}` | Delete a todo |

## Database Schema

```sql
CREATE TABLE todos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
```

## Troubleshooting

### Common Issues

1. **Database Connection Error**
   - Ensure MySQL server is running
   - Check database credentials in `config.env`
   - Verify database `todo_db` exists

2. **Flutter HTTP Package Error**
   - Run `flutter pub get` to install dependencies
   - Check if `http` package is in `pubspec.yaml`

3. **CORS Issues**
   - Backend CORS is configured to allow all origins
   - For production, restrict to specific domains

4. **Port Already in Use**
   - Change port in `config.env` or `main.py`
   - Kill process using port 8000

### Development Tips

- Use `--reload` flag with uvicorn for auto-reload during development
- Enable Flutter hot reload for frontend development
- Check FastAPI docs at `/docs` for API testing
- Monitor console logs for debugging

## Contributing

1. Follow the feature-first architecture
2. Add new features in separate feature directories
3. Maintain consistent code style
4. Test both frontend and backend changes

## License

This project is open source and available under the MIT License.
