//
//  AuthErrorCode.swift
//  Schools
//
//  Created by Ahmad MacBook on 05/01/2022.
//

import Foundation
import Firebase

extension AuthErrorCode {
    
    var description: String? {
        
        switch self {
            
        case .emailAlreadyInUse:
            return "الايميل مسجل مسبقا"
        case .userDisabled:
            return "المستخدم غير نشط حاليا"
        case .operationNotAllowed:
            return "العملية غير معتمدة"
        case .invalidEmail:
            return "صيغة الايميل غير صحيحه"
        case .wrongPassword:
            return "كلمة المرور غير صحيحه"
        case .userNotFound:
            return "لم يتم العثور على حساب مستخدم"
        case .networkError:
            return "حدث خطأ في الشبكة. حاول مرة اخرى"
        case .weakPassword:
            return "كلمة المرور ضعيفه"
        case .missingEmail:
            return "الرجاء إدخال عنوان البريد الإلكتروني الخاص بك"
        case .internalError:
            return "خطأ داخلي يرجى المحاولة مرة أخرى"
        case .invalidCustomToken:
            return "الرمز غير صالح"
        case .tooManyRequests:
            return "لقد أرسلت عددًا كبيرًا جدًا من الطلبات إلى الخادم. أرجو الإنتظار"
        default:
            return nil
        }
    }
}
