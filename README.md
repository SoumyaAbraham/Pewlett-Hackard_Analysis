# Pewlett-Hackard_Analysis

## Overview:  

Through this analysis, we determine the number of employees retiring per title for the "silver tsunami". We will also identify which employees who are born in the year 1961 and are therefore eligible to participate in the mentorship program.

## Analysis:  

* The first step would be to create an Entity Relationship Diagrams (ERD).  
_ERD is a type of flowchart that highlights different tables and their relationships to each other. It captures the primary keys, foreign keys and data types for each column from the .csv files._  
  Use [Quick DBD](http://quickdatabasediagrams.com/) to create the ERD.
  
  ![ERD](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/EmployeeDB.png)
  
---

### DELIVERABLE 1:

   * Create a Retirement Table with all the employees born between the years 1952-1955.
   * Find the most recent titles of each employee.
   * Create a table with the number of retirement-age employees by most recent job title. 
   * Exclude employees that no longer work at the company.
    
   ![retirement_titles](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/retirement_titles.png)   
   
   There are 133776 rows in all.  
   The csv file can be found here: [retirement_titles](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Data/retirement_titles.csv)  
   Note emp_no 10004, 10005 and 10009 are repeated with different titles.   
   
   * To get the unique titles with the most recent titles for each employee:  
    
   ![unique](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/unique_titles.png)  
   You will notice the duplicated emp_nos have been removed and the table now only consists of  unique values per emp_no, based on the most recent title each employee holds.  
   There are now 72458 currently employed employees that will be retiring soon.  
   The csv file can be found here: [unique_title](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Data/unique_titles.csv)  
   
   * Here is a count of employeed in each title:
   
   ![retiring_titles](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/retiring_titles.png)  
   
   
   Notice the number of employees in the 7 titles they can be under.  
   The csv file can be found here: [retiring_table](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Data/retiring_titles.csv)  
   
---

  ### DELIVERABLE 2:  
  
   * Create a table that holds current employees born in the year 1965.  
    
   ![mentorship_eligibility](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/mentorship_eligibility.png)  
    
   There are 1549 employees that are eligible for the mentorship program. The csv file can be found here: [mentorship_eligibility](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Data/mentorship_eligibility.csv)   
   
   * As a Bonus, let us find the count of eligible mentors for each title:  
   
   ![mentorship_count](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/mentorship_count.png)  
   
   The csv file can be found here: [mentorship_count](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Data/mentorship_count.csv)
   
---   
   
   ## Summary:  
   
   1. How many roles will need to be filled as the "silver tsunami" begins to make an impact?  
   
   As per our analysis, there are 72458 employees retiring during the upcoming "silver tsunami".   
   
   2. Are there enough qualified, retirement-ready employees in the department to mentor the next generation of Pewlett Hackard employees?
   
   Let us take a look at the counts for those retiring and those available for mentorship:  
   
   ![retiring_title](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/retiring_count.png) ![mentorship_count](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/blob/main/Screenshots/eligibility_count.png)  
   
  For each title, this is the number of eligible mentors : roles needed to be filled:  
  
  Senior Engineer: 1:153  _This might be an overwhelming number of trainees per mentor_  
  Senior Staff: 1:44 _This seems like a doable amount of trainees per mentor_  
  Engineer: 1:19 _This seems like a doable amount of trainees per mentor_  
  Staff: 1:49 _This seems like a doable amount of trainees per mentor_  
  Technique Leads: 1:47 _This seems like a doable amount of trainees per mentor_  
  Assistant Engineer: 1:14 _This is a very reasonable amount of trainees per mentor_  
  Manager: N/A _There are no managers retiring during the 'Silver Tsunami'_  
  
  Overall, all titles but Senior Engineer can be easily mentored through the mentorship program.  
  
  ---
  
  All csv files can be found it [csv_files](https://github.com/SoumyaAbraham/Pewlett-Hackard_Analysis/tree/main/Data)
  
  ---
   
   
   
    
    
    
    
   
   
   
   
   

