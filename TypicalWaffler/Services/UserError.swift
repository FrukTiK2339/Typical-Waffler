//
//  UserError.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 01.09.2023.
//

import Foundation

enum UserError {
    case notFilled
    case photoNotExist
    case cannotGetUserInfo
    case cannotUnwrapData
}

extension UserError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Заполнены не все поля!", comment: "")
        case .photoNotExist:
            return NSLocalizedString("Не выбрана фотография!", comment: "")
        case .cannotGetUserInfo:
            return NSLocalizedString("Не удалось загрузить данные пользователя!", comment: "")
        case .cannotUnwrapData:
            return NSLocalizedString("Не удалось конвертировать данные пользователя!", comment: "")
        }
    }
}
