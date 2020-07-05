//
//  UIView+Extension.swift
//  WKCat
//
//  Created by anita on 2020/7/5.
//  Copyright © 2020 anita. All rights reserved.
//

import Foundation
import UIKit
public extension UIView
{
    func addView(rect:CGRect,bgColor:UIColor) -> UIView
    {
        let view = UIView.init(frame: rect)
        view.backgroundColor = bgColor
        self .addSubview(view)
        return view
    }
    
    func addImageView(rect:CGRect,image:UIImage?) -> UIImageView {
        let imgeView = UIImageView.init(frame: rect)
        imgeView.image = image
        self .addSubview(imgeView);
        return imgeView;
    }
}
