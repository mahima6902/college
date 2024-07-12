using college from '../db/college';

service CollegeService {
  entity Course as projection on college.Course;
  entity Semester as projection on college.Semester;
  entity Subject as projection on college.Subject;
  entity SelectedCourse as projection on college.SelectedCourse;

  action addCourse(coursename: String, duration: Integer, semcount: Integer) returns Course;
  action addSubject(subjectname: String, semnum: Integer) returns Subject;
  action selectedCourse(courseid: String, coursename: String, semnumber: String, subjectid: array of String) returns SelectedCourse;
}