sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'college/test/integration/FirstJourney',
		'college/test/integration/pages/CourseList',
		'college/test/integration/pages/CourseObjectPage',
		'college/test/integration/pages/SemesterObjectPage'
    ],
    function(JourneyRunner, opaJourney, CourseList, CourseObjectPage, SemesterObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('college') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheCourseList: CourseList,
					onTheCourseObjectPage: CourseObjectPage,
					onTheSemesterObjectPage: SemesterObjectPage
                }
            },
            opaJourney.run
        );
    }
);