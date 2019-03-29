//
//  BaseViewController.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    init() {
        super.init(nibName: String(describing: type(of: self)), bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showMessage(msg: String) {
        let alertVC = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "common.ok".localize(), style: .default, handler: nil)
        alertVC.addAction(okAction)
        present(alertVC, animated: true, completion: nil)
    }
}
