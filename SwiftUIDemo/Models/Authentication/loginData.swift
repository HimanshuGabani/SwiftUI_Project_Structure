//
//  loginData.swift
//  SwiftUIDemo
//
//  Created by Himanshu on 29/03/24.
//

import Foundation

struct LoginData: Codable {
    var data: MLogin
    
    struct MLogin: Codable, Identifiable, Hashable{
        var id: Int
        var name: String?
        var email: String?
        var userToken: String?
//        let deviceToken, deviceOS, passwordLock, gratitude: String?
//        let gratitudeTime, gratitudeRescheduleTime, serverGratitudeTime, serverGratitudeRescheduleTime: String?
//        let affirmation, affirmationTime, serverAffirmationTime, status: String?
//        let versionType, group, version, timeZone: String?
//        let ipAddress, createdAt, updatedAt, lastLoginAt: String?
//        let experienceSubmit: String?
     
        
        private enum CodingKeys: String, CodingKey {
            case id, name, email, gratitude, status, group, version
            case userToken = "user_session_token"
            case providerType = "provider_type"
            case deviceToken = "device_token"
            case deviceOS = "device_os"
            case passwordLock = "password_lock"
            case gratitudeTime = "gratitude_time"
            case gratitudeRescheduleTime = "gratitude_reschedule_time"
            case serverGratitudeTime = "server_gratitude_time"
            case serverGratitudeRescheduleTime = "server_gratitude_reschedule_time"
            case affirmationTime = "affirmation_time"
            case serverAffirmationTime = "server_affirmation_time"
            case versionType = "version_type"
            case timeZone = "time_zone"
            case ipAddress = "ip_address"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
            case lastLoginAt = "last_login_at"
            case experienceSubmit = "experience_submit"
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.id = try container.decodeValue(forKey: .id)
            self.name = try container.decodeValueIfPresent(forKey: .name)
            self.email = try container.decodeValueIfPresent(forKey: .email)
            self.userToken = try container.decodeValueIfPresent(forKey: .userToken)
            
        }
        
        func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try container.encode(id, forKey: .id)
            try container.encode(name, forKey: .name)
            try container.encode(email, forKey: .email)
            try container.encode(userToken, forKey: .userToken)
        }
    }
}
