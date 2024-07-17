using {CollegeService as srv} from './service';
using {college as clg} from '../db/college';


//annotations for table - A
@odata.draft.enabled
annotate clg.Course with @(UI: {

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
});


//annotations for table - B
@odata.draft.enabled
annotate clg.Semester with @(UI: {

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

    LineItem                  : [
        {
            $Type: 'UI.DataField',
            Value: selectedcourseid,
            Label: 'Selected Course ID'
        }
    ],
});