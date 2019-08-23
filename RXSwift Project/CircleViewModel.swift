import ChameleonFramework
import Foundation
import RxSwift
import RxCocoa

class CircleViewModel {
    
    
    var centerVariable = Variable<CGPoint?>( .zero) // Create one variable that will be changed and observed
    var backgroundColorObservable: Observable<UIColor>! // Create observable that will change backgroundColor based on center
    
    init() {
        setup()
    }
    
    func setup() {
        backgroundColorObservable = centerVariable.asObservable()
            .map { center in
                guard let center = center else { return UIColor.flatten(.blue)() }
                
                let red: CGFloat = ((center.x + center.y) .truncatingRemainder(dividingBy: 255) ) / 255.0 // We just manipulate red, but you can do w/e
                let green: CGFloat = 0.0
                let blue: CGFloat = 0.0
                
                return UIColor.flatten(UIColor(red: red, green: green, blue: blue, alpha: 1.0))()
        }
        
        
        
    }
}
