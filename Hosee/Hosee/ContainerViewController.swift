//
//  ContainerViewController.swift
//  Hosee
//
//  Created by Duc Anh on 3/22/19.
//  Copyright © 2019 Minh Thang. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController, HomeViewControllerDelegate {
   
    

    @IBOutlet weak var btnLeflSlide: UIButton!
    @IBOutlet weak var leftSlideMenu: UIView!
    @IBOutlet weak var leftContraint: NSLayoutConstraint!
    
    var isLeftSlideMenuOpen: Bool = false {
        didSet {
            if isLeftSlideMenuOpen {
              leftContraint.constant = 0
            btnLeflSlide.alpha = 0.4
            } else {
                leftContraint.constant = -(leftSlideMenu.bounds.size.width + 15)
                btnLeflSlide.alpha = 0
            }
            UIView.animate(withDuration: 0.35) {
                self.view.layoutIfNeeded()
            }
        }
        
    }
    
    func openSlideMenu() {
        isLeftSlideMenuOpen = !isLeftSlideMenuOpen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        isLeftSlideMenuOpen = false
    }

    @IBAction func onClickBack(_ sender: UIButton) {
        openSlideMenu()
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       let destination = segue.destination as? UINavigationController
        let mainVC = destination?.topViewController as? HomeViewController
        mainVC?.delegate = self
    }

    
}
