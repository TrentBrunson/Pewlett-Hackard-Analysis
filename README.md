# Pewlett-Hackard-Analysis
------
### Project Overview
---
###### Pewlett-Hackard is facing a potential silver-tsunami and wants to proactively manage resources.  They want to identify roles that are retiring and identify resources for a part-time (consultant) mentorship program to develop the next generation of leaders in the enterprise.

### Resources
---
Used PostgreSQL to build a database and complete analysis for the required tasks.  In preparation for this, I created an Entity Relationship Diagram with Quick Database Diagrams (https://app.quickdatabasediagrams.com).  Data sources were provided by the employer and can be found in the data folder in this repo.

![EmployeeDB](https://github.com/TrentBrunson/Pewlett-Hackard-Analysis/blob/master/EmployeeDB.png)

### Summary
---
######
90,398 employees were born between 1952-1955; however, the written request asked for those that were born in 1965 for mentorship programs.

![Titles Retiring](https://github.com/TrentBrunson/Pewlett-Hackard-Analysis/blob/master/Titles_retiring.png)

Table 1. Number of titles retiring

The request was to identify those born 1952-1955.  After joining the employees table with the titles table, the cleaned data found that 33,118 employees are retiring.

![Emp_by_title](https://github.com/TrentBrunson/Pewlett-Hackard-Analysis/blob/master/Retiring_Emp.png)  
Table 2. Number of employees with each title

Lastly, a new table was requested that contained employee number, first and last name, title, from_date and to_date in order to find mentor eligible employees.  This query found
1,549 employees are eligible to participate in the mentorship program.

![Mentors](https://github.com/TrentBrunson/Pewlett-Hackard-Analysis/blob/master/Mentorship.png)  
Table 3. Mentorship eligible employees.  (List of current employees born in 1965)

---

###### Further Analysis

Examing table #1 above highlights other questions as to why such a disparity exists between the Managers and other titles.  This could be as simple as the type of experience required for the role.  However, more importantly, a few additional queries would reveal if one of the retiring set of titles is a disproportionately large segment of the total population.  This would help identify potentioal resource gaps and provide time to start addressing those (if any) now.

