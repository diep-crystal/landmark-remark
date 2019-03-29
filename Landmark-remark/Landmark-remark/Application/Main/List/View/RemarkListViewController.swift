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
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var labelEmpty: UILabel!
    
    //MARK:- Private properties
    private let viewModel = RemarkListViewModel()
    private var isEmptyList: Bool = false {
        didSet {
            tableView.isHidden = isEmptyList
            labelEmpty.isHidden = !isEmptyList
            labelEmpty.text = "landmark.list.empty.list".localize()
        }
    }
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func fillData(locations: [LocationModel]?) {
        guard let locations = locations else {
            return
        }
        viewModel.objectList?.value = locations
    }
    
    //MARK:- Private methods
    private func setupUI() {
        isEmptyList = viewModel.numberOfItems() == 0
        tableView.registerCell(nibName: RemarkItemTableViewCell.className)
    }
    
    private func setupViewModel() {
        
        viewModel.objectList?.subcribe(hdl: { [weak self](locations: [LocationModel]) in
            self?.isEmptyList = locations.count == 0
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
