//
//  GeneralDataViewCell.swift
//  App
//
//  Created by Raul Quispe on 6/14/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

final class FacturaListaFirstDetailInfoViewCell: UITableViewCell {
    static let reuseIdentifier = "FacturaListaFirstDetailInfoViewCell"
    @IBOutlet weak var iconImage:UIImageView!
    @IBOutlet weak var titleDataLabel:UILabel!
    @IBOutlet weak var valueDataLabel:UILabel!
    
    
    @IBOutlet weak var imgIcon:UIImageView!
    @IBOutlet weak var viwBack:UIView!
    
    
    @IBOutlet var viwBackContent:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  /*  func loadWithData(_ speciality:String,_ image:UIImage,_ title:String){
        titleDataLabel.text = title
        valueDataLabel.text = speciality
        iconImage.image = image
    }*/
    func loadWith(services:HomeServices){
           self.selectionStyle = .none
          // style.apply(textStyle: .titleService, to: titleServiceLabel)
           //style.apply(textStyle: .subtitle, to: descriptionServiceLabel)
        
       
          // viwBack.layer.cornerRadius = 8;
          // viwBack.layer.masksToBounds = true;
           
   
       }
    
}
