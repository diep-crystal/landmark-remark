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
    
    //MARK:- Private properties
    private let viewModel = RemarkListViewModel()
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func fillData(locations: [LocationModel]?) {
        guard let locations = locations else {
            return
        }
        viewModel.objectList?.value = locations
    }
    
    //MARK:- Private methods
    private func setupTableView() {
        tableView.registerCell(nibName: RemarkItemTableViewCell.className)
    }
    
    private func setupViewModel() {
        
        viewModel.objectList?.subcribe(hdl: { [weak self](locations: [LocationModel]) in
            self?.tableView.reloadData()
        })
    }
}

//MARK:- UITableViewDataSource
extension RemarkListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RemarkItemTableViewCell.className, for: indexPath) as? RemarkItemTableViewCell else {
            return UITableViewCell()
        }
        cell.item = viewModel.itemAt(index: indexPath.row)
        return cell
    }
}

//MARK:- UITableViewDelegate
extension RemarkListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // TODO
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
