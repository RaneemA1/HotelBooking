//
//
//import Foundation
//import SwiftUI
//
//class UserSettings: ObservableObject {
//    
//    @Published var lang: String
//    
//    
//    //MARK: change the direction with the language
//    var direction: LayoutDirection {
//        lang.contains("ar") ?  .rightToLeft : .leftToRight
//    }
//
//    let english = [
//        "Payment received": "Payment received",
//        "Successfully": "Successfully",
//        "Congratulations🎉": "Congratulations🎉",
//        "welcome": "Welcome to MyHotel",
//        "toArabic":"For Arabic Language",
//        "Riyadh":"Riyadh",
//        "Makkah":"Makkah",
//        "Jeddah":"Jeddah",
//        "Taief":"Taief",
//        "Abha":"Abha",
//        "To Continue in English": "To Continue in English",
//        "See All":"See All",
//        "Best Hotels":"Best Hotels",
//        "Search For Hotel":"Search For Hotel",
//        "Back to Home": "Back to Home",
//        "Your booking has beeb confirmed": "Your booking has been confirmed",
//        "Photos":"Photos",
//        "Select Date :": "Select Date :",
//        "Select Guest :": "Select Guest :",
//        "Choose":"Choose",
//        "Add":"Add",
//        "Confirm":"Confirm",
//        "Overview":"Overview",
//        "SR/night":"SR/night",
//        "$":"$",
//        "/night":"/night",
//    ]
//    let arabic = [
//        "Payment received": "تمت عملية الدفع",
//        "Successfully": "بنجاح",
//        "Congratulations🎉": "🎉تهانينا",
//        "welcome":"مرحبا بك في فندقي",
//        "toArabic": "للغة العربية اضغط هنا",
//        "Riyadh":"الرياض",
//        "Makkah":"مكه",
//        "Jeddah":"جده",
//        "Taief":"الطائف",
//        "Abha":"أبها",
//        "To Continue in English": "للغة الانجليزيه",
//        "See All":"للمزيد",
//        "Best Hotels":"آفضل الفنادق",
//        "Search For Hotel":"البحث عن فنادق",
//        "Back to Home": "العودة للصفحة الرئيسية",
//        "Your booking has beeb confirmed":"تم تأكيد الحجز",
//        "Photos":"الصور",
//        "Select Date :": "حدد اليوم :",
//        "Select Guest :": "حدد الزوار :",
//        "Choose":"اختر",
//        "Add":"اضافة",
//        "Confirm":"تأكيد",
//        "Overview":"نظرة عامة",
//        "SR/night":"ريال/لليلة",
//        "$":"ريال",
//        "/night":"/لليلة",
//    ]
//    //MARK: yuo can change any thing not only text
//    init(lang: String) {
//        self.lang = lang
//    }
//    
//    //MARK: change the language
//    func changeLanguage() {
//        if (lang.contains("ar")) {
//            lang = "en"
//        } else {
//            lang = "ar"
//        }
//    }
//    
//    func anyText(_ string: String, lang: String) -> String {
//        if (lang.contains("ar")) {
//            return arabic[string] ?? string
//        }
//        return english[string] ?? string
//    }
//}
//
//func getDirection() -> LayoutDirection {
//    return getCurrentLang().contains("ar") ? .rightToLeft : .leftToRight
//}
//func getCurrentLang() -> String {
//    return String(Locale.preferredLanguages.first?.prefix(2) ?? " ")
//}
