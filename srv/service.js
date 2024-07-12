const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
  const { Course, Subject, SemesterSubject, SelectedCourse } = this.entities;

  this.on('addCourse', async (req) => {
    const { coursename, duration, semcount } = req.data;
    
    if (semcount > 8) {
      return req.error(400, 'A course cannot have more than 8 semesters');
    }

    const courseid = generateUniqueId(); // Implement this function
    const course = { courseid: courseid, coursename: coursename, duration: duration, semcount: semcount };
    
    await INSERT.into(Courses).entries(course);
    return course;
  });

  this.on('addSubject', async (req) => {
    const { subjectname, semnum } = req.data;
    const subjectid = generateUniqueId(); // Implement this function
    const subject = { subjectid: subjectid, subjectname: subjectname, semnum: semnum};
    
    await INSERT.into(Subjects).entries(subject);
    return subject;
  });

  this.on('SelectedCourse', async (req) => {
    const { courseid, coursname, semnumber, subjectid } = req.data;
    
    if (subjectid.length > 6) {
      return req.error(400, 'A course cannot have more than 6 subjects');
    }

    const Selectedcourseid = generateUniqueId(); // Implement this function
    const selectedcourse = { 
      selectedcourseid: selectedcourseid, 
      Course_courseid: courseid, 
      Semester_semnum: semnum,
      Subjects: subjectids.map(id => ({ subjectid: id }))
    };
    
    await INSERT.into(SelectedCourses).entries(selectedcourse);
    return selectedcourse;
  });
});