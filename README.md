# BookBuddy 📚

BookBuddy is a modern web application built with Ruby on Rails that helps users manage their reading journey, track books, and connect with other readers.



## explanation-video = "link"

## 🌟 Features

- 📖 Book tracking and management
- 👤 User authentication and authorization
- 📊 Reading progress tracking
- 🔒 Secure session management with expiry
- 🎨 Modern UI with Hotwire and Stimulus
- 📱 Responsive design for all devices
- 🔐 Secure password handling
- 🐳 Docker support for easy deployment
- 📝 Book reviews and ratings
- 👥 User profiles and social features

## 🛠️ Tech Stack

- **Backend**: 
  - Ruby on Rails 8.0.2
  - Ruby 3.x
  - PostgreSQL
- **Frontend**: 
  - Hotwire (Turbo & Stimulus)
  - Import Maps for JavaScript
  - Propshaft asset pipeline
  - Modern CSS with Tailwind
- **Authentication**: 
  - Custom authentication system
  - Session management
  - Password encryption
- **Deployment**: 
  - Kamal for deployment
  - Docker containerization
- **Testing**: 
  - RSpec
  - Capybara
  - Selenium WebDriver
- **Security**: 
  - Brakeman for vulnerability scanning
  - CSRF protection
  - XSS prevention
  - Secure headers

## 📋 Prerequisites

Before you begin, ensure you have the following installed:

- Ruby 3.x
- PostgreSQL
- Node.js (for asset compilation)
- Docker (optional, for containerized deployment)
- Git

## 🚀 Getting Started

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone [https://github.com/yourusername/bookbuddy.git](https://github.com/My-Boy001/Book-Buddy.git)
   cd bookbuddy
   ```

2. **Install Ruby dependencies**
   ```bash
   bundle install
   ```

3. **Install JavaScript dependencies**
   ```bash
   yarn install
   ```

4. **Set up the database**
   ```bash
   # Create the database
   rails db:create
   
   # Run migrations
   rails db:migrate
   
   # (Optional) Seed the database with sample data
   rails db:seed
   ```

5. **Configure environment variables**
   ```bash
   # Copy the example environment file
   cp .env.example .env
   
   # Edit .env with your configuration
   # Make sure to set up your database credentials
   ```

6. **Start the development server**
   ```bash
   # Start the Rails server with Hotwire
   ./bin/dev
   ```

7. **Access the application**
   - Open your browser and navigate to `http://localhost:3000`
   - Default admin credentials (if seeded):
     - Email: admin@example.com
     - Password: password

### Docker Setup

1. **Build the Docker image**
   ```bash
   docker build -t bookbuddy .
   ```

2. **Run the container**
   ```bash
   docker run -p 3000:3000 \
     -e DATABASE_URL=postgres://postgres:password@db:5432/bookbuddy \
     -e RAILS_ENV=development \
     bookbuddy
   ```

3. **Run with Docker Compose (recommended)**
   ```bash
   docker-compose up
   ```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
rails test

# Run specific test files
rails test test/models/user_test.rb

# Run system tests
rails test:system
```

### Test Coverage

```bash
# Generate coverage report
COVERAGE=true rails test
```

## 🔒 Security

The application implements several security measures:

- Session expiry management
- CSRF protection
- Secure password handling with bcrypt
- Regular security scanning with Brakeman
- XSS prevention
- SQL injection protection
- Secure headers configuration

## 📦 Deployment

### Using Kamal

1. **Initial setup**
   ```bash
   kamal setup
   ```

2. **Deploy the application**
   ```bash
   kamal deploy
   ```

3. **Monitor the deployment**
   ```bash
   kamal app logs
   ```

### Manual Deployment

1. **Prepare the application**
   ```bash
   # Precompile assets
   rails assets:precompile
   
   # Run database migrations
   rails db:migrate
   ```

2. **Start the server**
   ```bash
   rails server -e production
   ```

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow the Ruby style guide
- Write tests for new features
- Update documentation as needed
- Keep commits atomic and well-described

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👥 Authors

- Your Name - Initial work

## 🙏 Acknowledgments

- Ruby on Rails team
- All contributors and supporters of the project
- The open-source community

## 🆘 Support

If you encounter any issues or have questions:

1. Check the [Issues](https://github.com/yourusername/bookbuddy/issues) page
2. Create a new issue if your problem isn't already listed
3. Join our community chat (if available)

