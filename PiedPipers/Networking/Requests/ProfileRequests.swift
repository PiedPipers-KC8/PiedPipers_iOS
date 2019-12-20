//
//  ProfileRequests.swift
//  PiedPipers
//
//  Created by david rogel pernas on 01/11/2019.
//  Copyright © 2019 david rogel pernas. All rights reserved.
//

import Foundation

struct GetProfileRequest: APIRequest
{
    typealias Response = Profile
    
    var method: Methods { return .GET }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self.Endpoint { return profileGet }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken]
    }
    
    let currentUserCuid: String
}

struct GetProfileByIdRequest: APIRequest
{
    typealias Response = Profile
    
    var method: Methods { return .GET }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self.Endpoint { return (profileByIdGet + findUserCuid) }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken]
    }
    
    let currentUserCuid: String
    let findUserCuid: String
}

struct UpdateProfileRequest: APIRequest
{
    typealias Response = Profile
    
    var method: Methods { return .PATCH }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self.Endpoint { return profileGet }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken, "Content-Type":"application/json"]
    }
    
    var body: Any {
        return profile.toBody()
    }
    
    let currentUserCuid: String
    let profile: Profile
}

struct GetInstrumentsRequest: APIRequest
{
    typealias Response = AvailableInstruments
    
    var method: Methods { return .GET }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self.Endpoint { return tagsGet }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken]
    }
    
    let currentUserCuid: String
}

// TODO: Terminal el Avatar!!!
struct UpdateProfileAvatarRequest: APIRequest
{
    typealias Response = Profile
    
    var method: Methods { return .POST }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self.Endpoint { return avatarUpdate }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken, "Content-Type":"application/json"]
    }
    
    var body: Any {
        return ["photo":data]
    }
    
    let currentUserCuid: String
    let data: Data
}

struct UnfollowOtherUserRequest: APIRequest
{
    typealias Response = Profile
    
    var method: Methods { return .POST }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self._Endpoint { return .unfollow }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken, "Content-Type":"application/json"]
    }
    
    var body: Any {
        return ["userId":followUserCuid]
    }
    
    let currentUserCuid: String
    let followUserCuid: String
}


struct GetCurrentProfileBand: APIRequest
{
    typealias Response = ProfileList
    
    var method: Methods { return .GET }
    
    var baseUrl: String { return urlToServer }
    
    var path: Self._Endpoint { return .myBand }
    
    var headers: [String : String] {
        let authToken = StoreManager.shared.getString(withKey: currentUserCuid)
        return ["Authorization":authToken]
    }
    
    let currentUserCuid: String
}
