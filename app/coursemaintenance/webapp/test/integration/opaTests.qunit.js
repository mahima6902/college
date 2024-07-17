sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'coursemaintenance/test/integration/FirstJourney',
		'coursemaintenance/test/integration/pages/CourseList',
		'coursemaintenance/test/integration/pages/CourseObjectPage',
		'coursemaintenance/test/integration/pages/SemesterObjectPage'
    ],
    function(JourneyRunner, opaJourney, CourseList, CourseObjectPage, SemesterObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('coursemaintenance') + '/index.html'
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