//
//  LYBaseNavigationController.swift
//  WKCat
//
//  Created by anita on 2020/7/12.
//  Copyright © 2020 anita. All rights reserved.
//

import UIKit

class LYBaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
        } else {
            viewController.hidesBottomBarWhenPushed = false;
        }
        super .pushViewController(viewController, animated: animated)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
