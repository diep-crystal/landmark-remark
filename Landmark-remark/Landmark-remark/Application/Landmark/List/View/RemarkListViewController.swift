//
//  RemarkListViewController.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class RemarkListViewController: BaseViewController {

    //MARK:- Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

//MARK:- UITableViewDataSource
extension RemarkListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

//MARK:- UITableViewDelegate
extension RemarkListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
}
