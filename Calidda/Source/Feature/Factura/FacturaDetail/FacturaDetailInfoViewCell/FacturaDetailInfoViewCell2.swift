//
//  GeneralDataViewCell.swift
//  App
//
//  Created by Raul Quispe on 6/14/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

final class FacturaDetailInfoViewCell2: UITableViewCell {
    static let reuseIdentifier = "FacturaDetailInfoViewCell2"
    @IBOutlet weak var iconImage:UIImageView!
    @IBOutlet weak var titleDataLabel:UILabel!
    @IBOutlet weak var valueDataLabel:UILabel!
     
    
    @IBOutlet var viwBackContentDeman:UIView!
    @IBOutlet var viwBackContentFac:UIView!
    @IBOutlet var viwBackContentInd:UIView!
    @IBOutlet var viwBackContentMant:UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
        self.viwBackContentDeman.layer.cornerRadius = 8
        self.viwBackContentDeman.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viwBackContentDeman.layer.shadowOpacity = 8
        self.viwBackContentDeman.layer.shadowOffset = .zero
        self.viwBackContentDeman.layer.shadowRadius = 4
        
        
        self.viwBackContentFac.layer.cornerRadius = 8
        self.viwBackContentFac.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viwBackContentFac.layer.shadowOpacity = 8
        self.viwBackContentFac.layer.shadowOffset = .zero
        self.viwBackContentFac.layer.shadowRadius = 4

        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func loadWithData(_ speciality:String,_ image:UIImage,_ title:String){
        titleDataLabel.text = title
        valueDataLabel.text = speciality
        iconImage.image = image
    }
}
