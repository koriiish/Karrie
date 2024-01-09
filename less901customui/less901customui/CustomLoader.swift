//
//  CustomLoader.swift
//  less901customui
//
//  Created by Карина Дьячина on 9.01.24.
//

import UIKit

class CustomLoader: UIView {
    
    private var shapeLayer: CAShapeLayer! //для рисовки кружков
    
    override init(frame: CGRect) { //так как кастомеый класс нам нужен инит
        super.init(frame: frame)
        setupLoader()
    }
    
    required init?(coder aDecoder: NSCoder) { // тоже обязательно для кастомного класса
        super.init(coder: aDecoder)
        setupLoader()
    }
private func setupLoader() {
        let circlePath = UIBezierPath( // круг loader // для рисовая дуги круга
            arcCenter: CGPoint(x: bounds.midX, y: bounds.midY),
            radius: bounds.width / 2 - 5,
            startAngle: -CGFloat.pi / 2,
            endAngle: 2 * CGFloat.pi,
            clockwise: true //похож на часы или нет будет круглым или нет
        )
        
        shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        shapeLayer.strokeColor = UIColor.systemGreen.cgColor //цвет самого круга
        shapeLayer.fillColor = UIColor.red.cgColor // цвет внутри
        shapeLayer.lineWidth = 3.0 // толщина
        shapeLayer.strokeEnd = 0.0 // конец заполмнен или нет до конца круг 
        
        layer.addSublayer(shapeLayer)
    }
func startAnimating() { // заставляет крутиться
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0 // от
        animation.toValue = 1 // до
        animation.duration = 1.5 // скорость заподнения
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.repeatCount = .infinity // количесвтво повторений бесконечно
        animation.autoreverses = true
        
        shapeLayer.add(animation, forKey: "loading") // тут добавляем анимацию
    }
    
    func stopAnimating() {
        shapeLayer.removeAnimation(forKey: "loading") // тут убираем
    }
}
