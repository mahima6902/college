using CollegeService as service from '../../srv/service';
annotate service.Course with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'courseid',
                Value : courseid,
            },
            {
                $Type : 'UI.DataField',
                Label : 'coursename',
                Value : coursename,
            },
            {
                $Type : 'UI.DataField',
                Label : 'duration',
                Value : duration,
            },
            {
                $Type : 'UI.DataField',
                Label : 'semcount',
                Value : semcount,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'courseid',
            Value : courseid,
        },
        {
            $Type : 'UI.DataField',
            Label : 'coursename',
            Value : coursename,
        },
        {
            $Type : 'UI.DataField',
            Label : 'duration',
            Value : duration,
        },
        {
            $Type : 'UI.DataField',
            Label : 'semcount',
            Value : semcount,
        },
    ],
);

