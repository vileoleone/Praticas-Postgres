SELECT users.id, users.name, t3.name AS course, t4.name as school, t2."endDate" FROM users JOIN educations t2 ON users.id = t2."userId" JOIN courses t3 ON t2."courseId" = t3.id  JOIN schools t4 ON t2."schoolId" = t4.id WHERE t2.status = 'finished' and users.id = 30 ;

