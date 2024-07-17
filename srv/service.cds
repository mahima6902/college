using {college as clg} from '../db/college';

service CollegeService {
  entity Course as projection on clg.Course;
  entity Semester as projection on clg.Semester;
  entity Subject as projection on clg.Subject;
  entity SelectedCourse as projection on clg.SelectedCourse;


  action addCourse(coursename: String, duration: Integer, semcount: Integer) returns Course;
  action addSubject(subjectname: String, semnum: Integer) returns Subject;
  action selectedCourse(courseid: String, coursename: String, semnumber: String, subjectid: array of String) returns SelectedCourse;
}

//annotations for table - A
@odata.draft.enabled
annotate clg.Course with @(UI: {
    CreateHidden              : false,
    UpdateHidden              : false,
    DeleteHidden              : false,
    HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'UMS Page',
        TypeNamePlural: 'UMS Page',
        Title         : {Value: courseid},
        Description   : {Value: 'UMS Page'}
    },

    SelectionFields           : [
        courseid,
        coursename,
        duration,
        semcount
    ],

    LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: courseid,
            Label: 'Course ID'
        },

        {
            $Type: 'UI.DataField',
            Value: coursename,
            Label: 'Course Description'
        },

        {
            $Type: 'UI.DataField',
            Value: duration,
            Label: 'Duration of Course'
        },

        {
            $Type: 'UI.DataField',
            Value: semcount,
            Label: 'Number of Semesters'
        },
    ],

    Facets                    : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : '1',
            Label : 'Course Details',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#CourseEnrolled',
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : '2',
            Label : 'Timing Details',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#DurationTaken',
            }],
        },
    ],

    FieldGroup #CourseEnrolled: {Data: [
        {Value: courseid},
        {Value: coursename},
        {Value: duration},
        {Value: semcount},
    ]},

    FieldGroup #DurationTaken : {Data: [
        {Value: courseid},
        {Value: coursename},
        {
            Value                  : duration,
            ![@Common.FieldControl]: #ReadOnly
        },
        {
            Value                  : semcount,
            ![@Common.FieldControl]: #ReadOnly
        },
    ]},

});


//annotations for table - B
@odata.draft.enabled
annotate clg.Semester with @(UI: {
    CreateHidden              : false,
    UpdateHidden              : false,
    DeleteHidden              : false,
    HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'UMS Page',
        TypeNamePlural: 'UMS Page',
        Title         : {Value: semnum},
        Description   : {Value: 'UMS Page'}
    },

    SelectionFields           : [
        semnum,
        subcode,
    ],

    LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: semnum,
            Label: 'Ongoing Semester'
        },

        {
            $Type: 'UI.DataField',
            Value: subcode,
            Label: 'Code of Subject'
        },
    ],
});


//annotations for table - C
@odata.draft.enabled
annotate clg.Subject with @(UI: {
    CreateHidden              : false,
    UpdateHidden              : false,
    DeleteHidden              : false,
    HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'UMS Page',
        TypeNamePlural: 'UMS Page',
        Title         : {Value: subjectid},
        Description   : {Value: 'UMS Page'}
    },

    SelectionFields           : [
        subjectid,
        subjectname,
        description,
    ],

    LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: subjectid,
            Label: 'Subject ID'
        },

        {
            $Type: 'UI.DataField',
            Value: subjectname,
            Label: 'Name of Subject'
        },

        {
            $Type: 'UI.DataField',
            Value: description,
            Label: 'Description of Subject'
        },
    ],
});


//annotations for table - D
@odata.draft.enabled
annotate clg.SelectedCourse with @(UI: {
    CreateHidden              : false,
    UpdateHidden              : false,
    DeleteHidden              : false,
    HeaderInfo                : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'UMS Page',
        TypeNamePlural: 'UMS Page',
        Title         : {Value: selectedcourseid},
        Description   : {Value: 'UMS Page'}
    },

    SelectionFields           : [
        selectedcourseid
    ],

    LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: selectedcourseid,
            Label: 'Selected Course ID'
        }
    ],
});