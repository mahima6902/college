namespace college;
using {cuid, managed}  from '@sap/cds/common';
using {vh} from '../db/valuehelp';

//table A - course details
entity Course {
  key courseid : String;
  coursename : String;
  duration : Integer;
  semcount: Integer;
  semesters : Association to many Semester on semesters.course = $self;
}

//table B - Semester details
entity Semester {
  key semnum : Integer;
  key subcode : String;
  subjectname : Association to Subject;
  course : Association to Course;
}

//table C - Subject details
entity Subject {
  key subjectid : String;
  subjectname : String;
  description : String;
}

//table D - Selected course details
entity SelectedCourse {
  key selectedcourseid : String;
  course : Association to Course;
  semnumber : Association to Semester;
  subject : Association to many Subject;
}