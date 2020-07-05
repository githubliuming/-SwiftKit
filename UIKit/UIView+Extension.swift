//
//  UIView+Extension.swift
//  WKCat
//
//  Created by anita on 2020/7/5.
//  Copyright © 2020 anita. All rights reserved.
//

import Foundation
import UIKit
public extension UIView {
    func addLabel(fontSize: CGFloat, text: String, textColor: UIColor, bgColor: UIColor) -> UILabel {
        return addLabel(font: UIFont.systemFont(ofSize: fontSize),
                        text: text,
                        textColor: textColor,
                        bgColor: bgColor)
    }

    func addLabel(font: UIFont, text: String, textColor: UIColor, bgColor: UIColor) -> UILabel {
        let label = UILabel(frame: .zero)
        label.font = font
        label.text = text
        label.textColor = textColor
        label.backgroundColor = bgColor
        addSubview(label)
        return label
    }

    func addView(rect: CGRect, bgColor: UIColor) -> UIView {
        let view = UIView(frame: rect)
        view.backgroundColor = bgColor
        addSubview(view)
        return view
    }

    func addImageView(rect: CGRect, image: UIImage?) -> UIImageView {
        let imgeView = UIImageView(frame: rect)
        imgeView.image = image
        addSubview(imgeView)
        return imgeView
    }

    func addButton(rect: CGRect, title: String, titleColor: UIColor, font: UIFont, image: UIImage?, bgImg: UIImage?, target: Any?, action: Selector?, event: UIControl.Event?) -> UIButton {
        let btn = UIButton(type: .custom)
        btn.frame = rect
        btn.setTitle(title, for: .normal)
        btn.setTitle(title, for: .highlighted)
        btn.setTitleColor(titleColor, for: .normal)
        btn.setTitleColor(titleColor, for: .highlighted)
        btn.setImage(image, for: .normal)
        btn.setImage(image, for: .highlighted)
        btn.setBackgroundImage(bgImg, for: .normal)
        btn.setBackgroundImage(bgImg, for: .highlighted)
        btn.titleLabel?.font = font
        if let sel = action, let e = event {
            btn.addTarget(target, action: sel, for: e)
        }
        addSubview(btn)
        return btn
    }

    func addButton(rect: CGRect, title: String, titleColor: UIColor, target: Any?, action: Selector?, event: UIControl.Event?) -> UIButton {
        return addButton(rect: rect,
                         title: title,
                         titleColor: titleColor,
                         font: UIFont.systemFont(ofSize: 14),
                         image: nil,
                         bgImg: nil,
                         target: target,
                         action: action,
                         event: event)
    }

    func addButton(rect: CGRect, image: UIImage, target: Any?, action: Selector?, event: UIControl.Event?) -> UIButton {
        return addButton(rect: rect,
                         title: "",
                         titleColor: .white,
                         font: UIFont.systemFont(ofSize: 14),
                         image: image,
                         bgImg: nil,
                         target: target,
                         action: action,
                         event: event)
    }

    func corenerRadius(size: CGSize, corners: UIRectCorner) {
        let maskpath = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskpath.cgPath
        layer.mask = maskLayer
    }

    func cornerRadius(radius: CGFloat) {
        corenerRadius(size: CGSize(width: radius, height: radius), corners: .allCorners)
    }

    func addTableView(rect: CGRect, delegate: Any) -> UITableView {
        let tableView = UITableView(frame: rect)
        tableView.delegate = delegate as? UITableViewDelegate
        tableView.dataSource = delegate as? UITableViewDataSource
        backgroundColor = .white
        tableView.tableFooterView = UIView()
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }
        return tableView
    }
}
