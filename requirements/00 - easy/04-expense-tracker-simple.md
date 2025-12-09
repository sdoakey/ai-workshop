# Simple Expense Tracker

## System Description
A lightweight expense tracking application that allows users to log daily expenses, categorize them, and view spending summaries. The application provides basic reporting on spending patterns.

## System Constraints & Considerations
- **Local Storage**: Data must be stored locally (no cloud sync)
- **Multi-Currency Support**: Must handle multiple currency types
- **Data Validation**: All monetary inputs must be validated
- **CSV Export**: Users must be able to export expense data
- **Audit Requirements**: All expense records must include modification history

---

## User Stories

### User Story 1: Log Daily Expenses
**As a** user  
**I want to** record an expense with amount, category, and date  
**So that** I can track my spending

**Acceptance Criteria:**
- [ ] User can input expense amount (positive numbers, validated)
- [ ] User can select or create a category
- [ ] User can select the date (defaults to today)
- [ ] User can add optional description/notes (max 200 chars)
- [ ] Amount is validated to prevent negative values and injection attacks
- [ ] Description is sanitized to prevent code injection
- [ ] Expense is assigned a unique identifier
- [ ] Currency is recorded with each expense
- [ ] Unit tests verify amount validation and sanitization
- [ ] Integration tests confirm data is persisted correctly
- [ ] Concurrency tests ensure no duplicate entries

### User Story 2: Categorize Expenses
**As a** user  
**I want to** assign expenses to categories  
**So that** I can organize and analyze my spending

**Acceptance Criteria:**
- [ ] System provides default categories (food, transport, utilities, etc.)
- [ ] User can create custom categories
- [ ] Each expense must have exactly one category
- [ ] Categories can be renamed or deleted
- [ ] Deleting a category doesn't delete associated expenses
- [ ] Category names are validated and sanitized
- [ ] Unit tests verify category management
- [ ] Integration tests confirm category-expense relationships
- [ ] Tests verify no SQL injection in category operations

### User Story 3: View Monthly Spending Summary
**As a** user  
**I want to** see a summary of my spending by category for a selected month  
**So that** I can understand my spending patterns

**Acceptance Criteria:**
- [ ] User can select a month and year
- [ ] Summary shows total spending per category
- [ ] Summary shows percentage of total spending per category
- [ ] Summary shows highest and lowest spending days
- [ ] Data is presented in a readable table or chart format
- [ ] Calculations are accurate to 2 decimal places
- [ ] Summary loads within 2 seconds
- [ ] Unit tests verify calculation accuracy
- [ ] Integration tests confirm all expenses are included correctly
- [ ] Performance tests ensure summary is responsive for large datasets

### User Story 4: Filter Expenses by Date Range
**As a** user  
**I want to** view expenses within a specific date range  
**So that** I can analyze spending for custom periods

**Acceptance Criteria:**
- [ ] User can select start and end dates
- [ ] System validates date range (start <= end)
- [ ] Filtered results show only expenses within the range
- [ ] Results are sorted by date
- [ ] Total spending for the range is displayed
- [ ] Filter criteria are validated to prevent injection
- [ ] Unit tests verify date range filtering logic
- [ ] Edge case tests handle boundary dates correctly
- [ ] Performance tests ensure filtering completes within 1 second

### User Story 5: Edit or Delete Expenses
**As a** user  
**I want to** correct mistakes or remove unwanted expenses  
**So that** my expense data remains accurate

**Acceptance Criteria:**
- [ ] User can modify amount, category, date, and description
- [ ] All inputs are re-validated during edit
- [ ] Delete operations require confirmation
- [ ] Modification timestamps are recorded
- [ ] Audit log tracks all changes (original values, new values, timestamp)
- [ ] Deleted expenses are marked as deleted (soft delete)
- [ ] Unit tests verify edit and delete operations
- [ ] Integration tests confirm audit trail is created
- [ ] Tests verify no data loss during updates

### User Story 6: Export Expenses to CSV
**As a** user  
**I want to** export my expense data to a CSV file  
**So that** I can use it in spreadsheets or other tools

**Acceptance Criteria:**
- [ ] User can export all expenses or filtered set
- [ ] CSV includes columns: date, amount, category, description, currency
- [ ] CSV is properly formatted and can be opened in Excel/Sheets
- [ ] File is named with current date (expenses_2025-01-15.csv)
- [ ] CSV does not include sensitive system data
- [ ] Large exports (10,000+ items) complete within 10 seconds
- [ ] Unit tests verify CSV format correctness
- [ ] Integration tests confirm all data is exported accurately
- [ ] Security tests verify no injection vulnerabilities in export
