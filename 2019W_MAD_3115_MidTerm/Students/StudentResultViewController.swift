//
//  StudentResultViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentResultViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var studentResults: UITableView!
    
    private var studentResultsArray = [Student]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Results"
        self.studentResults.delegate = self
        self.studentResults.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func setData(student: [Student]) {
        studentResultsArray = student
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentResultsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let resultCell = tableView.dequeueReusableCell(withIdentifier: "resultCell") as! StudentResultTableViewCell
        
        let student = self.studentResultsArray[indexPath.row]
        
        resultCell.id.text = student.getStudentId()
        resultCell.name.text = student.getStudentName()
        resultCell.gender.text = student.getGender()
        resultCell.course.text = student.getCourseName()
        resultCell.mail.text = student.getStudentEMail()
        resultCell.date.text = student.getBirthDate()
        
        resultCell.markOne.text = String(student.getMarks()[0])
        resultCell.markTwo.text = String(student.getMarks()[1])
        resultCell.markThree.text = String(student.getMarks()[2])
        resultCell.markFour.text = String(student.getMarks()[3])
        resultCell.markFive.text = String(student.getMarks()[4])
        
        resultCell.totalMarks.text = String(student.getTotalMarks())
        resultCell.percentage.text = String(student.getPercentage())
    
        if student.getPercentage() > 45.0 {
            resultCell.result.textColor = UIColor.green
            resultCell.result.text = student.getGrade()
        } else {
            resultCell.result.textColor = UIColor.red
            resultCell.result.text = student.getGrade()
        }
        
        return resultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 235.0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
