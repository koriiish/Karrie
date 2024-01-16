//
//  CircleView.swift
//  CustomAlert
//
//  Created by berdy on 16.01.24.
//

import UIKit

class CircleView: UIView {

    // MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    // MARK: - Common Initialization

    private func commonInit() {
        guard let view = loadFromNib() else { return }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.layer.cornerRadius = 50
        addSubview(view)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture(_:)))
        view.addGestureRecognizer(panGesture)
    }

    private func loadFromNib() -> UIView? {
        let nibName = String(describing: type(of: self))
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    // MARK: - Pan Gesture Handler

    @objc private func handlePanGesture(_ sender: UIPanGestureRecognizer) {
        guard let superview = superview else { return }

        let translation = sender.translation(in: superview)

        center = CGPoint(x: center.x + translation.x,
                         y: center.y + translation.y)
        sender.setTranslation(.zero, in: superview)
    }
}
