
import Foundation

public extension String {
    
    var localized: String {
        localized(forResource: nil)
    }
    
    func localized(
        forResource name: String?,
        table: String? = nil,
        in bundle: Bundle? = .main
    ) -> String {
        let resourceType: String = "lproj"
        if let name, let path = bundle?.path(forResource: name, ofType: resourceType),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: table)
        }
        
        let languageCode: String? = {
            if #available(iOS 16, *) {
                return Locale.current.language.languageCode?.identifier
            } else {
                return Locale.current.languageCode
            }
        }()
        
        if let languageCode,
           let path = bundle?.path(forResource: languageCode, ofType: resourceType),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: table)
        }
        
        if let path = bundle?.path(forResource: "en", ofType: resourceType),
           let bundle = Bundle(path: path) {
            return bundle.localizedString(forKey: self, value: nil, table: table)
        }
        return self
    }
    
    func localized(with arguments: CVarArg...) -> String {
        localizedWithArguments(arguments)
    }
    
    func localizedWithArguments(_ arguments: [CVarArg]) -> String {
        String(format: self.localized, arguments: arguments)
    }
}
