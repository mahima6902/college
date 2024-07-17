using {cuid , managed} from '@sap/cds/common';
using {college as clg} from '../db/college';

namespace vh;

@cds.odata.valuelist
entity Course_VH as
    projection on clg.Course {
        key courseid,
            coursename,
            duration,
            semcount,
    }

@cds.odata.valuelist
entity Semester as
    projection on clg.Semester {
        key semnum,
        key subcode,
            subjectname,
            course,
    }

@cds.odata.valuelist
entity Subject as
    projection on clg.Subject {
        key subjectid,
            subjectname,
            description,
    }

@cds.odata.valuelist
entity SelectedCourse as
    projection on clg.SelectedCourse {
        key selectedcourseid,
            course,
            subject,
            semnumber,
    }
