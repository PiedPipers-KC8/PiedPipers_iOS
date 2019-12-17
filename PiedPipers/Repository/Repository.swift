//
//  Repository.swift
//  PiedPipers
//
//  Created by david rogel pernas on 06/11/2019.
//  Copyright © 2019 david rogel pernas. All rights reserved.
//

import Foundation


final class Repository
{
    static let fake: RepositoryFactory = FakeRepository()
    static let remote: RepositoryFactory = RemoteRepository()
}

protocol RepositoryFactory: class
{
    // MARK: - USER REQUESTS
    /// Crea un usuario
    func createUser(withEmail email: String, withPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    /// Loggin con un usuario creado
    func loginUser(withEmail email: String, withPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    /// Actualizar usuario
    func updateUser(currentUserCUID cuid: String, newPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    /// Borra un usuario
    func deleteUser(currentUserCUID cuid: String, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    
    // MARK: - PROFILE REQUESTS
    /// Obtener tú perfil
    func getProfile(currenUserCUID cuid: String, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    /// Obtener el perfil de otro usuario
    func getProfile(currentUserCUID cuid: String, userPickedCUID otherCuid: String, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    /// Actualizar tú perfil
    func updateProfile(currentUserCUID cuid: String, newProfile profile: Profile, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    /// Actualizar el avatar del usuario
    func updateAvatar(currentUserCUID cuid: String, image data: Data, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    /// Obtener los instrumentos que se pueden usar
    func getAvaliableInstruments(currentUserCUID cuid: String, success: @escaping ([String]?) -> Void, failure: @escaping (Error?) -> Void)
    
    // MARK: - NOTIFICATIONS
    /// Borrar una notificación
    func deleteNotification(currentUserCUID cuid: String, notificationToDeleteCUID notiCuid: String, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    /// Obtener la lista de notificaciones que te han llegado
    func getListOfNotifications(currentUserCUID cuid: String, limit: Int, offset: Int, success: @escaping (NotiList) -> Void, failure: @escaping (Error?) -> Void)
    /// Redimir una notificación
    func redeemNotification(currentUserCUID cuid: String, notificationCUID notiCuid: String, success: @escaping (Noti) -> Void, failure: @escaping (Error?) -> Void)
    
    // MARK: - SEARCH REQUESTS
    func searchProfiles(currentUserCUID cuid: String, withParameters parameters: SearchProfileParameters, limit: Int, offset: Int, success: @escaping (ProfileList?) -> Void, failure: @escaping (Error?) -> Void)
    
    func searchLocals(currentUserCUID cuid: String, withParameters parameters: SearchLocalParameters, limit: Int, offset: Int, success: @escaping (LocalList?) -> Void, failure: @escaping (Error?) -> Void)
}

final class FakeRepository: RepositoryFactory
{
    func getListOfNotifications(currentUserCUID cuid: String, limit: Int, offset: Int, success: @escaping (NotiList) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
    }
    
    func redeemNotification(currentUserCUID cuid: String, notificationCUID notiCuid: String, success: @escaping (Noti) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
    }
    
    func deleteNotification(currentUserCUID cuid: String, notificationToDeleteCUID notiCuid: String, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void) {
        // TODO
    }
    
    
    // Falta añadir videos a los FAKE perfiles
    private let userProfile = Profile(cuid: "", name: "name", location: Location(lat: 20.0, long: 20.0), contact: Contact(type: .email, data: "Correo.a.encodear@correo.com"), instruments: ["bateria", "guitarra", "voz"], videos: nil, description: "una descripción rexulona", photo: "una foto")

    private let otherProfile = Profile(cuid: "", name: "name", location: Location(lat: 20.0, long: 20.0), contact: Contact(type: .email, data: "Correo.a.encodear@correo.com"), instruments: ["bateria", "guitarra", "voz"], videos: nil, description: "una descripción rexulona", photo: "una foto")

    func getProfile(currenUserCUID cuid: String, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        success(userProfile)
    }

    func getProfile(currentUserCUID cuid: String, userPickedCUID otherCuid: String, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        success(otherProfile)
    }

    func updateProfile(currentUserCUID cuid: String, newProfile profile: Profile, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        success(userProfile)
    }
    
    func updateAvatar(currentUserCUID cuid: String, image data: Data, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        
    }
    
    func searchProfiles(currentUserCUID cuid: String, withParameters parameters: SearchProfileParameters, limit: Int, offset: Int, success: @escaping (ProfileList?) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
        success(nil)
    }
    
    func searchLocals(currentUserCUID cuid: String, withParameters parameters: SearchLocalParameters, limit: Int, offset: Int, success: @escaping (LocalList?) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
        success(nil)
    }
    
    func getAvaliableInstruments(currentUserCUID cuid: String, success: @escaping ([String]?) -> Void, failure: @escaping (Error?) -> Void)
    {
        success(["batería", "guitarra", "bajo", "voz"])
    }
    
    // USER
    func createUser(withEmail email: String, withPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
    }
    
    func loginUser(withEmail email: String, withPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
    }
    
    func updateUser(currentUserCUID cuid: String, newPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
    }
    
    func deleteUser(currentUserCUID cuid: String, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    {
        // TODO
    }
}

final class RemoteRepository: RepositoryFactory
{
    // MARK: - USER
    
    func createUser(withEmail email: String, withPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let createUserRequest = CreateUserRequest(email: email, password: pass)
            
        createUserRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    func loginUser(withEmail email: String, withPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let loginUserRequest = LoginUserRequest(email: email, password: pass)
        
        loginUserRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    func updateUser(currentUserCUID cuid: String, newPassword pass: String, success: @escaping (User?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let updateUserRequest = UpdateUserRequest(currentUserCuid: cuid, password: pass)
        
        updateUserRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    func deleteUser(currentUserCUID cuid: String, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    {
        let deleteUserRequest = DeleteUserRequest(currentUserCuid: cuid)
        
        deleteUserRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    // MARK: - PROFILE
    
    func getProfile(currenUserCUID cuid: String, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let getUserProfileRequest = GetProfileRequest(currentUserCuid: cuid)

        getUserProfileRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }

    func getProfile(currentUserCUID cuid: String, userPickedCUID otherCuid: String, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let getOtherUserProfile = GetProfileByIdRequest(currentUserCuid: cuid, findUserCuid: otherCuid)

        getOtherUserProfile.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }

    func updateProfile(currentUserCUID cuid: String, newProfile profile: Profile, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let updateCurrentUserProfile = UpdateProfileRequest(currentUserCuid: cuid, profile: profile)

        updateCurrentUserProfile.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    func updateAvatar(currentUserCUID cuid: String, image data: Data, success: @escaping (Profile?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let updateCurrentUserAvatar = UpdateProfileAvatarRequest(currentUserCuid: cuid, imgData: data)
        
        updateCurrentUserAvatar.makeUpload { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    func getAvaliableInstruments(currentUserCUID cuid: String, success: @escaping ([String]?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let getInstrumentsRequest = GetInstrumentsRequest(currentUserCuid: cuid)
        
        getInstrumentsRequest.makeRequest { (result) in
            
            switch result
            {
            case .success(let data):
                success(data.items)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    // MARK: - NOTIFICATIONS
    
    func deleteNotification(currentUserCUID cuid: String, notificationToDeleteCUID notiCuid: String, success: @escaping (Int) -> Void, failure: @escaping (Error?) -> Void)
    {
        let deleteNotificationRequest = DeleteNotificationRequest(currentUserCuid: cuid, notiCuidToDelete: notiCuid)
        
        deleteNotificationRequest.makeRequest { (result) in
           switch result
           {
           case .success(let data):
                success(data)
           case .failure(let err):
                failure(err)
           }
        }
    }
    
    func getListOfNotifications(currentUserCUID cuid: String, limit: Int, offset: Int, success: @escaping (NotiList) -> Void, failure: @escaping (Error?) -> Void)
    {
        let getListNotificationsRequest = ListNotificationsRequest(currentUserCuid: cuid, limit: limit, offset: offset)

        getListNotificationsRequest.makeRequest { (result) in
           switch result
           {
           case .success(let data):
                success(data)
           case .failure(let err):
                failure(err)
           }
        }
    }
    
    func redeemNotification(currentUserCUID cuid: String, notificationCUID notiCuid: String, success: @escaping (Noti) -> Void, failure: @escaping (Error?) -> Void)
    {
        let redeemNotificationRequest = RedeemNotificationRequest(currentUserCuid: cuid, notificationCuid: notiCuid)
        
        redeemNotificationRequest.makeRequest { (result) in
           switch result
           {
           case .success(let data):
                success(data)
           case .failure(let err):
                failure(err)
           }
        }
    }
    
    // MARK: - SEARCHING
    
    func searchProfiles(currentUserCUID cuid: String, withParameters parameters: SearchProfileParameters, limit: Int, offset: Int, success: @escaping (ProfileList?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let getProfilesBySearchingRequest = GetProfileBySearchingRequest(cuid: cuid,profileParameters: parameters, limit: 10, offset: 10)
        
        getProfilesBySearchingRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
    func searchLocals(currentUserCUID cuid: String, withParameters parameters: SearchLocalParameters, limit: Int, offset: Int, success: @escaping (LocalList?) -> Void, failure: @escaping (Error?) -> Void)
    {
        let getLocalsBySearchingRequest = GetLocalBySearchingRequest(cuid: cuid, localParameters: parameters, limit: limit, offset: offset)
        
        getLocalsBySearchingRequest.makeRequest { (result) in
            switch result
            {
            case .success(let data):
                success(data)
            case .failure(let err):
                failure(err)
            }
        }
    }
    
}
