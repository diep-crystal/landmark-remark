//
//  PopupSaveLocation.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation
import UIKit

final class PopupSaveLocation: BasePopupView {
    
    //MARK:- Outlets
    @IBOutlet private weak var buttonSave: UIButton!
    @IBOutlet private weak var usernameTextField: UITextField!
    @IBOutlet private weak var notesTextView: UITextView!
    
    //MAKR:- Private properties
    private var leftClosure: (() -> Void)?
    private var rightClosure: ((AddLocationModel) -> Void)?
    private let viewModel = PopupSaveLocationViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        buttonSave.backgroundColor = .gray
        viewModel.validateCompleted?.subcribe(hdl: { [weak self](isValid: Bool) in
            self?.buttonSave.isEnabled = isValid
            self?.buttonSave.backgroundColor = isValid ? .orange : .gray
        })
    }
    
    //MARK:- Public method
    func willShow(leftClosure: (() -> Void)? = nil, rightClosure: ((AddLocationModel) -> Void)? = nil) {
        self.usernameTextField.delegate = self
        self.notesTextView.delegate = self
        
        show(popupView: self, with: self.frame)
        self.leftClosure = leftClosure
        self.rightClosure = rightClosure
    }
    
    //MARK:- Actions
    @IBAction private func actionSave(_ sender: UIButton) {
        endEditing(true)
        dismiss()
        rightClosure?(viewModel.model)
    }
  
    @IBAction private func actionCancel(_ sender: UIButton) {
        dismiss()
        leftClosure?()
    }
}

//MARK:- UITextViewDelegate
extension PopupSaveLocation: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.model.note = textView.text
        viewModel.validateData()
    }
}

//MARK:- UITextFieldDelegate
extension PopupSaveLocation: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        viewModel.model.username = textField.text
        viewModel.validateData()
    }
}
