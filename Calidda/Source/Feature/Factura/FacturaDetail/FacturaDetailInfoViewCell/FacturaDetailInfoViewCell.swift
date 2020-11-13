//
//  GeneralDataViewCell.swift
//  App
//
//  Created by Raul Quispe on 6/14/20.
//  Copyright © 2020 Raul Quispe. All rights reserved.
//

import UIKit

final class FacturaDetailInfoViewCell: UITableViewCell {
    static let reuseIdentifier = "FacturaDetailInfoViewCell"
    @IBOutlet weak var iconImage:UIImageView!
    @IBOutlet weak var titleDataLabel:UILabel!
    @IBOutlet weak var valueDataLabel:UILabel!
     
    
    @IBOutlet var viwBackContentDeman:UIView!
    @IBOutlet var viwBackContentFac:UIView!
    @IBOutlet var viwBackContentInd:UIView!
    @IBOutlet var viwBackContentMant:UIView!
    
    
    @IBOutlet var viwBackContentTag1:UIView!
    @IBOutlet var viwBackContentTag2:UIView!
    @IBOutlet var viwBackContentTag3:UIView!
    @IBOutlet var viwBackContentTag4:UIView!
    @IBOutlet var viwBackContentTag5:UIView!
    @IBOutlet var viwBackContentTag6:UIView!
    @IBOutlet var viwBackContentTag7:UIView!
    @IBOutlet var viwBackContentTag8:UIView!
    @IBOutlet var viwBackContentTag9:UIView!
    
    
    @IBOutlet weak var idReciboLabel:UILabel!
    @IBOutlet weak var mesLabel:UILabel!
    @IBOutlet weak var anioLabel:UILabel!
    @IBOutlet weak var importeTotalLabel:UILabel!
    @IBOutlet weak var fechaVencimientoLabel:UILabel!
    @IBOutlet weak var estadoLabel:UILabel!
    @IBOutlet weak var volumenConsumoLecturaLabel:UILabel!
    @IBOutlet weak var factorCorreccionVolumenLabel:UILabel!
    @IBOutlet weak var volumenFacturadoLabel:UILabel!
    @IBOutlet weak var categoriaTarifariaLabel:UILabel!
    @IBOutlet weak var precioMedioGasNaturalLabel:UILabel!
    @IBOutlet weak var costoMedioTransporteLabel:UILabel!
    @IBOutlet weak var costoFijoComercializacionLabel:UILabel!
    @IBOutlet weak var costoFijoDistribucionLabel:UILabel!
    @IBOutlet weak var costoVariableDistribucionLabel:UILabel!
    @IBOutlet weak var totalConceptoGasNaturalLabel:UILabel!
    @IBOutlet weak var totalServicioTransporteLabel:UILabel!
    @IBOutlet weak var totalCostoFijoDistribucionLabel:UILabel!
    @IBOutlet weak var totalCostoVariableDistribucionLabel:UILabel!
    @IBOutlet weak var totalCostoFijoComercializacionLabel:UILabel!
    
    
    @IBOutlet weak var otrosConceptosNombreLabel:UILabel!
    @IBOutlet weak var otrosConceptosTotalLabel:UILabel!
    
    @IBOutlet weak var otrosConceptosNombreLabel2:UILabel!
    @IBOutlet weak var otrosConceptosTotalLabel2:UILabel!
    
    @IBOutlet weak var totalIGVLabel:UILabel!
    @IBOutlet weak var idReciboPDFLabel:UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.viwBackContentTag1.layer.cornerRadius = 8
        self.viwBackContentTag1.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag2.layer.cornerRadius = 8
        self.viwBackContentTag2.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag3.layer.cornerRadius = 8
        self.viwBackContentTag3.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag4.layer.cornerRadius = 8
        self.viwBackContentTag4.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag5.layer.cornerRadius = 8
        self.viwBackContentTag5.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag6.layer.cornerRadius = 8
        self.viwBackContentTag6.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag7.layer.cornerRadius = 8
        self.viwBackContentTag7.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag8.layer.cornerRadius = 8
        self.viwBackContentTag8.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        
        self.viwBackContentTag9.layer.cornerRadius = 8
        self.viwBackContentTag9.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
       
        
        
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
