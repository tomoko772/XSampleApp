//
//  UIIMafe+Resizing.swift
//  XSampleApp
//
//  Created by Tomoko T. Nakao on 2025/02/16.
//
import UIKit

extension UIImage {
    /// UIImageの拡張機能を作成してリサイズ&円にする
    func makeCircularImage(image: UIImage, size: CGSize) -> UIImage? {
        let rect = CGRect(origin: .zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let path = UIBezierPath(ovalIn: rect)
        path.addClip()
        image.draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}
