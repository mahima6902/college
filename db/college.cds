namespace college;
using {cuid, managed}  from '@sap/cds/common';

entity Course {
  key courseid : String;
  coursename : String;
  duration : Integer;
  semcount: Integer;
  semesters : Association to many Semester on semesters.course = $self;
}

entity Semester {
  key semnum : Integer;
  key subcode : String;
  subjectname : Association to Subject;
  course : Association to Course;
}

entity Subject {
  key subjectid : String;
  subjectname : String;
  description : String;
}

entity SelectedCourse {
  key selectedcourseid : String;
  course : Association to Course;
  semnumber : Association to Semester;
  subject : Association to many Subject;
}