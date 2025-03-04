# 📚 Library Management System – Automated Borrowing Control

## 📖 Overview
This project automates the **borrowing, returning, and fine enforcement** processes in a library using **MySQL triggers**. It ensures efficient book management by **updating availability, imposing fines for late returns, and restricting over-borrowing**. 

## 🚀 Features
### ✅ **1. Automatic Book Return Update**
- Trigger: `after_return_update`
- **Function:** When a book is returned (`return_date` updated), the system **increases the available stock** of that book.
- **Benefit:** Prevents manual inventory updates and ensures accurate book availability.

### ✅ **2. Late Return Fine Enforcement**
- Trigger: `after_late_return`
- **Function:** If a book is returned **after 14 days**, the system **automatically adds a ₹50 fine** to the `Fines` table.
- **Benefit:** Discourages overdue book returns.

### ✅ **3. Borrowing Limit Restriction**
- Trigger: `prevent_over_borrowing`
- **Function:** Prevents members from borrowing more than **5 books** at a time by **blocking the transaction** if the limit is exceeded.
- **Benefit:** Ensures fair access to books for all members.