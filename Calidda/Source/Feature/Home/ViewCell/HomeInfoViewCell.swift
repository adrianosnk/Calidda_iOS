//
//  GeneralDataViewCell.swift
//  App
//
//  Created by Raul Quispe on 6/14/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

final class HomeInfoViewCell: UITableViewCell {
    static let reuseIdentifier = "HomeInfoViewCell"
    @IBOutlet weak var iconImage:UIImageView!
    @IBOutlet weak var titleDataLabel:UILabel!
    @IBOutlet weak var valueDataLabel:UILabel!
     
    
    @IBOutlet var viwBackContentDeman:UIView!
    @IBOutlet var viwBackContentFac:UIView!
    @IBOutlet var viwBackContentInd:UIView!
    @IBOutlet var viwBackContentMant:UIView!
    
    
    @IBOutlet var viwBackContentSubDeman:UIView!
    @IBOutlet var viwBackContentSubFac:UIView!
    @IBOutlet var viwBackContentSubInd:UIView!
    @IBOutlet var viwBackContentSubMant:UIView!
    
    @IBOutlet weak var mountAnteLabel:UILabel!
    @IBOutlet weak var mountDespLabel:UILabel!
    @IBOutlet weak var CalLabel:UILabel!
    
    @IBOutlet weak var facturaYearLabel:UILabel!
    @IBOutlet weak var facturaMountStringLabel:UILabel!
    @IBOutlet weak var facturaVolLabel:UILabel!
    @IBOutlet weak var facturaImpoLabel:UILabel!
    @IBOutlet weak var facturaFechaVencimiento:UILabel!
    @IBOutlet weak var facturaEstado:UILabel!
    
    
    
    @IBOutlet weak var boletinNombreLabel:UILabel!
    @IBOutlet weak var boletinFechaLabel:UILabel!
    @IBOutlet weak var boletinIdArchivo:UILabel!
    
    @IBOutlet var viewIcon:UIView!
    @IBOutlet weak var manteTipoLabel:UILabel!
    @IBOutlet weak var manteFechaLabel:UILabel!
    
    
    @IBOutlet var viewIcon2:UIView!
    @IBOutlet weak var manteTipoLabel2:UILabel!
    @IBOutlet weak var manteFechaLabel2:UILabel!
    
    @IBOutlet var viewIcon3:UIView!
    @IBOutlet weak var manteTipoLabel3:UILabel!
    @IBOutlet weak var manteFechaLabel3:UILabel!
    
    
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
        
        self.viwBackContentInd.layer.cornerRadius = 8
        self.viwBackContentInd.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viwBackContentInd.layer.shadowOpacity = 8
        self.viwBackContentInd.layer.shadowOffset = .zero
        self.viwBackContentInd.layer.shadowRadius = 4
        
        self.viwBackContentMant.layer.cornerRadius = 8
        self.viwBackContentMant.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viwBackContentMant.layer.shadowOpacity = 8
        self.viwBackContentMant.layer.shadowOffset = .zero
        self.viwBackContentMant.layer.shadowRadius = 4
        
        
        self.viewIcon.layer.cornerRadius = 5
       // self.viewIcon2.layer.cornerRadius = 5
       // self.viewIcon3.layer.cornerRadius = 5
        
        
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
