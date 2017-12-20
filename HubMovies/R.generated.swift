//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.color` struct is generated, and contains static references to 0 colors.
  struct color {
    fileprivate init() {}
  }
  
  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `Info.plist`.
    static let infoPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "Info", pathExtension: "plist")
    /// Resource file `URLs.plist`.
    static let urLsPlist = Rswift.FileResource(bundle: R.hostingBundle, name: "URLs", pathExtension: "plist")
    
    /// `bundle.url(forResource: "Info", withExtension: "plist")`
    static func infoPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.infoPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "URLs", withExtension: "plist")`
    static func urLsPlist(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.urLsPlist
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.font` struct is generated, and contains static references to 0 fonts.
  struct font {
    fileprivate init() {}
  }
  
  /// This `R.image` struct is generated, and contains static references to 1 images.
  struct image {
    /// Image `iconMovie`.
    static let iconMovie = Rswift.ImageResource(bundle: R.hostingBundle, name: "iconMovie")
    
    /// `UIImage(named: "iconMovie", bundle: ..., traitCollection: ...)`
    static func iconMovie(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.iconMovie, compatibleWith: traitCollection)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.nib` struct is generated, and contains static references to 0 nibs.
  struct nib {
    fileprivate init() {}
  }
  
  /// This `R.reuseIdentifier` struct is generated, and contains static references to 1 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `movieCell`.
    static let movieCell: Rswift.ReuseIdentifier<ItemMoviesCell> = Rswift.ReuseIdentifier(identifier: "movieCell")
    
    fileprivate init() {}
  }
  
  /// This `R.segue` struct is generated, and contains static references to 0 view controllers.
  struct segue {
    fileprivate init() {}
  }
  
  /// This `R.storyboard` struct is generated, and contains static references to 2 storyboards.
  struct storyboard {
    /// Storyboard `Home`.
    static let home = _R.storyboard.home()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    
    /// `UIStoryboard(name: "Home", bundle: ...)`
    static func home(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.home)
    }
    
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    
    fileprivate init() {}
  }
  
  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 14 localization keys.
    struct localizable {
      /// Value: Alerta
      static let alert = Rswift.StringResource(key: "alert", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: As senhas devem ser iguais
      static let equalPassword = Rswift.StringResource(key: "equalPassword", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: CPF Inválido
      static let cpfInvalid = Rswift.StringResource(key: "cpfInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Campo Obrigatório
      static let fieldRequired = Rswift.StringResource(key: "fieldRequired", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Cancelar
      static let cancel = Rswift.StringResource(key: "cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Celular inválido
      static let cellInvalid = Rswift.StringResource(key: "cellInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Email inválido
      static let emailInvalid = Rswift.StringResource(key: "emailInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Não
      static let no = Rswift.StringResource(key: "no", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Nome inválido
      static let nameInvalid = Rswift.StringResource(key: "nameInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Número de cartão inválido
      static let cardInvalid = Rswift.StringResource(key: "cardInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ocoreu um erro inesperado! Por favor tente novamente mais tarde
      static let errorServiceGeneric = Rswift.StringResource(key: "errorServiceGeneric", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sim
      static let yes = Rswift.StringResource(key: "yes", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Sua sessão expirou. Por favor faça login novamente!
      static let expiredSession = Rswift.StringResource(key: "expiredSession", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Telefone inválido
      static let phoneInvalid = Rswift.StringResource(key: "phoneInvalid", tableName: "Localizable", bundle: R.hostingBundle, locales: [], comment: nil)
      
      /// Value: Alerta
      static func alert(_: Void = ()) -> String {
        return NSLocalizedString("alert", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: As senhas devem ser iguais
      static func equalPassword(_: Void = ()) -> String {
        return NSLocalizedString("equalPassword", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: CPF Inválido
      static func cpfInvalid(_: Void = ()) -> String {
        return NSLocalizedString("cpfInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Campo Obrigatório
      static func fieldRequired(_: Void = ()) -> String {
        return NSLocalizedString("fieldRequired", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Cancelar
      static func cancel(_: Void = ()) -> String {
        return NSLocalizedString("cancel", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Celular inválido
      static func cellInvalid(_: Void = ()) -> String {
        return NSLocalizedString("cellInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Email inválido
      static func emailInvalid(_: Void = ()) -> String {
        return NSLocalizedString("emailInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Não
      static func no(_: Void = ()) -> String {
        return NSLocalizedString("no", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Nome inválido
      static func nameInvalid(_: Void = ()) -> String {
        return NSLocalizedString("nameInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Número de cartão inválido
      static func cardInvalid(_: Void = ()) -> String {
        return NSLocalizedString("cardInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Ocoreu um erro inesperado! Por favor tente novamente mais tarde
      static func errorServiceGeneric(_: Void = ()) -> String {
        return NSLocalizedString("errorServiceGeneric", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Sim
      static func yes(_: Void = ()) -> String {
        return NSLocalizedString("yes", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Sua sessão expirou. Por favor faça login novamente!
      static func expiredSession(_: Void = ()) -> String {
        return NSLocalizedString("expiredSession", bundle: R.hostingBundle, comment: "")
      }
      
      /// Value: Telefone inválido
      static func phoneInvalid(_: Void = ()) -> String {
        return NSLocalizedString("phoneInvalid", bundle: R.hostingBundle, comment: "")
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    try storyboard.validate()
  }
  
  struct nib {
    fileprivate init() {}
  }
  
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      try home.validate()
      try launchScreen.validate()
    }
    
    struct home: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController
      
      let bundle = R.hostingBundle
      let detailsMovieViewController = StoryboardViewControllerResource<DetailsMovieViewController>(identifier: "DetailsMovieViewController")
      let name = "Home"
      
      func detailsMovieViewController(_: Void = ()) -> DetailsMovieViewController? {
        return UIKit.UIStoryboard(resource: self).instantiateViewController(withResource: detailsMovieViewController)
      }
      
      static func validate() throws {
        if _R.storyboard.home().detailsMovieViewController() == nil { throw Rswift.ValidationError(description:"[R.swift] ViewController with identifier 'detailsMovieViewController' could not be loaded from storyboard 'Home' as 'DetailsMovieViewController'.") }
      }
      
      fileprivate init() {}
    }
    
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController
      
      let bundle = R.hostingBundle
      let name = "LaunchScreen"
      
      static func validate() throws {
        if UIKit.UIImage(named: "iconMovie") == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'iconMovie' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
      }
      
      fileprivate init() {}
    }
    
    fileprivate init() {}
  }
  
  fileprivate init() {}
}
