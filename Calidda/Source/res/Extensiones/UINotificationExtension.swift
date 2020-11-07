//
//  UINotificationExtension.swift
//  ClaroHogar
//
//  Created by mescurra on 4/8/19.
//  Copyright © 2019 Claro. All rights reserved.
//
 
import Foundation
extension Notification.Name {
    static let didReceiveData = Notification.Name("didReceiveData")
    static let didCompleteTask = Notification.Name("didCompleteTask")
    static let completedLengthyDownload = Notification.Name("completedLengthyDownload")
    static let didEnableMenu = Notification.Name("didBlockMenu")
    static let didLoadFirstTab = Notification.Name("didLoadFirstTab")
    static let didReloadAfterPullToRefresh = Notification.Name("didReloadAfterPullToRefresh")
    static let didReloadHomeSinceManagment = Notification.Name("didReloadHomeSinceManagment")
    static let didUpdateTelevision = Notification.Name("didUpdateTelevision")
    static let didClearRequestOnTabChange = Notification.Name("didClearRequestOnTabChange")
    static let didReceiveNotification = Notification.Name("didReceiveNotification")
    static let didReloadAfterPushNotification = Notification.Name("didReloadAfterPushNotification")
    
    static let updateOnOffWifi = Notification.Name("didUpdateOnOffWifi")
    static let cancelOnOffWifi = Notification.Name("didCancelOnOffWifi")
    static let updateListRedes = Notification.Name("didUpdateListRedes")
    
    static let updateNumber = Notification.Name("didUpdateNumber")
    static let loginAfterRegister = Notification.Name("loginAfterRegister")
    
    static let refreshHomeAfterRestartModem = Notification.Name("refreshHomeAfterRestartModem")
    static let updateNcos = Notification.Name("didUpdateNacos")
    static let updateNcosHome = Notification.Name("didUpdateNacosHome")
    
    static let updateNcosCellForError = Notification.Name("didUpdateNcosCellForError")
    
    static let goToHome = Notification.Name("didGoToHome")
    static let didMoveInSolutions = Notification.Name("didMoveInSolutions")
    
    static let deleteTimerRestartModem = Notification.Name("didDeleteTimerRestartModem")
    static let deleteTimerRestartModemSolutions = Notification.Name("deleteTimerRestartModemSolutions")
    static let updateStateFive = Notification.Name("didUpdateStateFive")
    static let updateStateSix = Notification.Name("didUpdateStateSix")
    
    static let timerRestartModem = Notification.Name("timerRestartModem")
    static let timerRestartModemHome = Notification.Name("timerRestartModemHome")
    
    static let updateErrorRestartState5 = Notification.Name("updateErrorRestartState5")
    
    static let updateTechnicalVisits = Notification.Name("reloadTechnicalVisits")
    static let refreshTechnicalVisitsNotification = Notification.Name("refresh_technical_visits_notification")
    static let retryRescheduleTechnicalVisitsNotification = Notification.Name("retyr_technical_visits_notification")
    static let updateDTHView = Notification.Name("updateDTHView")
    static let askForDTHDecosNotification = Notification.Name("ask_for_dth_deco_notification")
}
