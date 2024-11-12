use oes;

-- 1.Retrive all users who have been invited to an exam 
-- and show their full name, exam name, and status

-- select concat(u.firstname, ' ' , u.lastname) as fullname, a.assessmentname as examname, es.status
-- from users u
-- join invitation i on u.id=i.user_id
-- join examschedule es on i.exam_id=es.assessment_id
-- join assessment a on es.assessment_id= a.id;


-- 2. Find the total number of questions available in each category
--  (e.g., "Programming", "Networking")
--  and display the category along with the count. 

-- select qt.category, count(q.id) as count
-- from questions q 
-- join questiontype qt on q.questiontype_id=qt.id
-- group by qt.category; 



-- 3. Write a query to get the list of all questions 
-- in the "Science" category along with 
-- their options and the correct answer. 

-- select t.title, q.option1, q.option2, q.option3, q.option4, q.option5, q.answer
-- from topic t 
-- join questionbank qb on t.id = qb.topic_id
-- join questions q on qb.question_id = q.id
-- join questiontype qt on q.questiontype_id= qt.id
-- where qt.category="science";


-- 4. Find the assessments with more than 20 questions 
-- and display the assessment name along with the 
-- number of questions. 

-- select assessmentname, sum(totalquestions) as Number_of_Questions
-- from assessment
-- group by assessmentname
-- having Number_of_Questions>20;


-- 5. List all topics that do not have an associated 
-- skill (i.e., skill_id is NULL), and 
-- display the topic title and description.

SELECT title, description
FROM topic
WHERE skill_id IS NULL; 


-- 6. Retrieve the details of the exams scheduled for 
-- the date "2024-12-01" along with the assessment name 
-- and the duration of the exam.

-- select a.assessmentname, es.date, 
-- es.timestart, es.timeend, es.duration
-- from assessment a join examschedule es
-- on a.id = es.assessment_id; 



-- 7. Show the list of users who have the role 'STUDENT' 
-- and are invited to the exam scheduled on '2024-12-10'.
-- Display their full name and the exam name.

select concat(u.firstname, ' ' , u.lastname) as fullname, 
a.assessmentname as exam_name
from users u
join invitation i on u.id=i.user_id
join examschedule es on i.exam_id=es.id 
join assessment a on a.id = es.assessment_id
where date='2024-12-10' and u.role='user';



-- 8. Write a query to find the user with the highest score 
-- in the 'Machine Learning Algorithms'
-- Display the user's full name and their score.

-- select concat(u.firstname, ' ' , u.lastname) as fullname, 
-- er.score as exam_result 
-- from users u
-- join examresult er on u.id=er.user_id 
-- join questions q on er.question_id=q.id
-- join questionbank qb on q.id = qb.question_id 
-- join topic t on qb.topic_id=t.id
-- where t.title='Machine Learning Algorithms';


-- 9. Get the list of all users who have completed at 
-- least one exam, along with the total score they obtained. 

-- select concat(u.firstname, ' ' , u.lastname) as fullname, er.score as TotalScore
-- from users u 
-- join examresult er on u.id=er.user_id; 


-- 10. List all the assessments with their passing score, 
-- but only those assessments where the passing score is 
-- greater than 70%. 

-- select assessmentname, passingscore from assessment where passingscore>70;










