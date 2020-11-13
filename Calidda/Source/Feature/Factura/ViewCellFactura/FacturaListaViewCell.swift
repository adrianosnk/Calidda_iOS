//
//  GeneralDataViewCell.swift
//  App
//
//  Created by Raul Quispe on 6/14/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

final class FacturaListaViewCell: UITableViewCell {
    static let reuseIdentifier = "FacturaListaViewCell"
    @IBOutlet weak var iconImage:UIImageView!
    @IBOutlet weak var titleDataLabel:UILabel!
    @IBOutlet weak var valueDataLabel:UILabel!
    
    
    @IBOutlet weak var titleServiceLabel:UILabel!
    @IBOutlet weak var descriptionServiceLabel:UILabel!
    @IBOutlet weak var imgIcon:UIImageView!
    @IBOutlet weak var viwBack:UIView!
    
    
    @IBOutlet weak var anioLabel:UILabel!
    @IBOutlet weak var mesLabel:UILabel!
    @IBOutlet weak var importeLabel:UILabel!
    @IBOutlet weak var fechVenLabel:UILabel!
    @IBOutlet var viwBackContent:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.viwBackContent.layer.cornerRadius = 10
        self.viwBackContent.layer.borderWidth = 2
        self.viwBackContent.backgroundColor = .white
        self.viwBackContent.layer.borderColor = CaliddaColors.lightShadowDarkLiner.cgColor
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
    func loadWith(services:[ResponseFacturaData],index:Int){
           self.selectionStyle = .none
          // style.apply(textStyle: .titleService, to: titleServiceLabel)
           //style.apply(textStyle: .subtitle, to: descriptionServiceLabel)
        
           titleServiceLabel.textColor = CaliddaColors.blackDark
           descriptionServiceLabel.textColor = CaliddaColors.lightDark
           
          // viwBack.layer.cornerRadius = 8;
          // viwBack.layer.masksToBounds = true;
           
           titleServiceLabel.text = services[index].FechaVencimiento
           
     
           
       }
    
}
