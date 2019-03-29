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
    private var locationManager: CLLocationManager!
    private var currentLocation: CLLocation?
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        requestLocationAuthorizationStatus()
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
            let newCollection = self?.viewModel.loadLocationSuccess?.value
            newCollection?.objectList.append(model)
            if self?.currentMode == .Map {
                self?.mapViewController?.showAnnotations(locations: newCollection?.objectList)
            } else {
                self?.listViewController?.fillData(locations: newCollection?.objectList)
            }
        })
        
        viewModel.requestApiFailed?.subcribe(hdl: { [weak self](errorMsg: String) in
            self?.showMessage(msg: errorMsg)
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
    
    private func requestLocationAuthorizationStatus() {
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    
    //MARK:- Actions
    @IBAction private func saveLocation(_ sender: UIButton) {
        let popupView = PopupSaveLocation.fromNib() as PopupSaveLocation
        popupView.willShow(rightClosure: { [weak self](model) in
            
            guard let newLat = self?.currentLocation?.coordinate.latitude,
                let newLong = self?.currentLocation?.coordinate.longitude else {
                    return
            }
            
            var newLocation = model
            newLocation.latitude = "\(newLat)"
            newLocation.longitude = "\(newLong)"
            
            self?.viewModel.saveLocation(model: newLocation)
        })
    }
    
    @IBAction private func actionSearch(_ sender: UIButton) {
        let searchViewController = SearchLandmarkViewController()
        searchViewController.fillData(locations: viewModel.loadLocationSuccess?.value?.objectList)
        navigationController?.pushViewController(searchViewController, animated: true)
    }
    
    @IBAction private func switchSegment(_ sender: UISegmentedControl) {
        
        guard let mode = LandmarkMode(rawValue: sender.selectedSegmentIndex), currentMode != mode else {
            return
        }
        
        currentMode = mode
        setupView(mode: mode)
    }
}

// MARK:- CLLocationManagerDelegate
extension LandmarkViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        defer {
            currentLocation = locations.last
        }
        
        if currentLocation == nil {
            if let userLocation = locations.last {
                mapViewController?.focusMapOn(location: userLocation)
            }
        }
    }
}


