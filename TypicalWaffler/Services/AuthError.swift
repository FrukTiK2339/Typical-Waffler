//
//  AuthError.swift
//  TypicalWaffler
//
//  Created by Дмитрий Рыбаков on 01.09.2023.
//

import Foundation

enum AuthError {
    case notFilled
    case invalidEmail
    case passwordsNotMatched
    case unknownError
    case serverError
}

extension AuthError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .notFilled:
            return NSLocalizedString("Не все поля заполнены!", comment: "")
        case .invalidEmail:
            return NSLocalizedString("Недопустимый формат почты!", comment: "")
        case .passwordsNotMatched:
            return NSLocalizedString("Пароли не совпадают!", comment: "")
        case .unknownError:
            return NSLocalizedString("Неизвестная ошибка!", comment: "")
        case .serverError:
            return NSLocalizedString("Сервер недоступен. Попробуйте позже!", comment: "")
        }
    }
}
