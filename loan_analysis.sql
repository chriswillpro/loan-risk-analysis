DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS loans;
DROP TABLE IF EXISTS members;

CREATE TABLE members (
    member_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    credit_score INT,
    annual_income DECIMAL(10, 2)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY,
    member_id INT,
    loan_type VARCHAR(30),
    loan_amount DECIMAL(10, 2),
    interest_rate DECIMAL(4, 2),
    loan_status VARCHAR(20),
    FOREIGN KEY (member_id) REFERENCES members(member_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    loan_id INT,
    payment_date DATE,
    payment_amount DECIMAL(10, 2),
    days_late INT,
    FOREIGN KEY (loan_id) REFERENCES loans(loan_id)
);

INSERT INTO members VALUES 
(1, 'John', 'Doe', 700, 60000.00),
(2, 'Jane', 'Smith', 750, 80000.00),
(3, 'Emily', 'Johnson', 680, 55000.00);

INSERT INTO loans VALUES 
(101, 1, 'Auto Loan', 25000.00, 4.50, 'Current'),
(102, 2, 'Personal Loan', 10000.00, 12.00, 'Delinquent'),
(103, 3, 'Home Equity', 50000.00, 6.00, 'Current');

INSERT INTO payments VALUES 
(1001, 101, '2026-05-01', 450.00, 0),
(1002, 101, '2026-05-01', 0.00, 45),
(1003, 102, '2026-05-01', 850.00, 3);

SELECT 
    m.member_id, 
    (m.first_name || ' ' || m.last_name) AS member_name, 
    m.credit_score, 
    l.loan_type, 
    l.loan_amount, 
    l.loan_status, 
    SUM(p.days_late) AS total_days_late
FROM members m
JOIN loans l ON m.member_id = l.member_id
LEFT JOIN payments p ON l.loan_id = p.loan_id
GROUP BY m.member_id;