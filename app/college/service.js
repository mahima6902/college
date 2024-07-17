const cds = require('@sap/cds');
cds.debug = { odata:true, sql:true };
sap.ui.define([
  "sap/ui/core/mvc/Controller",
  "sap/m/MessageBox",
  "sap/ui/model/json/JSONModel"
],

module.exports = cds.service.impl(async function() {
  const { Course, Subject, Semester, SelectedCourse } = this.entities;

  this.on('addCourse', async (req) => {
    const { coursename, duration, semcount } = req.data;
    
    if (semcount > 8) {
      return req.error(400, 'A course cannot have more than 8 semesters');
    }

    const courseid = generateUniqueId(); // Implement this function
    const course = { courseid: courseid, coursename: coursename, duration: duration, semcount: semcount };
    
    await INSERT.into(Course).entries(course);
    return course;
  });

  this.on('Semester', async (req) => {
    const { subcode, semnum} = req.data;
    const semester = { subcode: subcode, subjectname: subjectname, semnum: semnum};
    
    if (subcode.type > String) {
      return req.error(400, 'A Subject Code is not expected to have any other type.');
    }

    await INSERT.into(Semester).entries(semester);
    return semester;

}),

  this.on('addSubject', async (req) => {
    const { subjectname} = req.data;
    const subjectid = generateUniqueId(); // Implement this function
    const subject = { subjectid: subjectid, subjectname: subjectname};
    
    await INSERT.into(Subject).entries(subject);
    return subject;
  });

  this.on('SelectedCourse', async (req) => {
    const { courseid, coursename, semnumber, subjectid } = req.data;
    
    if (subjectid.length > 6) {
      return req.error(400, 'A course cannot have more than 6 subjects');
    }

    const selectedcourseid = generateUniqueId(); 
    const selectedcourse = { 
      selectedcourseid: selectedcourseid, 
      Course_courseid: courseid, 
      Semester_semnum: semnum,
      Subjects: subjectids.map(id => ({ subjectid: id }))
    };
    
    await INSERT.into(SelectedCourse).entries(selectedcourse);
    return selectedcourse;
  });
}),


  function (Controller, MessageBox, JSONModel) {
  "use strict";

  return Controller.extend("college.controller.Main", {
      onInit: function() {

          var oViewModel = new JSONModel({
              newCourse: {},
              newSubject: {},
              selectedCourse: {}
          });
          this.getView().setModel(oViewModel, "viewModel");
      },

      //add new course
      onAddCourse: function() {
          var oViewModel = this.getView().getModel("viewModel");
          var oNewCourse = oViewModel.getProperty("/newCourse");

          if (!oNewCourse.coursename || !oNewCourse.duration || !oNewCourse.semcount) {
              MessageBox.error("Please fill all fields for the new course.");
              return;
          }

          if (oNewCourse.Semcount > 8) {
              MessageBox.error("A course cannot have more than 8 semesters.");
              return;
          }

          var oModel = this.getView().getModel();
          oModel.callFunction("/addCourse", {
              method: "POST",
              urlParameters: {
                  coursename: oNewCourse.coursename,
                  duration: oNewCourse.duration,
                  semcount: oNewCourse.Semcount
              },
              success: function() {
                  MessageBox.success("Course added successfully.");
                  oViewModel.setProperty("/newCourse", {});
                  oModel.refresh();
              },
              error: function(oError) {
                  MessageBox.error("Error adding course: " + oError.message);
              }
          });
      },

      //add new subject
      onAddSubject: function() {
          var oViewModel = this.getView().getModel("viewModel");
          var oNewSubject = oViewModel.getProperty("/newSubject");

          if (!oNewSubject.subjectname || !oNewSubject.description) {
              MessageBox.error("Please fill all fields for the new subject.");
              return;
          }

          var oModel = this.getView().getModel();
          oModel.callFunction("/addSubject", {
              method: "POST",
              urlParameters: {
                  subjectName: oNewSubject.subjectname,
                  description: oNewSubject.description
              },
              success: function() {
                  MessageBox.success("Subject added successfully.");
                  oViewModel.setProperty("/newSubject", {});
                  oModel.refresh();
              },
              error: function(oError) {
                  MessageBox.error("Error adding subject: " + oError.message);
              }
          });
      },

      //select any course
      onSelectCourse: function() {
          var oViewModel = this.getView().getModel("viewModel");
          var oSelectedCourse = oViewModel.getProperty("/selectedCourse");

          if (!oSelectedCourse.courseid || !oSelectedCourse.semnumber || !oSelectedCourse.subjectid) {
              MessageBox.error("Please select a course, semester, and subjects.");
              return;
          }

          if (oSelectedCourse.subjectid.length > 6) {
              MessageBox.error("A course cannot have more than 6 subjects.");
              return;
          }

          var oModel = this.getView().getModel();
          oModel.callFunction("/selectCourse", {
              method: "POST",
              urlParameters: {
                  courseid: oSelectedCourse.courseid,
                  semnumber: oSelectedCourse.semnumber,
                  subject: oSelectedCourse.subject
              },
              success: function() {
                  MessageBox.success("Course selected successfully.");
                  oViewModel.setProperty("/selectedCourse", {});
                  oModel.refresh();
              },
              error: function(oError) {
                  MessageBox.error("Error selecting course: " + oError.message);
              }
          });
      },

      onCourseListItemPress: function(oEvent) {
          var oSelectedItem = oEvent.getSource();
          var oContext = oSelectedItem.getBindingContext();
          var sCourseId = oContext.getProperty("CourseId");
          MessageBox.information("Course selected: " + sCourseId);
      },

      onSubjectListItemPress: function(oEvent) {
          var oSelectedItem = oEvent.getSource();
          var oContext = oSelectedItem.getBindingContext();
          var sSubjectId = oContext.getProperty("subjectid");
          MessageBox.information("Subject selected: " + sSubjectId);
      },

      onSelectedCourseListItemPress: function(oEvent) {
          var oSelectedItem = oEvent.getSource();
          var oContext = oSelectedItem.getBindingContext();
          var sSelectedCourseId = oContext.getProperty("selectedcourseid");
          MessageBox.information("Selected Course ID: " + sSelectedCourseId);
      }
  });
});