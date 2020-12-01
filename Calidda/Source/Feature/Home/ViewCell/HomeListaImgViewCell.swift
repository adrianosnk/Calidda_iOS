//
//  GeneralDataViewCell.swift
//  App
//
//  Created by Raul Quispe on 6/14/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

final class HomeListaImgViewCell: UITableViewCell {
    static let reuseIdentifier = "HomeListaImgViewCell"
    @IBOutlet weak var iconImage:UIImageView!
    @IBOutlet weak var titleDataLabel:UILabel!
    @IBOutlet weak var valueDataLabel:UILabel!
    
    
    @IBOutlet weak var titleServiceLabel:UILabel!
    @IBOutlet weak var descriptionServiceLabel:UILabel!
    @IBOutlet weak var imgIcon:UIImageView!
    @IBOutlet weak var imgDesIcon:UIImageView!
    @IBOutlet weak var viwBack:UIView!
    
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
        
           titleServiceLabel.textColor = CaliddaColors.blackDark
           descriptionServiceLabel.textColor = CaliddaColors.lightDark
           
          // viwBack.layer.cornerRadius = 8;
          // viwBack.layer.masksToBounds = true;
           
           titleServiceLabel.text = services.service_name!
           
           
           if services.service_code! == "001" {
           //    imgIcon.image =  CaliddaImage.getImage(named: .img_chat_home)
           }else if services.service_code! == "002" {
           //    imgIcon.image =  CaliddaImage.getImage(named: .img_videocall_home)
           }else if services.service_code! == "003" {
            //   imgIcon.image =  CaliddaImage.getImage(named: .img_calendar_home)
           }else if services.service_code! == "004" {
            //   imgIcon.image =  CaliddaImage.getImage(named: .img_atention_home)
           }else if services.service_code! == "005" {
             //  imgIcon.image =  CaliddaImage.getImage(named: .img_schedule_home)
           }
           
           descriptionServiceLabel.text = services.service_description!
       }
    
}
