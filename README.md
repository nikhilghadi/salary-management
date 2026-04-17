# Salary Manager

A scalable salary management tool designed for organizations with 10,000+ employees.

---

## 🚀 Features

* Employee CRUD management
* Salary insights by country and job title
* Median salary & top earners
* Pagination for large datasets
* Optimized seed script (10k employees)
* Interactive dashboard with visualization

---

## 🧠 Architecture

* Rails API (service-oriented design)
* React frontend (component-based)
* PostgreSQL database
* Dockerized setup

---

## ⚡ Performance Considerations

* Bulk insert (`insert_all`) for seeding
* DB-level aggregations (no Ruby loops)
* Indexed columns for fast queries
* Pagination to handle large datasets

---

## 🤖 AI Usage

Used AI tools to:

* Generate initial scaffolding
* Validate query optimizations
* Improve edge case handling
* Chat GPT for test scenario generation and React UI components
* Readme file generated with help of chatgpt for structured and user freindly 

All outputs were reviewed and validated manually.

---

## 🧪 Testing

* RSpec for backend
* FactoryBot for test data
* TDD approach followed

---

## ▶️ Setup

```bash
docker-compose up --build
```

Frontend: http://localhost:3001
Backend: http://localhost:3000

---

## 🎥 Demo Link

https://drive.google.com/file/d/1m-Q6jDrgbRE6QjC73tjN_T5t7IlOL2MK/view?usp=sharing

---

## 📌 Design Decisions

* Separate InsightsController for analytics
* Service layer for business logic
* Minimal UI to focus on functionality
* One chart added in react for better user friendly
