SELECT users.name AS writer, COUNT(testimonials."writerId") AS "testimonialCount" FROM testimonials JOIN users ON users.id = testimonials."writerId" WHERE users.id = 435 GROUP BY writer;
