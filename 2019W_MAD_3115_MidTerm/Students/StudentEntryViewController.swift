//
//  StudentEntryViewController.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by MacStudent on 2019-03-19.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentEntryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    @IBOutlet weak var studentId: UITextField!
    
    @IBOutlet weak var studentName: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var courses: UIPickerView!
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var markOne: UITextField!
    @IBOutlet weak var markTwo: UITextField!
    @IBOutlet weak var markThree: UITextField!
    @IBOutlet weak var markFour: UITextField!
    @IBOutlet weak var markFive: UITextField!
    
    private var date: String?
    private var totalMarks: Float?
    private var percentage: Float?
    private var grade: String?
    
    private var count: Int = 0

    private var coursesArray : [String] = ["MAD3115","MAD3004","CBD2303","MAD3125"]
    private var selectedCourse : String?
    
    private var studentArray = [Student]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Student Entry"
        self.courses.delegate = self
        self.courses.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func genderString() -> String {
        if(gender.selectedSegmentIndex == 0)
        {
            return gender.titleForSegment(at: 0) ?? "Default"
        }
        else if(gender.selectedSegmentIndex == 1)
        {
            return gender.titleForSegment(at: 1) ?? "Default"
        }
        return "Default"
    }
    
    @IBAction func datePicker(_ sender: UIDatePicker) {
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "MM/dd/yyyy"
        date = inputFormatter.string(from: sender.date)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.coursesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.coursesArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCourse = self.coursesArray[row]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let svc = segue.destination as? StudentResultViewController {
            svc.setData(student: studentArray)
        }
    }
    
    @IBAction func checkResults(_ sender: UIButton) {
        if (studentId.text != nil && studentName.text != nil && email.text != nil && markOne.text != nil && markTwo.text != nil && markThree.text != nil && markFour.text != nil && markFive.text != nil && selectedCourse != nil) {
            
            var marksA : [Float] = [Float]()
            marksA.append(Float(markOne.text!)!)
            marksA.append(Float(markTwo.text!)!)
            marksA.append(Float(markThree.text!)!)
            marksA.append(Float(markFour.text!)!)
            marksA.append(Float(markFive.text!)!)
            
            totalMarks = (Float(markOne.text!)! + Float(markTwo.text!)! + Float(markThree.text!)! + Float(markFour.text!)! + Float(markFive.text!)!)
            percentage = (totalMarks! / 5)
            
            if (percentage! >= 95.0) {
                grade = "A+"
            } else if (percentage! >= 85.0 && percentage! < 95.0) {
                grade = "A"
            } else if (percentage! >= 75.0 && percentage! < 85.0) {
                grade = "B+"
            } else if (percentage! >= 65.0 && percentage! < 75.0) {
                grade = "B"
            } else if (percentage! >= 55.0 && percentage! < 65.0) {
                grade = "C+"
            } else if (percentage! >= 50.0 && percentage! < 55.0) {
                grade = "C"
            } else if (percentage! >= 45.0 && percentage! < 50.0) {
                grade = "D+"
            } else {
                grade = "FAIL"
            }
            
            for element in marksA {
                if (element < 45.0) {
                    count = count + 1
                }
            }
            if (count >= 2) {
                grade = "FAIL"
                percentage = 0.0
            }
            
            studentArray.append(Student(studentId: studentId.text!, studentName: studentName.text!, gender: genderString(), courseName: selectedCourse!, studentEmail: email.text!, birthDate: date!, percentage: percentage!, totalMarks: totalMarks!, marks: marksA, grade: grade!))
            performSegue(withIdentifier: "studentSegue", sender: nil)
        } else {
            let alert = UIAlertController(title: "Error", message: "Please fill and select all the fields!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    @IBAction func logOut(_ sender: UIButton) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let loginVC = sb.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
        self.present(loginVC, animated: true, completion: nil)
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
