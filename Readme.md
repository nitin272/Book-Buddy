# BookBuddy 📚
*Your personal book review companion built with Ruby on Rails*

[![Ruby Version](https://img.shields.io/badge/ruby-3.0%2B-red)]()
[![Rails Version](https://img.shields.io/badge/rails-7.0%2B-red)]()

> A simple, personal book tracking app where you can add books to your collection and write reviews - just for you.

---

## About BookBuddy

BookBuddy is a feature-rich personal book management application built with Ruby on Rails. Designed for book enthusiasts who want to maintain a digital library of their reading experiences, BookBuddy provides a clean, intuitive interface for managing your literary journey.

### Why BookBuddy?
- **Privacy First**: Your reading data stays private and secure
- **Simple Yet Powerful**: Easy to use but packed with useful features  
- **Personalized Experience**: Tailored dashboard just for you
- **Open Source**: Free to use, modify, and contribute to

---

## Key Features

### 📖 **Book Management**
- Add books with detailed information (title, author, genre, publication year)
- Organize your personal book collection
- Track reading status and progress

### ⭐ **Review System** 
- Write detailed reviews for each book
- Rate books using a 5-star system
- Add reading notes and favorite quotes
- Keep track of your thoughts on every book

### 🔐 **User Authentication**
- Secure user registration and login
- Session management with Rails
- Account settings and preferences
- Personal, private book collections

### 🎨 **Modern Interface**
- Responsive design that works on all devices
- Clean, Bootstrap-powered UI
- Intuitive navigation and user experience
- Personal dashboard with reading statistics

### 📊 **Personal Dashboard**
- View all your books and reviews in one place
- See reading statistics and progress
- Quick access to recent additions
- Overview of your reading journey

---

## Technology Stack

### Backend
- **Ruby on Rails 7.0+**: Web application framework
- **Ruby 3.0+**: Programming language  
- **SQLite**: Development database
- **PostgreSQL**: Production database (recommended)

### Frontend
- **Bootstrap 5**: CSS framework for responsive design
- **ERB Templates**: Server-side rendering
- **JavaScript**: Interactive frontend features

### Development Tools
- **RSpec**: Testing framework
- **Rubocop**: Code linting and style guide
- **Bundler**: Ruby dependency management
- **Git**: Version control

---

## Getting Started

### System Requirements
- **Ruby**: 3.0 or higher
- **Rails**: 7.0 or higher
- **Database**: SQLite (development), PostgreSQL (production recommended)
- **Node.js**: 16+ (for asset compilation)
- **Git**: For version control

### Installation

#### Step 1: Clone the Repository
```bash
git clone https://github.com/My-Boy001/Book-Buddy.git
cd bookbuddy
```

#### Step 2: Install Dependencies
```bash
bundle install
npm install
```

#### Step 3: Database Setup
```bash
rails db:create
rails db:migrate
rails db:seed
```

#### Step 4: Environment Configuration
```bash

cp .env.example .env
- Database credentials
- Secret keys
- Third-party API keys (if any)
```

#### Step 5: Start the Application
```bash
rails server
```

Visit `http://localhost:3000` to start using BookBuddy!

---

## How to Use BookBuddy

### Getting Started with Your Book Collection

1. **Create Your Account**
   - Visit the homepage and click "Sign Up"
   - Fill in your details and create your profile
   - Log in to access your personal dashboard

2. **Add Your First Book**
   - Click "Add Book" from your dashboard
   - Enter book details (title, author, genre, etc.)
   - Set reading status and add personal notes

3. **Write Reviews**
   - Navigate to any book in your collection
   - Click "Write Review" 
   - Rate the book (1-5 stars) and share your thoughts
   - Add favorite quotes or reading notes

4. **Explore Your Dashboard**
   - View all your books and reviews
   - See reading statistics and progress
   - Quick access to recent additions and reviews

---

## Routes Overview

```ruby
Rails.application.routes.draw do
  get "pages/about"
  root "home#index"
  get "home/index"

  resources :users
  resources :books do
    resources :reviews
  end

  get "dashboard/index"
  get "/dashboard", to: "dashboard#index"

  get    "/signup",  to: "users#new"
  post   "/signup",  to: "users#create"

  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  get    "/logout",  to: "sessions#destroy"
  get    "/about",   to: "pages#about"

  get "up" => "rails/health#show", as: :rails_health_check
end
```

---

## Deployment

### Render Deployment (Recommended)

1. **Connect GitHub Repository**
   - Push your project to GitHub
   - Go to [Render.com](https://render.com) and connect your GitHub repo

2. **Create a New Web Service**
   - Choose "Web Service" from Render dashboard
   - Set the build and start commands:
   ```bash
   bundle install && rails assets:precompile
   bundle exec puma -C config/puma.rb
   ```

3. **Set Up PostgreSQL Database**
   - Create a PostgreSQL service on Render
   - Link it to your Web Service

4. **Configure Environment Variables**
   Required environment variables for production:
   - `DATABASE_URL` (automatically set when linking the Render DB)
   - `RAILS_MASTER_KEY` (your Rails master key for credentials)
   - `RAILS_ENV=production`
   - `SECRET_KEY_BASE` (generate with `rails secret`)

### Alternative Deployment Options
- **Heroku**: Classic Rails deployment platform
- **Docker**: Containerization support included
- **VPS**: Deploy on any Linux server with Passenger/Nginx

---

## Project Structure

```
bookbuddy/
├── app/
│   ├── controllers/        
│   ├── models/            
│   ├── views/            
│   ├── helpers/         
│   └── assets/           
├── config/
│   ├── routes.rb         
│   ├── database.yml       
│   └── application.rb     
configuration  
├── db/
│   ├── migrate/         
│   └── seeds.rb          
├── spec/                 
├── public/               
└── Gemfile              
```

---

## Contributing

We welcome contributions from the community! Here's how you can help:

### How to Contribute
1. **Fork the repository** on GitHub
2. **Create a feature branch**: `git checkout -b feature/amazing-feature`
3. **Make your changes** and add tests if needed
4. **Run the test suite**: `bundle exec rspec`
5. **Commit your changes**: `git commit -m 'Add amazing feature'`
6. **Push to the branch**: `git push origin feature/amazing-feature`
7. **Open a Pull Request** with a clear description

### Development Setup
```bash
bundle install --with development test
bundle exec rspec
bundle exec rubocop
bundle exec brakeman
```

### Testing
```bash
bundle exec rspec
bundle exec rspec spec/models/book_spec.rb
bundle exec rspec --format documentation
```

---

## Troubleshooting

### Common Issues

**Database Connection Errors**
```bash
rails db:drop db:create db:migrate db:seed
```

**Asset Compilation Issues**
```bash
rails assets:precompile
```

**Missing Dependencies**
```bash
bundle install
npm install
```

**Rails Server Won't Start**
- Check if port 3000 is already in use
- Try starting on a different port: `rails server -p 3001`
- Ensure all migrations are run: `rails db:migrate`

---

**Last Updated**: June 10, 2025  
**Version**: 1.5.0  
**Status**: Actively Maintained

---

*Made with ❤️ by book lovers, for book lovers*