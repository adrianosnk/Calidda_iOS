//
//  PopUpErrorView.swift
//  Calidda
//
//  Created by MacAdrian on 10/22/20.
//  Copyright © 2020 Calidda. All rights reserved.
//

import UIKit
  
enum PopUpCloseErrorType {
    case error
    case warning
    case connection
}
 
protocol PopUpCloseErrorViewDelegate: class {
    func onClose(type: PopUpCloseErrorType)
    func onAceppt(type: PopUpCloseErrorType)
}
 
class PopUpCloseErrorView: BaseAlert {

    @IBOutlet var viewContent: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var buttonAccept: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    
    var delegateError: PopUpCloseErrorViewDelegate?
    var type: PopUpCloseErrorType = .warning
      
    @IBOutlet weak var viewClose: UIView!
    @IBOutlet var imageViewClose: UIImageView!

    
    private struct DefaultText {
        static let descriptionError = "No pudimos guardar tus cambios, por favor intenta luego."
        static let titleError = "¡Lo sentimos!"
        static let buttonTitleError = "Aceptar"
        
        static let descriptionProblem = "Desea salir de la aplicación."
        static let titleProblem = "¡Cerrar Sesión!"
        static let buttonTitleProblem = "Aceptar"
        
        static let descriptionConnection = "Por favor, verifica tu conexión e intenta de nuevo en unos minutos."
        static let titleConnection = "Error de conexión"
        static let buttonTitleConnection = "Reintentar"
    } 
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
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
        viewContent.layer.cornerRadius = 10
        viewContent.backgroundColor = CaliddaColors.white
        viewContent.addShadowViewCustom(cornerRadius: 10.0)
       
        labelTitle.font = CaliddaFont.bold16
        //labelTitle.textColor = DoctorColors.greenOne
        labelTitle.textColor = CaliddaColors.purple
        
        labelDescription.font = CaliddaFont.regular15
        labelDescription.textColor = CaliddaColors.darkGray
        
       // buttonAccept.setStyle(background: CaliddaColors.purple, textButton: CaliddaColors.white)
        
    }
    
    // MARK: - SetupView
    
    func setupView(type: PopUpCloseErrorType) {
        self.type = type
        switch type {
        case .error:
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClosePopup))
            viewClose.addGestureRecognizer(tapGesture)
            
            imageViewClose.image = CaliddaImage.getImage(named: .iconClose)
            imageViewClose.contentMode = .scaleAspectFit
            
            labelTitle.text = DefaultText.titleError
            labelDescription.text = DefaultText.descriptionError
            imageView.image = CaliddaImage.getImage(named: .iconError)
            buttonAccept.setTitle(DefaultText.buttonTitleError, for: .normal)
        case .warning:
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClosePopup))
           // viewClose.addGestureRecognizer(tapGesture)
            
            imageViewClose.image = CaliddaImage.getImage(named: .iconClose)
            imageViewClose.contentMode = .scaleAspectFit
            
            labelTitle.text = DefaultText.titleProblem
            labelDescription.text = DefaultText.descriptionProblem
            imageView.image = CaliddaImage.getImage(named: .iconWarning)
            buttonAccept.setTitle(DefaultText.buttonTitleProblem, for: .normal)
        case .connection:
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClosePopup))
            viewClose.addGestureRecognizer(tapGesture)
            
            imageViewClose.image = CaliddaImage.getImage(named: .iconClose)
            imageViewClose.contentMode = .scaleAspectFit
            
            labelTitle.text = DefaultText.titleConnection
            labelDescription.text = DefaultText.descriptionConnection
            imageView.image = CaliddaImage.getImage(named: .iconConnection)
            buttonAccept.setTitle(DefaultText.buttonTitleConnection, for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @IBAction func onClickAccept(_ sender: UIButton) {
        if let delegateError = delegateError {
            delegateError.onClose(type: type)
        }
        super.onClickButton(view: self)
    }
    
    @IBAction func onClickCancel(_ sender: UIButton) {
        if let delegateError = delegateError {
            delegateError.onClose(type: type)
        }
        super.onClickButton(view: self)
    }
    
    // MARK: - Action
     @objc func onClosePopup(){
        if type == .error {
             super.onClickButton(view: self)
             return
        }
        
          if type == .warning {
               super.onClickButton(view: self)
               return
          }
        
          if type == .connection {
            super.onClickButton(view: self)
            return
          }
        
          if let delegateError = delegateError {
              delegateError.onClose(type: type)
          }
          super.onClickButton(view: self)
     }
    
}
