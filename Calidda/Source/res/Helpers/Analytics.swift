//
//  Analytics.swift
//  Claro Hogar
//
//  Created by Daniel Aragon Ore on 1/23/19.
//  Copyright © 2019 Claro. All rights reserved.
//

import Foundation
//import ClaroToolKit
 
enum ClaroAnalytics{
     
    enum Category: String{
        
        case selectPackage = "Login Paquete"
        case location = "Ubicacion"
        case splash = "Splash Tipo de Acceso"
        case noUser = "Ingreso fallido por correo"
        case login = "Home Login Hogar"
        case userBlocked = "Cuenta Bloqueada"
        case choosePackage = "Seleccion de Casa"
        case editName = "Editar Nombre"
        case menuBar = "Menu horizontal"
        case internetDetail = "Detalle Internet"
        case resetModem = "Reiniciar Modem"
        case resetModemError = "Reiniciar Modem Error"
        case serviceError = "Error de Servicio"
        
        case updateAppIOs = "Actualizar app ios"
        case maintenance = "Mantenimiento"
        
        case categoryHomeOnePlay = "Home 1 play"
        case categoryHomeTwoPlay = "Home 2 play"
        case categoryHomeThreePlay = "Home 3 play"
        
        case withoutInternetService = "Sin servicio de internet"
        
        case someDevices = "Algunos dispositivos"
        case allDevices = "Todos los dispositivos"
        
        case serviceState = "Estado de Servicio"
        case technologyType = "Tipo de tecnologia"
        
        case serviceNoContracted = "Sin servicio contratado"
        case serviceCorporate = "Cuentas con fijo corporativo"
        case noServiceContracted = "No tienes servicio fijo"
        case servicePrepaid = "Cuentas con fijo prepago"
        
        case serverNotification = "Bandeja de Notificaciones"
        case notifications = "Notificaciones"
        case noNotification = "Sin Notificacion"
        
        case errorServiceLteNC = "Error de servicio LTE NC"
        case errorServiceLteC = "Error de servicio LTE C"
        
        case errorServiceWithoutInfo = "Error estado del servicio sin info"
        
    }
    
    enum Action: String{
        
        case clientType = "Tipo de cliente"
        case accessType = "Tipo de acceso"
        case clickOnButton = "Clic en boton"
        case onFailedLoad = "Error de carga"
        case intermittence = "Intermitencia"
        case connected = "Conectado"
        case noConnected = "Estado 0"
        case active = "Activo"
        case pushUpNotification = "Push up"
        case listNotification = "Listado de Notificacion"
        case notification = "Notificacion"
        case stateNotification = "Estado de Notificacion"
        case countNotification = "Contador de Notificacion"
        case lookReceipts = "Mira tus recibos y paga"
        case reconnecting = "Reconectando"
        case seeDetails = "Ver detalle"
        case restartDirect = "Reinicio directo"
        case restartDeco = "Reiniciar deco"
        case callAnAdvisor = "Llamar a un asesor"
        case client = "Cliente"
        case restart = "Reiniciar"
        case restarted = "Reinicio"
        case fail = "Falla"
        case errorServiceWithoutInfo = "Error estado del servicio sin info"
        case missingParameters = "Faltan parametros obligatorios"
        case responseNoSuccess = "Respuesta no exitosa"
        case timeout = "Timeout"
        case availability = "Disponibilidad"
        case internalError = "Error interno"
        case working = "Funcionando"
        case synchronized = "Sincronizado"
        case synchronizing = "Sincronizando"
        case cannotRestart = "No se puede reiniciar"

    }
    
    enum Tag: String{
        
        case wifi = "Wifi"
        case data = "Datos"
        case tryAgain = "Vuelve a intentarlo"
        case register = "Registrate"
        case choosePackage = "Seleccionar Paquete"
        case saveAlias = "Boton Guardar Nombre"
        case homeTab = "Boton inicio"
        case locateUsTab = "Boton Ubicanos"
        case manageTab = "Boton gestiones"
        case moreTab = "Boton Mas"
        case notificationTab = "Boton Con Notificaciones"
        case noNotificationTab = "Boton Sin Notificaciones"
        
        case editNameTitularButton = "Boton editar nombre titular"
        case editPackageNameButton = "Editar nombre de paquete"
        case managesYourServicesButton = "Boton gestiona tus servicios"
        
        case managesYourServices = "Gestiona tus servicios"
        
        case interogationButton = "Boton interrogacion"
        
        case router = "Tu router"
        case routers = "Tus routers"
        case detail = "Detalle"
        
        case internetDetail = "Boton Detalle Internet"
        case seePayYourBills = "Mira tus recibos y paga"
        case seeYourBills = "Mira tus recibos"
        case customizeWifiButton = "Boton Personalizar Wifi"
        
        case aliasError = "Error de Alias"
        case refreshPackageError = "Error de Refresh Paquete"
        
        case errorServiceWithoutInfo = "Error estado del servicio sin info"
        case tryAgainCall = "Volver a intentar"
        
        case playIn = "Ingresar"
        
        case restartModemStateErrorFive = "Error Reiniciar Modem Estado 5"
        case restartModemStateErrorSix = "Error Reiniciar Modem Estado 6"
        
        case playStoreButton = "Boton playstore"
        case retryButton = "Boton reintentar"
        
        case packageError = "Error de paquete"
        case debtError = "Error de deuda"
        case serviceError = "Error de servicio"
        
        case byWifi = "Por Wifi"
        case cablignAndWifi = "Cableado-Wifi"
        
        case stateFive = "Estado 5"
        case stateSix = "Estado 6"
        case stateZero = "Estado 0"
        
        case seeDetails = "Ver detalle"
        case packageInfo = "Informacion de paquete"
        
        case onSomeDevices = "En algunos dispositivos"
        case onAllMyDevices = "En todos mis dispositivos"
        
        case callAnAdvisor = "Llamar a un asesor"
        case callAnAdviserButton = "Boton llamar a un asesor"
        
        case resetModemButton = "Boton Reiniciar Modem"
        case restartModem = "Reiniciar modem"
        case returnHome = "Boton Volver al inicio"
        case backToTop = "Volver al inicio"
        case cancel = "Cancelar"
        case restart = "Reiniciar"
        case signOut = "Cerrar sesion"
        case goClaroWeb = "Ir a Mi Claro"
        case goClaroApp = "Ir a mi claro"
        case closePopup = "Cerrar"
        case editDeco = "Boton editar nombre deco"
        case iGotIt = "Entendido"
        
        // Login
        case back = "Volver"
        case forgetPassword = "Olvidaste tu contraseña"
        case registerMe = "Registrarme"
        case loginErrorService = "Ingresar error de servicio"
        case loginOk = "Ingresar ok"
        case loginError = "Ingresar error"
        
        // state Decos
        case restartDirect = "Reinicio directo"
        case restartDeco = "Reiniciar deco"
        case restarSuccess = "Reinicio exitoso – Ver estado"
        case restarProgress = "Reinicio proceso – Ver estado"
        
        // control remote
        case universalControl = "Control universal"
        case dtaControl = "Control DTA"
        
        // buttons
        case yes = "Si"
        case no = "No"
        
        //videos
        case videosTutoriales = "Videos tutoriales"
        
        
        // Errors
        case missingParameters = "Faltan parametros obligatorios"
        case responseNoSuccess = "Respuesta no exitosa"
        case timeout = "Timeout"
        case availability = "Disponibilidad"
        case internalError = "Error interno"
        
        // technical visits
        case rescheduleVisit = "Reprogramar visita"
        case continueButton = "Continuar"
        case cancelVisit = "Cancelar visita"
        case seeVitis = "Ver visitas"
        case techinalVisits = "Visitas tecnicas"
        
        // newHome
        case serviceWorkedProperly = "Servicio funcionado correctamente"
        case technicalFailureInYourArea = "Falla tecnica en tu zona"
        case payInClaro = "Pagar en mi claro "
        case reviewTechnicalSolutions = "Revisa soluciones tecnicas"
        case goToTechnicalSolutions = "Ir a soluciones tecnicas"
        case reviewDeco = "Falla en zona - Revisar Deco"
        case errorLoadService = "Error al cargar informacion"
        case checkStatusService = "Verificar estado de servicio"
        
        // devicesConnected
        case deviceConnected = "Dispositivos conectados"
        
        // new Internet
        case problemWithInternet = "Problemas con tu internet"
        
        // new Television
        case decos = "Tus decos"
        case controlRemote = "Control Remoto"
        case channelGuide = "Guia de canales"
        case deco = "Deco"
        case seeState = "Ver estado"
        case seeDecos = "Ver mis decos"
    }
    
    enum Screen: String{
        
        enum Home{
            case regular
            case pending
            case issued
            case cantUpdate
            case reconnecting
            
            case suspendedRequest
            case restartingModemStateFive
            case restartModemStateFiveUpps
            
            case restartModemStateFive
            case internetIntermittenceSection
            case internetErrorSection
            case internetNoConnectedSection
            case infoPackage
            
            case ncosLowVelocity
            case ncosConnectionSuccess
            case ncosModemNoConected
        }
        enum HomeEvents{
            case regular
            case pending
            case issued
            case suspendedRequest
            case internetIntermittenceState
            case managmentInternetIntermittence
            case internetErrorSection
            case infoPackage
            case reconnecting
            case stateZero
            
            case modemNoConnected
            
        }
        
        enum Internet{
            case internetManagement
            case withoutInternetService
            case restartingModem
            case someDevices
            case allDevices
            case byWifi
            case byBoth
            case restartError
            case restartReady
            case managmentInternetTroubles
            case managmentInternetError
            case managmentInternetIntermittence
            case managmentInternetLoadError
            case managmentInternetNoConnected
            case managmentInternetSuspendedByRequest
            case managmentInternetSuspendedByDebt
            case managmentInternetServiceNotContracted
            case managmentInternetServiceReconnecting
            case managmentInternetTechnologyNotAlowed
            case restartFailedStateFive
            case restartReadyStateFive
            case restartInternetModem
            case videosTutorialesInternet
            case problemServiceInternet
            case restartingInternet
            case restarSuccessInternet
            case continueErrorInternet
            case internetHFC
            case deviceConnectedHFC
            case errorDeviceConnectedHFC
            case zeroDevicesConnectedHFC
            
        }
        enum InternetEvents{
            case someDevices
            case allDevices
            case byWifi
            case byBoth
            case managmentInternetTroubles
            case managmentInternetError
            case restartingModemStateFive
            case restartFailedStateFive
            case restartReadyStateFive
            case restartInternetModem
            case managmentInternetServiceNotContracted
            case managmentInternetNotConnected
            case managmentInternetTechnologyNotAlowed
            case internetManagement
            case router
            case videosTutorialInternet
            case problemServiceInternet
            case restartingInternet
            case restarSuccessInternet
            case continueErrorInternet
            case internetHFC

        }
        
        enum Television{
            case managementTv
            case managmentTvSuspendedByRequest
            case managmentTvSuspendedByDebt
            case managmentTvErrorLoding
            case managmentTvServiceNotContracted
            case managmentTvReconnecting
            case managmentTvRestartModemTv
            case managmentTvRestartDeco
            case managmentTvDecoRestarted
            case managmentTvRestartDecoUps
            case managmentTvTechnologyNotAlowed
            case managmentTvAlias
            case managmentTvRestartDecoDirect
            case managmentTvRestartDecoDirectProcess
            case managmentTvRestartDecoDirectReady
            case managmentTvProblemDecos
            case managmentTvProblemDecosStepOne
            case managmentTvProblemDecosStepTwo
            case managmentTvProblemNoSignal
            case managmentTvRestartDecoNoSignal
            case managmentTvRestartStepTwo
            case managmentTvRestartStepTwoReady
            case managmentTvRestartNoSignalReady
            case managmentTvProblemAllDecos
            case managmentTvProblemPixelated
            case managmentTvControlRemote
            
            case managmentTvControlRemoteDta1
            case managmentTvControlRemoteDta2
            case managmentTvControlRemoteDta3
            case managmentTvControlRemoteDta4
            
            case managmentTvControlRemoteUniversal1
            case managmentTvControlRemoteUniversal2
            case managmentTvControlRemoteUniversal3
            case managmentTvControlRemoteUniversal4
            
            case videosTutorialesTelevision
            case managemenTvExpandedDecos
            case managmentTvRestartDecoStepTwoPopup
            case managmentTvRestartDecoNoSignalPopup
            
            // new design
            case televisionHFC
            case televisionDTH
            case errorTelevisionDTH
            case listDecosTelevisionDTH
            case errorLoadStateDecosDTH
            case infoDTH
            case confirmParingDTH
            case synchronazingDecoDTH
            case synchronizationSuccess
            case youExceededRestartDTH
            case listDecosTelevisionDTHCod01
            case listDecosTelevisionDTHCod03
            case listErrorDTH
            case technicalSolutionCod01
            case technicalSolutionCod02
            case technicalSolutionCod03
            case technicalSolutionCod032
            case technicalSolutionCod033
            case technicalSolutionCod03Adviser
            case technicalSolutionCod04
            case technicalSolutionCod042
            case technicalSolutionCod05
            case technicalSolutionCod052
            case technicalSolutionCod07
            
        }
        
        enum TelevisionEvents{
            case managmentTvDecoProblems
            case managmentTvDecoNoActive
            case managmentTvRestartModemTv
            case managmentTvRestartDeco
            case managmentTvServiceNotContracted
            case managmentTvDecoRestarted
            case managmentTvRestartDecoUps
            case managmentTvAlias
            case managmentTvTechnologyNotAlowed
            case managmentTvDecoRestartedDirect
            case managmentTvDecoRestartedDirectProcess
            case managmentTvDecoRestartedDirectReady
            case managmentTvDecoRestartedDirectNoActivate
            case managmentTvDecoProblemsNoSignal
            case managmentTvDecoRestartedStepTwo
            case managmentTvDecoRestartedNoSignal
            case managmentTvDecoRestartedStepTwoReady
            case managmentTvDecoRestartedNoSignalReady
            case managmentTvDecoProblemAllDecos
            case managmentTvDecoProblemPixelated
            case managmentTvControlRemote
            
            case managmentTvControlRemoteDta1
            case managmentTvControlRemoteDta2
            case managmentTvControlRemoteDta3
            case managmentTvControlRemoteDta4
            
            case managmentTvControlRemoteUniversal1
            case managmentTvControlRemoteUniversal2
            case managmentTvControlRemoteUniversal3
            case managmentTvControlRemoteUniversal4
            
            case managmentTvVideosTutoriales
            
            case managmentTvRestartDirectSuccess
            case managmentTvDecoRestartedStepTwoProcess
            case managmentTvDecoRestartedNoSignalProccess
            case managmentTvDecoRestartedStepTwoPopUp
            
            case managmentTvDecoRestartedStepTwoNoActivate
            case managmentTvDecoRestartedNoSignalNoActivate
            
            case managmentTvDecoRestartedNoSignalPopUp
            
            // new design
            case televisionHFC
            case televisionDTH
            case errorTelevisionDTH
            case listDecosTelevisionDTH
            case errorLoadStateDecosDTH
            case infoDTH
            case confirmParingDTH
            case synchronazingDecoDTH
            case synchronizationSuccess
            case youExceededRestartDTH
            case listDecosTelevisionDTHCod01
            case listDecosTelevisionDTHCod03
            case listErrorDTH
            case technicalSolutionCod01
            case technicalSolutionCod02
            case technicalSolutionCod03
            case technicalSolutionCod032
            case technicalSolutionCod033
            case technicalSolutionCod03Adviser
            case technicalSolutionCod04
            case technicalSolutionCod042
            case technicalSolutionCod05
            case technicalSolutionCod052
            case technicalSolutionCod07
            
        }
        
        enum technicalVisitScreen {
            case popupRescheduleVisit
            case popupCancelVisit
            case reasonsRescheduleVisit
            case reasonsCancelVisit
            case noAvailabilityHours
            case selectionDate
            case newDateTechnicalVisit
            case rescheduleProblem
            case dateNoAvailability
            case rescheduleSuccess
            case secondReschedule
            case technicianGrasping
            case noReprograming
            case technicalVisits
            case successCancelVisit
            case errorCancelVisit
            case unassignedTechnician
            case errorVisitHome
            case successVisitHome
        }
        
        enum technicalVisitEvent {
            case popupRescheduleVisit
            case popupCancelVisit
            case reasonsRescheduleVisit
            case reasonsCancelVisit
            case noAvailabilityHours
            case selectionDate
            case newDateTechnicalVisit
            case rescheduleProblem
            case dateNoAvailability
            case rescheduleSuccess
            case secondReschedule
            case technicianGrasping
            case noReprograming
            case technicalVisits
            case successCancelVisit
            case errorCancelVisit
            case unassignedTechnician
            case errorVisitHome
            case successVisitHome
        }
        
        enum NewHomeEvent {
            case televisionHFC
            case televisionDTH
            case televisionLTE
            case telefoniaHFC
            case internet
            case restartSuccesInternet
            case continueProblemInternet
            case couldNotBeSolvedProblemRAI
            case telefoniaError
            case continueProblemTelefonia
            case reactivating
            case suspendedByRequest
            case suspendedByDebtWithAmount
            case suspendedByDebtNoAmount
            case buttonTroubledService

        }
        
        enum NewHomeScreen {
            case reactivating
            case suspendedByRequest
            case suspendedByDebtWithAmount
            case suspendedByDebtNoAmount
            case problemTelefonia
            case continueProblemTelefonia
            case problemSolvedTelefonia
            case problemInternet
            case continueProblemInternet
            case restartingInternet
            case restartSuccesInternet
        }
        
        enum ErrorServices {
            case errorConsultNcosControlled
            case errorUpdateNcosControlled
            case errorConsultNcosNoControlled
            case errorUpdateNcosNoControlled
            case errorRestartAutomaticInternetControlled
            case errorRestartAutomaticNoInternetControlled
        }
        
        enum Telephone{
            case managementPhone
            case managmentPhoneReconnecting
            case managmentPhoneSuspendedByRequest
            case managmentPhoneSuspendedByDebt
            case managmentPhoneServiceNotContracted
            case managmentPhoneTechnologyNotAlowed
            
            case problemServiceTelephone
            case bugFixedTelephone
            case continueProblemTelefonia
        }
        enum TelephoneEvents{
            case managmentPhone
            case managmentPhoneServiceNotContracted
            case managmentPhoneTechnologyNotAlowed
            
            case problemServiceTelephone
            case bugFixedTelephone
            case continueProblemTelefonia
        }
        
        enum More{
            case more
        }
        
        enum MoreEvents{
            case closeSession
        }
        
        enum Notificacion {
            case noNotification
            case notification
            case notificationView
        }
        
        enum NotificacionEvents {
            case noNotification
            case notification
            case notificationView
            case notificationPush
            case withNotificationTab
            case withOutNotificationTab
        }
        enum NotificacionSpecificEvents {
            case notificationState
            case notificationTitle
            case notificationTotal
        }
        
        case splash = "/Splash hogar"
        case login = "/Home login hogar"
        case wrongInformation = "/Home nuevo login hogar – Contraseña invalida"
        case documentNoRegister = "/Home nuevo login hogar – Documento no registrado"
        case documentInvalid = "/Home nuevo login hogar – Documento invalido"
        case noUser = "/Ingreso fallido por correo"
        case userBlocked = "/Cuenta bloqueada"
        case noPackages = "/Falla de Servicio de Paquetes"
        case unfoldedPackages = "/Seleccionar Casa"
        case editName = "/Editar Nombre"
        case internetDetail = "/Gestion de Internet"
        case resetModem = "/Reiniciar Modem"
        case noInternetIntermittent = "/Reiniciar Modem Intermitente"
        case noInternet = "/Reiniciar Modem Error Conexion"
        case triesExceeded = "/Reiniciar Modem Sin Conectividad"
        case processFinished = "/Reiniciar Modem Exito"
        
        
        case updateAppIOs = "/Actualizar app ios"
        case maintenance = "/Mantenimiento"
        case unauthorizedCustomer = "/Cliente no autorizado"
        case updateNameTitular = "/Editar nombre titular"
        case updateNamePackage = "/Editar nombre paquete"
        
        case unableToSaveOwnerName = "/No se pudo guardar nombre titular"
        case unableToSaveOwnerPackage = "/No se pudo guardar nombre paquete"
        
        case homeOnePlay = "/Home 1 play"
        case homeTwoPlay = "/Home 2 play"
        case homeThreePlay = "/Home 3 play"
        
        case noPackagesScreen = "Sin sucursales"
        case corporateUserScreen = "/No es cliente mixto-masivo"
        case noServiceYetScreen = "/No tiene servicio fijo contratado"
        
        case onDevelopScreen = "/Estamos trabajando"
        
        case serviceCorporate = "/Cuentas con fijo corporativo"
        case noServiceContracted = "/No tienes servicio fijo"
        case servicePrepaid = "/Cuentas con fijo prepago"
        
        case noNotification = "Sin Notificacion"
    }
}

func logScreen(screen: ClaroAnalytics.Screen? = nil, screenString: String? = nil){
    let _screen = screen != nil ? screen!.rawValue : screenString!
    print("TAGLOG SCREEN:\(_screen)")
   // ClaroToolKit.shared.logScreen(screen: _screen)
}


func logEvent(category: ClaroAnalytics.Category? = nil, categoryString: String? = nil, action: ClaroAnalytics.Action? = nil, actionString : String? = nil ,tag: ClaroAnalytics.Tag? = nil, tagString: String? = nil){
    let _category = category != nil ? category!.rawValue : categoryString!
    let _tag = tag != nil ? tag!.rawValue : tagString!
    let _action = action != nil ? action!.rawValue : actionString!
    print("TAGLOG CATEGORY:\(_category) ACTION:\(_action) TAG:\(_tag)")
    //ClaroToolKit.shared.logEvent(category: _category, action: _action, label: _tag)
}

func homeStateScreen(_ name: String, section: ClaroAnalytics.Screen.Home) -> String {
    switch section {
    case .regular: return "/Home \(name)"
    case .pending: return "/Home \(name) suspendido por deuda"
    case .issued: return "/Home \(name) recibo emitido"
    case .cantUpdate: return "/\(name) No Pudo Cargar Recibo"
    case .reconnecting: return "/Home \(name) reconectando tu servicio"
    //
    
    case .suspendedRequest: return "/Home \(name) suspendido por solicitud"
    case .restartingModemStateFive: return "/\(name) – Reiniciando modem – Estado 5"
    case .restartModemStateFiveUpps: return "/\(name) – Reiniciar modem –Estado 5"
    
    case .restartModemStateFive: return "/Home \(name) reiniciar modem - Estado 5"
    case .internetIntermittenceSection: return "/Home \(name) modem - Estado 5"
    case .internetErrorSection:    return "/Home \(name) error internet"
    case .internetNoConnectedSection:    return "/Home \(name) modem - Estado 0"
    case .infoPackage: return "/\(name) - Detalle de paquete"
    
    case .ncosLowVelocity: return "/Home \(name) - Velocidad Reducida"
    case .ncosConnectionSuccess: return "/Home \(name) - Conexión correcta"
    case .ncosModemNoConected: return "/Home \(name) - Modem desconectado"
    }
}

func homeEvents(_ name: String, section: ClaroAnalytics.Screen.HomeEvents) -> String {
    switch section {
    case .regular: return "Home \(name)"
    case .pending: return "Home \(name) suspendido por deuda"
    case .internetIntermittenceState: return "Home \(name) modem – Estado 5"
    case .issued: return "Home \(name) recibo emitido"
    case .suspendedRequest: return "Home \(name) suspendido por solicitud"
    case .managmentInternetIntermittence : return "Home \(name) reiniciar modem – Estado 5"
    case .internetErrorSection:    return "Home \(name) error internet"
    case .infoPackage:    return "Home \(name) – Detalle de paquete"
    case .reconnecting: return "Home \(name) - Reconectando tu servicio"
    case .stateZero: return "Home \(name) - Estado 0"
    case .modemNoConnected: return "Home \(name) - Modem desconectado"
        
    }
}

func internetStateScreen(_ name: String, section: ClaroAnalytics.Screen.Internet) -> String {
    switch section {
    case .internetManagement: return "/\(name) - Gestion de Internet"
    case .withoutInternetService: return "/\(name) - Sin servico de internet"
    case .restartingModem: return "/\(name) - Reiniciando modem"
    case .someDevices: return "/\(name) - Algunos dispositivos"
    case .allDevices: return "/\(name) - Todos los dispositivos"
    case .byWifi: return "/\(name) - Por wifi"
    case .byBoth: return "/\(name) - Ambos"
    case .restartError: return "/\(name) - Error de reinicio"
    case .restartReady: return "/\(name) - Reinicio listo"
    case .managmentInternetTroubles: return "/\(name) - Problemas de internet"
    case .managmentInternetError: return "/\(name) - Gestion internet - Error"
    case .managmentInternetLoadError: return "/\(name) – Gestion internet - Error de Carga"
    case .managmentInternetNoConnected : return "/\(name) – Gestion de internet – Estado 0 "
    case .managmentInternetIntermittence : return "/\(name) – Reiniciar modem – Estado 5"
    case .managmentInternetSuspendedByRequest: return "/\(name) – Gestion internet – Suspendido a solicitud"
    case .managmentInternetSuspendedByDebt: return "/\(name) – Gestion internet – Suspendido por deuda"
    case .managmentInternetServiceReconnecting: return "/\(name) – Gestion internet – Reconectando tu servicio"
    case .managmentInternetTechnologyNotAlowed: return "/\(name) – Gestiones internet – Servicio en construccion"
        
    case .restartFailedStateFive: return "/\(name) – Error de reinicio – Estado 5"
    case .restartReadyStateFive: return "/\(name) – Reinicio listo"
    case .restartInternetModem: return "/\(name) - Reinicar modem internet"
    
    case .videosTutorialesInternet: return "/\(name) – Gestion de Internet – Videos tutoriales"
        
        // new design
    case .managmentInternetServiceNotContracted: return "/Soluciones tecnicas internet - No tienes servicios contratados"
    case .problemServiceInternet: return "/Soluciones de internet - Problema servicio internet"
    case .restartingInternet: return "/Soluciones de internet - Reiniciando router"
    case .restarSuccessInternet: return "/Soluciones de internet - Router reiniciado con exito"
    case .continueErrorInternet: return "/Soluciones de internet - Falla persiste en servicio de internet"
    case .internetHFC: return "/Soluciones tecnicas - Internet HFC"
    case .deviceConnectedHFC: return "/Soluciones tecnicas internet – Dispositivos conectados HFC "
    case .errorDeviceConnectedHFC: return "/Soluciones tecnicas internet – Dispositivos conectados HFC – Error de conexion"
    case .zeroDevicesConnectedHFC: return "/Soluciones tecnicas internet – Dispositivos conectados HFC – No hay dispositvos"
    }
}

func internetEvents(_ name: String, section: ClaroAnalytics.Screen.InternetEvents) -> String {
    switch section {
    case .someDevices: return "\(name) - Algunos dispositivos"
    case .allDevices: return "\(name) - Todos los dispositivos"
    case .byWifi: return "\(name) - Por wifi"
    case .byBoth: return "\(name) - Ambos"
        
    case .managmentInternetTroubles: return "\(name) – Problemas de internet"
        
    case .managmentInternetError: return "\(name) – Gestion de internet - Error"
    case .restartingModemStateFive: return "\(name) Reiniciando modem – Estado 5"
    case .restartFailedStateFive: return "\(name) – Error de reinicio – Estado 5"
    case .restartReadyStateFive: return "\(name) – Reinicio listo"
    case .restartInternetModem: return "\(name) - Reinicar modem internet"
    case .managmentInternetNotConnected: return "\(name) - Gestion de internet - Estado 0"
    case .managmentInternetTechnologyNotAlowed: return "\(name) - Gestiones internet - Servicio en construccion"
    
    case .internetManagement: return "\(name) – Gestion de internet"
        
    case .router: return "\(name) – Gestion de internet – Tu router"
        
    case .videosTutorialInternet: return "\(name) – Gestion de Internet – Videos tutoriales"
        
        // new design
    case .managmentInternetServiceNotContracted: return "Soluciones tecnicas internet - No tienes servicios contratados"
    case .problemServiceInternet: return "Soluciones de internet - Problema servicio internet"
    case .restartingInternet: return "Soluciones de internet - Reiniciando router"
    case .restarSuccessInternet: return "Soluciones de internet - Router reiniciado con exito"
    case .continueErrorInternet: return "Soluciones de internet - Falla persiste en servicio de internet"
    case .internetHFC: return "Soluciones tecnicas - Internet HFC"
    }
}

func televisionStateScreen(_ name: String, section: ClaroAnalytics.Screen.Television) -> String {
    switch section {
    case .managementTv: return "/\(name) – Gestion tv"
    case .managmentTvReconnecting: return "/\(name) – Gestion tv – Reconectando tu servicio"
    case .managmentTvSuspendedByRequest: return "/\(name) – Gestion tv – Suspendido a solicitud"
    case .managmentTvSuspendedByDebt: return "/\(name) – Gestion tv – Suspendido por deuda"
    case .managmentTvErrorLoding: return "/\(name) – Gestion tv - Error de Carga"
    case .managmentTvServiceNotContracted: return "/\(name) - Gestion tv - Servicio no contratado"
    case .managmentTvRestartModemTv: return "/\(name) - Reiniciar modem tv"
    case .managmentTvRestartDeco: return "/\(name) – Reiniciar deco"
    case .managmentTvDecoRestarted: return "/\(name) – Deco se reinicio con exito"
    case .managmentTvRestartDecoUps: return "/\(name) – Reiniciar deco Ups"
    case .managmentTvTechnologyNotAlowed: return "/\(name) - Gestiones tv – Servicio en construccion"
    case .managmentTvAlias: return "/\(name) – Gestion tv"
        
    case .managmentTvRestartDecoDirect: return "/\(name) – Gestion tv - Reinicio directo"
    
    case .managmentTvRestartDecoDirectProcess: return "/\(name) – Gestion tv - Reinicio directo en proceso"
    case .managmentTvRestartDecoDirectReady: return "/\(name) – Gestion tv - Reinicio directo listo"
    case .managmentTvProblemDecos: return "/\(name) – Gestion tv - Problemas deco"
    case .managmentTvProblemDecosStepOne: return "/\(name) – Gestion tv - Problemas deco - Paso 1"
    case .managmentTvProblemDecosStepTwo: return "/\(name) – Gestion tv - Problemas deco - Paso 2"
    case .managmentTvProblemNoSignal : return "/\(name) – Gestion tv - No hay señal"
    case .managmentTvRestartDecoNoSignal: return "/\(name) – Gestion tv – No hay señal - Reiniciando deco"
    case .managmentTvRestartStepTwo : return "/\(name) – Gestion tv - Problemas deco - Reiniciando deco"
    
    case .managmentTvRestartDecoStepTwoPopup: return "/\(name) – Gestion tv – Problemas deco - Reinicio"
    case .managmentTvRestartDecoNoSignalPopup: return "/\(name) – Gestion tv – No hay señal - Reinicio"
    case .managmentTvRestartStepTwoReady : return "/\(name) – Gestion tv – Problemas deco - Reinicio listo"
    case .managmentTvRestartNoSignalReady : return "/\(name) – Gestion tv – No hay señal – Reinicio listo"
    
    case .managmentTvProblemAllDecos : return "/\(name) – Gestion tv – Problemas en todos los decos"
    case .managmentTvProblemPixelated : return "/\(name) – Gestion tv – Pantalla pixeleada"
    
    case .managmentTvControlRemote: return "/\(name) – Gestion tv – Control remoto"
        
    case .managmentTvControlRemoteDta1 : return "/\(name) – Gestion tv – Control DTA 1"
    case .managmentTvControlRemoteDta2 : return "/\(name) – Gestion tv – Control DTA 2"
    case .managmentTvControlRemoteDta3 : return "/\(name) – Gestion tv – Control DTA 3"
    case .managmentTvControlRemoteDta4 : return "/\(name) – Gestion tv – Problemas control DTA"
        
    case .managmentTvControlRemoteUniversal1 : return "/\(name) – Gestion tv – Control Universal 1"
    case .managmentTvControlRemoteUniversal2 : return "/\(name) – Gestion tv – Control Universal 2"
    case .managmentTvControlRemoteUniversal3 : return "/\(name) – Gestion tv – Control Universal 3"
    case .managmentTvControlRemoteUniversal4 : return "/\(name) – Gestion tv – Problemas control universal"

    case .videosTutorialesTelevision: return "/\(name) – Gestion tv – Videos tutoriales"
        
    case .managemenTvExpandedDecos: return "/\(name) – Gestion tv – Tus decos expandido"
    
        
        //  new design
    case .televisionHFC: return "/Soluciones tecnicas - Television HFC"
    case .errorTelevisionDTH: return "/Soluciones tecnicas - Television – Error al cargar decos DTH"
    case .listDecosTelevisionDTH: return "/Soluciones tecnicas tv - Listado de decos DTH"
    case .televisionDTH: return "/Soluciones tecnicas - Television DTH"
    case .errorLoadStateDecosDTH: return "/Soluciones tecnicas tv - Listado de decos DTH - Error al cargar estado"
    case .infoDTH: return "/Soluciones tecnicas tv - Listado de decos DTH - Pop UP U/A Pairing ID"
    case .confirmParingDTH: return "/Soluciones tecnicas tv - Verificaciones previas a sincronizacion"
    case .synchronazingDecoDTH: return "/Soluciones tecnicas tv - Sincronizando deco"
    case .synchronizationSuccess: return "/Soluciones tecnicas tv - Tarjeta y deco sincronizados"
    case .youExceededRestartDTH: return "/Soluciones tecnicas tv - Excediste intentos sincronizar deco"
    case .listDecosTelevisionDTHCod01: return "/Soluciones tecnicas tv - COD 001 - Listado de decos"
    case .listDecosTelevisionDTHCod03: return "/Soluciones tecnicas tv - COD 003 - Listado de decos"
    case .listErrorDTH: return "/Soluciones tecnicas tv - Listado de codigos de error"
    case .technicalSolutionCod01: return "/Soluciones tecnicas tv - COD 001 - Tutorial"
    case .technicalSolutionCod02: return "/Soluciones tecnicas tv - COD 002 - Recuerda realizar recarga o pago"
    case .technicalSolutionCod03: return "/Soluciones tecnicas tv - COD 003 - Tutorial Pag 1"
    case .technicalSolutionCod032: return "/Soluciones tecnicas tv - COD 003 - Tutorial Pag 2"
    case .technicalSolutionCod033: return "/Soluciones tecnicas tv - COD 003 - Tutorial Pag 3"
    case .technicalSolutionCod03Adviser: return "/Soluciones tecnicas tv - COD 003 - Valores fuera de parametros"
    case .technicalSolutionCod04: return "/Soluciones tecnicas tv - COD 004 - Tutorial Pag 1"
    case .technicalSolutionCod042: return "/Soluciones tecnicas tv - COD 004 - Tutorial Pag 2"
    case .technicalSolutionCod05: return "/Soluciones tecnicas tv - COD 005 - Tutorial Pag 1"
    case .technicalSolutionCod052: return "/Soluciones tecnicas tv - COD 005 - Tutorial Pag 2"
    case .technicalSolutionCod07: return "/Soluciones tecnicas tv - COD 007 - Tutorial"

    }
}

func newHomeEvent(section: ClaroAnalytics.Screen.NewHomeEvent) -> String {
    switch section {
        
    case .reactivating: return "Nuevo HOME - Reactivando servicios"
    case .suspendedByRequest: return "Nuevo HOME - Suspendido por solicitud"
    case .suspendedByDebtWithAmount: return "Nuevo HOME - Suspendido por falta de pago con monto"
    case .suspendedByDebtNoAmount: return "Nuevo HOME - Suspendido por falta de pago sin monto"
    case .buttonTroubledService: return "Nuevo HOME - Problemas con servicios"
    case .televisionDTH: return "Nuevo HOME - Television DTH"
    case .televisionHFC: return "Nuevo HOME - Television HFC"
    case .televisionLTE: return "Nuevo HOME - Television LTE"
    case .telefoniaHFC: return "Nuevo HOME - Telefonia  HFC"
    case .internet: return "Nuevo HOME - Internet HFC"
    case .continueProblemInternet: return "Nuevo HOME - Falla persiste en servicio de internet"
    case .telefoniaError: return "Error estado del servicio sin info NCOS"
    case .continueProblemTelefonia: return "Nuevo HOME - Fallas de telefonía siguen NCOS"
    case .restartSuccesInternet: return "Nuevo HOME - Router reiniciado con exito"
    case .couldNotBeSolvedProblemRAI: return "Error no se pudo solucionar problema RAI"
    }
}

func newHomeScreen(section : ClaroAnalytics.Screen.NewHomeScreen) -> String {
    switch section {
    case .reactivating: return "/Nuevo HOME - Reactivando servicios"
    case .suspendedByRequest: return "/Nuevo HOME - Suspendido por solicitud"
    case .suspendedByDebtWithAmount: return "/Nuevo HOME - Suspendido por falta de pago con monto"
    case .suspendedByDebtNoAmount: return "/Nuevo HOME - Suspendido por falta de pago sin monto"
    case .problemTelefonia: return "/Nuevo HOME - Problema servicio telefonia NCOS"
    case .continueProblemTelefonia: return "/Nuevo HOME - Fallas de telefonía siguen NCOS"
    case .problemSolvedTelefonia: return "/Nuevo HOME - Falla solucionada NCOS"
    case .problemInternet: return "/Nuevo HOME - Problema servicio internet"
    case .continueProblemInternet: return "/Nuevo HOME - Falla persiste en servicio de internet"
    case .restartingInternet: return "/Nuevo HOME - Reiniciando router"
    case .restartSuccesInternet: return "/Nuevo HOME - Router reiniciado con exito"
    }
}

func errorServices(section : ClaroAnalytics.Screen.ErrorServices) -> String {
    switch section {
    case .errorConsultNcosControlled: return "Error de servicio - Consultar  NCOS C"
    case .errorConsultNcosNoControlled: return "Error de servicio - Consultar  NCOS NC"
    case .errorUpdateNcosControlled: return "Error de servicio - Actualizar NCOS C"
    case .errorUpdateNcosNoControlled: return "Error de servicio - Actualizar NCOS NC"
    case .errorRestartAutomaticInternetControlled: return "Error de servicio RAI C"
    case .errorRestartAutomaticNoInternetControlled: return "Error de servicio RAI NC"
    }
}


func televisionEvents(_ name: String, section: ClaroAnalytics.Screen.TelevisionEvents) -> String {
    switch section {
    case .managmentTvDecoProblems: return "\(name) – Gestion tv – Problemas deco"
    case .managmentTvDecoNoActive: return "\(name) – Gestion tv – Deco desactivado"
    case .managmentTvServiceNotContracted: return "\(name) - Tv - Servicio no contratado"
    case .managmentTvRestartModemTv: return "\(name) - Reinicar modem tv"
    case .managmentTvRestartDeco: return "\(name) – Reiniciar deco"
    case .managmentTvDecoRestarted: return "\(name) – Deco se reinicio con exito"
    case .managmentTvRestartDecoUps: return "\(name) – Reiniciar deco Ups"
    case .managmentTvAlias: return "\(name) – Gestion tv"
    case .managmentTvTechnologyNotAlowed: return "\(name) – Gestiones tv - Servicio en construccion"
        
    case .managmentTvDecoRestartedDirect: return "\(name) – Gestion tv - Reinicio directo"
    case .managmentTvDecoRestartedDirectProcess: return "\(name) – Gestion tv - Reinicio directo en proceso"
    case .managmentTvDecoRestartedDirectReady: return "\(name) – Gestion tv - Reinicio directo en listo"
    case .managmentTvDecoRestartedDirectNoActivate: return "\(name) – Gestion tv - Reinicio directo - Deco desactivado"
        
    case .managmentTvDecoRestartedStepTwoPopUp: return "\(name) – Gestion tv - Problema deco - Reinicio"
    case .managmentTvDecoRestartedStepTwo: return "\(name) - Gestion tv - Problemas deco - Reiniciando deco"
    case .managmentTvDecoRestartedStepTwoProcess: return "\(name) – Gestion tv – Problemas deco"
    case .managmentTvDecoRestartedStepTwoNoActivate: return "\(name) – Gestion tv - Problemas deco - Deco desactivado"
        
    case .managmentTvDecoRestartedNoSignal: return "\(name) - Gestion tv – No hay señal - Reiniciando deco"
    case .managmentTvDecoRestartedNoSignalProccess: return "\(name) – Gestion tv – No hay señal"
    case .managmentTvDecoRestartedNoSignalNoActivate: return "\(name) – Gestion tv - No hay señal - Deco desactivado"
    case .managmentTvDecoRestartedNoSignalPopUp: return "\(name) – Gestion tv - No hay señal - Reinicio"
   
   
        
    case .managmentTvDecoProblemsNoSignal: return "\(name) – Gestion tv – No hay señal"
    case .managmentTvDecoProblemPixelated : return "\(name) – Gestion tv – Pantalla pixeleada"
    
    case .managmentTvDecoRestartedStepTwoReady: return "\(name) – Gestion tv – Problemas deco - Reinicio listo"
    case .managmentTvDecoRestartedNoSignalReady: return "\(name) – Gestion tv – No hay señal – Reinicio listo"
        
    case .managmentTvDecoProblemAllDecos: return "\(name) – Gestion tv – Problemas en todos los decos"
        
    case .managmentTvControlRemote: return "\(name) – Gestion tv – Control remoto"
    
    case .managmentTvControlRemoteDta1: return "\(name) – Gestion tv – Control DTA 1"
    case .managmentTvControlRemoteDta2: return "\(name) – Gestion tv – Control DTA 2"
    case .managmentTvControlRemoteDta3: return "\(name) – Gestion tv – Control DTA 3"
    case .managmentTvControlRemoteDta4: return "\(name) – Gestion tv – Problemas control DTA"
        
    case .managmentTvControlRemoteUniversal1 : return "\(name) – Gestion tv – Control Universal 1"
    case .managmentTvControlRemoteUniversal2 : return "\(name) – Gestion tv – Control Universal 2"
    case .managmentTvControlRemoteUniversal3 : return "\(name) – Gestion tv – Control Universal 3"
    case .managmentTvControlRemoteUniversal4 : return "\(name) – Gestion tv – Problemas control universal"
        
    case .managmentTvVideosTutoriales : return "\(name) – Gestion tv – Videos tutoriales"
        
    case .managmentTvRestartDirectSuccess: return "\(name) – Gestion tv – Reinicio directo – Exitoso"

        // new design
    case .televisionHFC: return "Soluciones tecnicas - Television HFC"
    case .errorTelevisionDTH: return "Soluciones tecnicas - Television - Error al cargar decos DTH"
    case .listDecosTelevisionDTH: return "Soluciones tecnicas tv - Listado de decos DTH"
    case .televisionDTH: return "Soluciones tecnicas - Television DTH"
    case .errorLoadStateDecosDTH: return "Soluciones tecnicas tv - Listado de decos DTH - Error al cargar estado"
    case .infoDTH: return "Soluciones tecnicas tv - Listado de decos DTH - Pop UP U/A Pairing ID"
    case .confirmParingDTH: return "Soluciones tecnicas tv - Verificaciones previas a sincronizacion"
    case .synchronazingDecoDTH: return "Soluciones tecnicas tv - Sincronizando deco"
    case .synchronizationSuccess: return "Soluciones tecnicas tv - Tarjeta y deco sincronizados"
    case .youExceededRestartDTH: return "Soluciones tecnicas tv - Excediste intentos sincronizar deco"
    case .listDecosTelevisionDTHCod01: return "Soluciones tecnicas tv - COD 001 - Listado de decos"
    case .listDecosTelevisionDTHCod03: return "Soluciones tecnicas tv - COD 003 - Listado de decos"
    case .listErrorDTH : return "Soluciones tecnicas tv - Listado de codigos de error"
    case .technicalSolutionCod01: return "Soluciones tecnicas tv - COD 001 - Tutorial"
    case .technicalSolutionCod02: return "Soluciones tecnicas tv - COD 002 - Recuerda realizar recarga o pago"
    case .technicalSolutionCod03: return "Soluciones tecnicas tv - COD 003 - Tutorial Pag 1"
    case .technicalSolutionCod032: return "Soluciones tecnicas tv - COD 003 - Tutorial Pag 2"
    case .technicalSolutionCod033: return "Soluciones tecnicas tv - COD 003 - Tutorial Pag 3"
    case .technicalSolutionCod03Adviser: return "Soluciones tecnicas tv - COD 003 - Valores fuera de parametros"
    case .technicalSolutionCod04: return "Soluciones tecnicas tv - COD 004 - Tutorial Pag 1"
    case .technicalSolutionCod042: return "Soluciones tecnicas tv - COD 004 - Tutorial Pag 2"
    case .technicalSolutionCod07: return "Soluciones tecnicas tv - COD 007 - Tutorial"
    case .technicalSolutionCod05: return "Soluciones tecnicas tv - COD 005 - Tutorial Pag 1"
    case .technicalSolutionCod052: return "Soluciones tecnicas tv - COD 005 - Tutorial Pag 2"
    }
}

func technicalVisitScreen(section: ClaroAnalytics.Screen.technicalVisitScreen) -> String {
    switch section {
    case .popupRescheduleVisit: return "/Visitas programadas - Confirmacion de reprogramacion – Pop Up"
    case .popupCancelVisit: return "/Visitas programadas - Confirmacion de cancelacion pop up"
    case .reasonsRescheduleVisit: return "/Visitas programadas - Motivo de reprogramacion"
    case .reasonsCancelVisit: return "/Visitas programadas - Motivo de cancelacion"
    case .noAvailabilityHours: return "/Visitas programadas - No hay horarios disponibles"
    case .selectionDate: return "/Visitas programadas - Selecciona fecha y hora"
    case .newDateTechnicalVisit: return "/Visitas programadas - Nueva fecha para visita "
    case .rescheduleProblem: return "/Visitas programadas - Problema al reprogramar"
    case .dateNoAvailability: return "/Visitas programadas - Horario no disponible"
    case .rescheduleSuccess: return "/Visitas programadas - Reprogramacion exitosa"
    case .secondReschedule: return "/Visitas programadas - Ultima reprogramacion exitosa"
    case .technicianGrasping : return "/Visitas programadas - Ya hay tecnico asignado"
    case .noReprograming : return "/Visitas programadas - No es posible reprogramar por smarthome"
    case .technicalVisits: return "/Visitas tecnicas programadas"
    case .successCancelVisit: return "/Visitas programadas – Visita cancelada con exito"
    case .errorCancelVisit: return "/Visitas programadas – Problema al cancelar"
    case .unassignedTechnician: return "/Visitas programadas  - Tecnico por asignar"
    case .errorVisitHome: return "/Nuevo HOME - Error al cargar informacion de visitas tecnicas"
    case .successVisitHome: return "/Nuevo HOME - Visitas tecnicas programadas"
    }
}

func technicalVisitEvent(section: ClaroAnalytics.Screen.technicalVisitEvent) -> String {
    switch section {
    case .popupRescheduleVisit: return "Visitas programadas - Confirmacion de reprogramacion – Pop Up"
    case .popupCancelVisit: return "Visitas programadas - Confirmacion de cancelacion pop up"
    case .reasonsRescheduleVisit: return "Visitas programadas - Motivo de reprogramacion"
    case .reasonsCancelVisit: return "Visitas programadas - Motivo de cancelacion"
    case .noAvailabilityHours: return "Visitas programadas - No hay horarios disponibles"
    case .selectionDate: return "Visitas programadas - Selecciona fecha y hora"
    case .newDateTechnicalVisit: return "Visitas programadas - Nueva fecha para visita "
    case .rescheduleProblem: return "Visitas programadas - Problema al reprogramar"
    case .dateNoAvailability: return "Visitas programadas - Horario no disponible"
    case .rescheduleSuccess: return "Visitas programadas - Reprogramacion exitosa"
    case .secondReschedule: return "Visitas programadas - Ultima reprogramacion exitosa"
    case .technicianGrasping : return "Visitas programadas - Ya hay tecnico asignado"
    case .noReprograming : return "Visitas programadas - No es posible reprogramar por smarthome"
    case .technicalVisits: return "Visitas tecnicas programadas"
    case .successCancelVisit: return "Visitas programadas – Visita cancelada con exito"
    case .errorCancelVisit: return "Visitas programadas – Problema al cancelar"
    case .unassignedTechnician: return "Visitas programadas  - Tecnico por asignar"
    case .errorVisitHome: return "Nuevo HOME - Error al cargar informacion de visitas tecnicas"
    case .successVisitHome: return "Nuevo HOME - Visitas tecnicas programadas"
    }
    
}

func telephoneStateScreen(_ name: String, section: ClaroAnalytics.Screen.Telephone) -> String {
    switch section {
    case .managementPhone: return "/\(name) – Gestiones telefono - Tutorial"
    case .managmentPhoneReconnecting: return "/\(name) – Gestion telefono – Suspendido a solicitud"
    case .managmentPhoneSuspendedByRequest: return "/\(name) – Gestion telefono – Suspendido a solicitud"
    case .managmentPhoneSuspendedByDebt: return "/\(name) – Gestion telefono – Suspendido por deuda"
    case .managmentPhoneTechnologyNotAlowed: return "/\(name) – Gestiones telefono – Servicio en construccion"
    
     // new design
    case .problemServiceTelephone: return "/Soluciones de telefono - Problema servicio telefonia NCOS"
    case .bugFixedTelephone: return "/Soluciones de telefono – Falla solucionada NCOS"
    case .continueProblemTelefonia: return "/Soluciones de telefono – Fallas de telefonia siguen NCOS"
    case .managmentPhoneServiceNotContracted: return "/Soluciones tecnicas telefonia - No tienes servicios contratados"
    }
    
}

func telephoneEvents(_ name: String, section: ClaroAnalytics.Screen.TelephoneEvents) -> String {
    switch section {
    case .managmentPhoneServiceNotContracted: return "Soluciones tecnicas telefonia - No tienes servicios contratados"
    case .managmentPhone: return "\(name) Gestion telefono  tutorial"
    case .managmentPhoneTechnologyNotAlowed: return "\(name) - Gestiones telefono - Servicio en construccion"
    
    case .problemServiceTelephone: return "Soluciones de telefono - Problema servicio telefonia NCOS"
    case .bugFixedTelephone: return "Soluciones de telefono – Falla solucionada NCOS"
    case .continueProblemTelefonia: return "/Soluciones de telefono – Fallas de telefonia siguen NCOS "
    }
    
}


func moreStateScreen(_ name: String, section: ClaroAnalytics.Screen.More) -> String {
    switch section {
    case .more: return "/\(name) - Mas"
        
    }
    
}
func moreEvents(_ name: String, section: ClaroAnalytics.Screen.MoreEvents) -> String {
    switch section {
    case .closeSession: return "\(name) - Mas"
        
    }
    
}

func notificationStateScreen(_ name: String, section: ClaroAnalytics.Screen.Notificacion) -> String {
    switch section {
    case .noNotification: return "/Sin Notificacion - \(name)"
    case .notification: return "/Con Notificacion - \(name)"
    case .notificationView: return "/Notificacion vista - \(name)"
    }
}

func notificationEvents(_ name: String, section: ClaroAnalytics.Screen.NotificacionEvents) -> String {
    switch section {
    case .noNotification: return "Sin Notificacion - \(name)"
    case .notification: return "Con Notificacion - \(name)"
    case .notificationView: return "Notificacion vista - \(name)"
    case .notificationPush: return "\(name) - Notificacion"
    case .withNotificationTab: return "Boton Con Notificaciones - \(name)"
    case .withOutNotificationTab: return "Boton Sin Notificaciones - \(name)"
    }
}
func notificationSpecificEvents(_ name: String, info: String, section: ClaroAnalytics.Screen.NotificacionSpecificEvents) -> String {
    switch section {
    case .notificationState: return "\(name) – Estado \(info)"
    case .notificationTitle: return " \(name) - \(info)"
    case .notificationTotal: return " \(name) - \(info)"
    }
}


func clientCodeTag(_ code: String) -> String{
    return "ID(\(code))"
}
func districtTag(_ name: String) -> String{
    return "\(name)"
}
func contractTag(_ service: String) -> String{
    return "Boton Contratar - \(service)"
}

func planTypeTag(_ name: String) -> String{
    return "\(name)"
}


func decoProblemas(_ serie: String, modelo: String) -> String{
    return "[\(serie)][\(modelo)] Reiniciar"
}

func decoNoActive(_ serie: String, modelo: String) -> String{
    return "[\(serie)][\(modelo)] Llamar a un asesor"
}

func decoGoToHome(_ serie: String, modelo: String) -> String{
    return "[\(serie)][\(modelo)] Volver al inicio"
}

func errorServerNotification(_ name: String) -> String {
    return "\(name) - Error de servicio"
}

func decoDetail(serie: String, modelo: String) -> String{
    return "[\(serie)][\(modelo)]"
}

func restartDecoSuccess(packageName: String, indexDeco : Int , totalDecos: Int) -> String {
     return "Reinicio exitoso [\(indexDeco)][\(totalDecos)]"
}
