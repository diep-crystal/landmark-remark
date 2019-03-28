//
//  ViewController.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit
import MapKit

enum LandmarkMode: Int {
    case Map
    case List
}

final class LandmarkViewController: BaseViewController {

    //MARK:- Outlets
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    //MARK:- Private properties
    private var mapViewController: RemarkMapViewController?
    private var listViewController: RemarkListViewController?
    private var currentMode: LandmarkMode = .Map
    private let viewModel = LandmarkViewModel()
    
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(mode: .Map)
        setupViewModel()
        viewModel.getLocations()
    }
    
    //MARK:- Private methods
    private func setupViewModel() {
        viewModel.loadLocationSuccess?.subcribe(hdl: { [weak self](collection: LocationCollection) in
            self?.mapViewController?.showAnnotations(locations: collection.objectList)
        })
        
        viewModel.addLocationSuccess?.subcribe(hdl: { [weak self](model: LocationModel) in
//            self
        })
    }
    
    private func setupView(mode: LandmarkMode) {
    
        switch mode {
        case .Map:
            if mapViewController == nil {
                mapViewController = RemarkMapViewController()
            }
            remove(asChildViewController: listViewController)
            add(containerView: containerView, asChildViewController: mapViewController)
        case .List:
            if listViewController == nil {
                listViewController = RemarkListViewController()
                listViewController?.fillData(locations: viewModel.loadLocationSuccess?.value?.objectList)
            }
            remove(asChildViewController: mapViewController)
            add(containerView: containerView, asChildViewController: listViewController)
        }
    }
    
    //MARK:- Actions
    @IBAction private func saveLocation(_ sender: UIButton) {
        let popupView = PopupSaveLocation.fromNib() as PopupSaveLocation
        popupView.willShow(firstButtonClosure: {
            //
        }) {
            
        }
    }
    
    @IBAction private func switchSegment(_ sender: UISegmentedControl) {
        
        guard let mode = LandmarkMode(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        
        guard currentMode != mode else {
            return
        }
        
        currentMode = mode
        setupView(mode: mode)
    }
}


