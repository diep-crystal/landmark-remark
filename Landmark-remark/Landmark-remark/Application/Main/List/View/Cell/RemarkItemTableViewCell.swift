//
//  RemarkItemTableViewCell.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class RemarkItemTableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var imageLocation: UIImageView!
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelNote: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    var item: LocationModel? {
        didSet {
            guard let model = item else {
                return
            }
            
            labelDate.text = model.timeCreated?.dateString
            labelNote.text = model.note
            labelUserName.text = model.username
            imageLocation.image = UIImage(named: "Maps-icon")
        }
    }
}
