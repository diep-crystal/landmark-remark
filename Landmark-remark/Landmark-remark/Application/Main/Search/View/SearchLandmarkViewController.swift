//
//  SearchViewController.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class SearchLandmarkViewController: BaseViewController {

    //MARK:- Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBox: UITextField!
    
    //MARK:- Private properties
    private let viewModel = SearchLandmarkViewModel()
    private var dismissGesture: UITapGestureRecognizer?
    
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupKeyboardListener()
        setupViewModel()
        viewModel.search(inputText: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        searchBox.becomeFirstResponder()
    }
    
    func fillData(locations: [LocationModel]?) {
        guard let locations = locations else {
            return
        }
        viewModel.originalList = locations
    }
    
    //MARK:- Private methods
    
    private func setupUI() {
        dismissGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tableView.registerCell(nibName: RemarkItemTableViewCell.className)
    }
    
    private func setupKeyboardListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidDisappear(noti:)), name: UIResponder.keyboardDidHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidAppear(noti:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    }
    
    private func setupViewModel() {
        viewModel.searchList?.subcribe(hdl: { [weak self](locations: [LocationModel]) in
            self?.tableView.reloadData()
        })
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func keyboardDidDisappear(noti: Notification) {
        guard let gesture = dismissGesture else {
            return
        }
        view.removeGestureRecognizer(gesture)
    }
    
    @objc private func keyboardDidAppear(noti: Notification) {
        guard let gesture = dismissGesture else {
            return
        }
        view.addGestureRecognizer(gesture)
    }
    
    //MARK:- Actions
    @IBAction private func actionBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func textFieldDidChanged(_ sender: UITextField) {
        print("\(sender.text ?? "")")
        viewModel.search(inputText: sender.text)
    }
}

extension SearchLandmarkViewController: UITableViewDataSource {
    
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

extension SearchLandmarkViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO
    }
}

extension SearchLandmarkViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
