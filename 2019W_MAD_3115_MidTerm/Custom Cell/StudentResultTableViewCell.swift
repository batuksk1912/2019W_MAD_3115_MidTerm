//
//  StudentResultTableViewCell.swift
//  2019W_MAD_3115_MidTerm
//
//  Created by Baturay Kayatürk on 2019-03-20.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class StudentResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var id: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var course: UILabel!
    @IBOutlet weak var mail: UILabel!
    @IBOutlet weak var date: UILabel!
    
    @IBOutlet weak var markOne: UILabel!
    @IBOutlet weak var markTwo: UILabel!
    @IBOutlet weak var markThree: UILabel!
    @IBOutlet weak var markFour: UILabel!
    @IBOutlet weak var markFive: UILabel!
    
    @IBOutlet weak var totalMarks: UILabel!
    @IBOutlet weak var percentage: UILabel!
    @IBOutlet weak var result: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
