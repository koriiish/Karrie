//
//  BlueView.swift
//  lesson16
//
//  Created by Карина Дьячина on 11.01.24.
//

import Foundation
import UIKit

class BlueView: UIView {
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        addSubview(view)
        view.frame.size = CGSize(width: 300, height: 150)
        view.backgroundColor = .blue
        
    }
}

extension BlueView {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: view)
        print("Touches Began at \(location)")
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: view)
        print("Touches Moved to \(location)")
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let touch = touches.first else { return }
        
        let location = touch.location(in: view)
        print("Touches Ended at \(location)")
    }
}
