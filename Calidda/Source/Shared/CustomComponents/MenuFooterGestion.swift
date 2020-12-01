//
//  MenuFooter.swift
//  Calidda
//
//  Created by MacAdrian on 10/29/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit

protocol MenuFooterGestionDelegate: class {
    func onClickConsumo()
    func onClickFactura()
    func onClickMenu()
    func onClickMante()
    func onClickConfiguration()
}


class MenuFooterGestion: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var delegateFooter: MenuFooterGestionDelegate?
     
    @IBOutlet var viewContent: UIView!
    @IBOutlet var viwBackContent:UIView!
    
    @IBOutlet var img_Consumo:UIImageView!
    @IBOutlet var img_Factura:UIImageView!
    @IBOutlet var img_Menu:UIImageView!
    @IBOutlet var img_Mante:UIImageView!
    @IBOutlet var img_Configuration:UIImageView!
    

    
    @IBOutlet var lbl_Consumo:UILabel!
    @IBOutlet var lbl_Factura:UILabel!
    @IBOutlet var lbl_Menu:UILabel!
    @IBOutlet var lbl_Mante:UILabel!
    @IBOutlet var lbl_Configuration:UILabel!
    
    
    @IBOutlet var btn_Consumo:UIButton!
    @IBOutlet var btn_Factura:UIButton!
    @IBOutlet var btn_Menu:UIButton!
    @IBOutlet var btn_Mante:UIButton!
    @IBOutlet var btn_Configuration:UIButton!
    
     
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
       // self.onClickConsumoView()
       // self.delegateFooter = self
    }
    private func commonInit() {
          // viewContent = loadNib()
               viewContent = loadNib()
               
               addSubViewWithLayout(view: viewContent)
               viewContent.frame = self.bounds
               
               NSLayoutConstraint.activate([
                   viewContent.leadingAnchor.constraint(equalTo: leadingAnchor),
                   viewContent.trailingAnchor.constraint(equalTo: trailingAnchor),
                   viewContent.topAnchor.constraint(equalTo: topAnchor),
                   viewContent.bottomAnchor.constraint(equalTo: bottomAnchor)
                   ])
               
               initialDesign()
    }
        
    func initialDesign() {
        
        self.viwBackContent.layer.shadowColor = CaliddaColors.lightShadowDark.cgColor
        self.viwBackContent.layer.shadowOpacity = 8
        self.viwBackContent.layer.shadowOffset = .zero
        self.viwBackContent.layer.shadowRadius = 8
         
    }
     
    func onClickConsumoView (){
          
           self.img_Consumo.image = CaliddaImage.getImage(named: .icon_ConsumoBlue)
           self.img_Consumo.contentMode = .scaleAspectFit
           
       }
    func onClickConsumo (){
       
        self.img_Consumo.image = CaliddaImage.getImage(named: .icon_ConsumoBlue)
        self.img_Consumo.contentMode = .scaleAspectFit
        
    } 
    
    func onClickFactura (){
        
        img_Consumo.image = CaliddaImage.getImage(named: .iconClose)
        img_Consumo.contentMode = .scaleAspectFit
      
    }
    func onClickMenu (){
        
        img_Consumo.image = CaliddaImage.getImage(named: .iconClose)
        img_Consumo.contentMode = .scaleAspectFit
      
    }
    func onClickMante (){
        
        img_Consumo.image = CaliddaImage.getImage(named: .iconClose)
        img_Consumo.contentMode = .scaleAspectFit
      
    }
    func onClickConfiguration (){
        
        img_Consumo.image = CaliddaImage.getImage(named: .iconClose)
        img_Consumo.contentMode = .scaleAspectFit
      
    }
    
    @IBAction func onClickConsumo(_ sender: UIButton) {
        
        // super.onClickButton(view: self)
     //     onClickConsumo ()
        
        //if let delegateFooter = delegateFooter {
        self.delegateFooter?.onClickConsumo()
          //  }
     }
    
}
