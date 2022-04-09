//
//  SwiftAvatar.swift
//  ExtendedSwiftAvatar
//
//  Created by Angelos Staboulis on 9/4/22.
//

import UIKit
@IBDesignable
class SwiftAvatar: UIView {
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    @IBInspectable var urlMainPicture : String!
    @IBInspectable var location:String!
    @IBInspectable var imageX:NSNumber!
    @IBInspectable var imageY:NSNumber!
    @IBInspectable var imageWidth:NSNumber!
    @IBInspectable var imageHeight:NSNumber!
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.showImage()
    }
    func showImage(){
        DispatchQueue.main.async{
            do{
                if self.location.contains("local") == false{
                    let urlPicture = URL(string: self.urlMainPicture!)
                    let dataImage = try Data(contentsOf: urlPicture!)
                    let image = UIImage(data: dataImage)
                    let imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: self.imageX.doubleValue, y: self.imageY.doubleValue, width: self.imageWidth.doubleValue, height: self.imageHeight.doubleValue)
                    imageView.layer.cornerRadius = self.imageHeight.doubleValue / 2
                    imageView.layer.masksToBounds = true
                    self.addSubview(imageView)
                    return
                }
                else{
                    let urlPicture = URL(fileURLWithPath:self.urlMainPicture)
                    let dataImage = try Data(contentsOf: urlPicture)
                    let image = UIImage(data: dataImage)
                    let imageView = UIImageView(image: image)
                    imageView.frame = CGRect(x: self.imageX.doubleValue, y: self.imageY.doubleValue, width: self.imageWidth.doubleValue, height: self.imageHeight.doubleValue)
                    imageView.layer.cornerRadius = self.imageHeight.doubleValue / 2
                    imageView.layer.masksToBounds = true
                    self.addSubview(imageView)
                }
            }
            catch{
                debugPrint("something went wrong!!!!!")
            }
        }
    }
}
