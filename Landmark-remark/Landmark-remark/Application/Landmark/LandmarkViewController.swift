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
    var mapViewController: RemarkMapViewController?
    var listViewController: RemarkListViewController?
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(mode: .Map)
    }
    
    //MARK:- Private methods
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
            }
            remove(asChildViewController: mapViewController)
            add(containerView: containerView, asChildViewController: listViewController)
        }
    }
    
    //MARK:- Actions
    @IBAction private func saveLocation(_ sender: UIButton) {
        
    }
    
    @IBAction private func switchSegment(_ sender: UISegmentedControl) {
        
        guard let mode = LandmarkMode(rawValue: sender.selectedSegmentIndex) else {
            return
        }
        
        setupView(mode: mode)
    }
}


