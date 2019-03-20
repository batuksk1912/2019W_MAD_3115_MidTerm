//
//  Student.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import Foundation

class Student {
    
    private var studentId:String?
    private var studentName:String?
    private var gender:String?
    private var courseName:String?
    private var studentEmail:String?
    private var birthDate:String?
    private var percentage:Float?
    private var totalMarks:Float?
    private var marks:[Float]?
    private var grade: String?
    
    init(studentId : String , studentName : String , gender : String , courseName : String, studentEmail : String , birthDate : String , percentage : Float , totalMarks : Float , marks : [Float], grade: String) {
        
        self.studentId = studentId
        self.studentName = studentName
        self.gender = gender
        self.courseName = courseName
        self.studentEmail = studentEmail
        self.birthDate = birthDate
        self.percentage = percentage
        self.totalMarks = totalMarks
        self.marks = marks
        self.grade = grade
    }
    
    func getStudentId() -> String {
        return studentId ?? "-1"
    }
    
    func getStudentName() -> String {
        return studentName ?? "-1"
    }
    
    func getGender() -> String {
        return gender ?? "-1"
    }
    
    func getCourseName() -> String {
        return courseName ?? "-1"
    }
    
    func getStudentEMail() -> String {
        return studentEmail ?? "-1"
    }
    
    func getBirthDate() -> String {
        return birthDate ?? "-1"
    }
    
    func getPercentage() -> Float {
        return percentage ?? 0.0
    }
    
    func getTotalMarks() -> Float {
        return totalMarks ?? 0.0
    }
    
    func getMarks() -> [Float] {
        return marks ?? [0.0]
    }
    
    func getGrade() -> String {
        return grade ?? "-1"
    }
}
