//
//  CustomToggle.swift
//  CustomViewsXibs
//
//  Created by berdy on 09.01.24.
//

import UIKit

protocol CustomToggleSwitchDelegate: AnyObject {
    func switchStateChanged(isOn: Bool)
}

final class CustomToggle: UIView { //не наследуемый и не изменяется
    
    private enum Constants {
        static let cornerRadius = 2.0
        static let thumbnailSizeWidth = 30
        static let thumbnailSizeHeight = 30
        static let backgroundSizeWidth = 60
        static let backgroundSizeHeight = 30
        static let shadowOffset: CGFloat = 2
        static let shadowOpacity: Float = 0.5
        static let duration = 0.3
        static let borderWidth: CGFloat = 1
        static let shadowRadius: CGFloat = 2
    }
    
    private let backgroundView = UIView() // активно не активно
    private let thumbnailView = UIView() //название кругляшка
    private var isOn: Bool = false // вкл не вкл
    private var thumbnailImageView: UIImageView? // картинка на крудке самом доп
    weak var delegate: CustomToggleSwitchDelegate?
    
    private var onThumbnailImage: UIImage?
    private var offThumbnailImage: UIImage?
    
    var onBackgroundColor: UIColor = .systemGreen {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var offBackgroundColor: UIColor = .lightGray {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var thumbnailColor: UIColor = .white {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var backgroundOutlineColor: UIColor = .clear {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var thumbnailOutlineColor: UIColor = .clear {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var toggleOnTintColor: UIColor = .white {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var toggleOffTintColor: UIColor = .white {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var onThumnailColor: UIColor = .clear{
        didSet {
            updateToggleAppearance()
        }
    }
    
    var offThumnailColor: UIColor = .clear {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var thumbnailSize: CGSize = CGSize(width: Constants.thumbnailSizeWidth, height: Constants.thumbnailSizeHeight) {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var backgroundSize: CGSize = CGSize(width: Constants.backgroundSizeWidth, height: Constants.backgroundSizeHeight) {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var thumbnailShadow: Bool = true {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var backgroundShadow: Bool = true {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var backgroundShadowColor: UIColor = .systemMint {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var thumbnailShadowColor: UIColor = .systemOrange {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var backgroundShadowOffsetY: CGFloat = Constants.shadowOffset  {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var thumbnailShadowOffsetY: CGFloat = Constants.shadowOffset  {
        didSet {
            updateToggleAppearance()
        }
    }
    
    var isEnabledToggle: Bool = true { //чтобы не кликался
        didSet {
            updateToggleAppearance()
        }
    }
    
    override init(frame: CGRect) { // так как кастомный класс
        super.init(frame: frame)
        setupToggle()
    }
    
    required init?(coder: NSCoder) { // так как кастомный класс
        super.init(coder: coder)
    }
    
    private func setupToggle() {
        let centerX = frame.width / 2
        let centerY = frame.height / 2
        backgroundView.frame = CGRect(x: 0, y: 0, width: backgroundSize.width, height: backgroundSize.height)
        backgroundView.center = CGPoint(x: centerX, y: centerY)
        addSubview(backgroundView)
        
        thumbnailView.frame = CGRect(x: 0, y: 0, width: thumbnailSize.width, height: thumbnailSize.height)
        thumbnailView.center = CGPoint(x: centerX, y: centerY)
        addSubview(thumbnailView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(switchToggle))
        addGestureRecognizer(gesture) // так как созлаем сами то нужно добавить
        
        updateToggleAppearance()
    }
    
    func setImages(onState: UIImage = UIImage(), offState: UIImage = UIImage()) {
        onThumbnailImage = onState
        offThumbnailImage = offState
        updateThumbnailImage()
    }
    
    private func setThumbnailImage(image: UIImage?) {
        if let image = image {
            thumbnailImageView?.removeFromSuperview()
            let newImageView = UIImageView(image: image)
            newImageView.contentMode = .scaleAspectFit
            newImageView.frame = self.thumbnailView.bounds
            self.thumbnailView.addSubview(newImageView)
            self.thumbnailImageView = newImageView
        } else {
            thumbnailImageView?.removeFromSuperview()
            thumbnailImageView = nil
        }
    }
    
    private func updateThumbnailImage() {
        let image = isOn ? onThumbnailImage : offThumbnailImage
        setThumbnailImage(image: image)
    }
    
    @objc private func switchToggle() {
        isOn.toggle() //меняет на другое тру фолс
        changeToggleState(to: isOn)
        delegate?.switchStateChanged(isOn: isOn)
        updateToggleAppearance()
        updateThumbnailImage()
    }
    
    private func changeToggleState(to state: Bool) {
        let state = state ? backgroundView.frame.width - thumbnailView.frame.width : 0
        UIView.animate(withDuration: Constants.duration) { // меняет состояние тогла
            self.thumbnailView.frame.origin.x = state
        }
    }
    
    private func updateToggleAppearance() { // самая важная
        isUserInteractionEnabled = isEnabledToggle ? true : false //выключение
        let centerX = frame.width / 2
        let centerY = frame.height / 2
        backgroundView.frame.size = CGSize(width: backgroundSize.width, height: backgroundSize.height)
        backgroundView.center = CGPoint(x: centerX, y: centerY)
        backgroundView.backgroundColor = isOn ? onBackgroundColor : offBackgroundColor
        backgroundView.layer.cornerRadius = backgroundSize.height / Constants.cornerRadius
        backgroundView.layer.borderWidth = Constants.borderWidth //ширина границы
        backgroundView.layer.borderColor = backgroundOutlineColor.cgColor
        
        if backgroundShadow { //тень
            backgroundView.layer.shadowColor = backgroundShadowColor.cgColor
            backgroundView.layer.shadowOpacity = Constants.shadowOpacity // объем
            backgroundView.layer.shadowOffset = CGSize(width: 0, height: backgroundShadowOffsetY)
            backgroundView.layer.shadowRadius = Constants.shadowRadius
            backgroundView.layer.masksToBounds = false
        } else {
            backgroundView.layer.shadowOpacity = 0
        }
        
        thumbnailView.frame.size = CGSize(width: thumbnailSize.width, height: thumbnailSize.height)
        thumbnailView.center = CGPoint(x: centerX, y: centerY)
        thumbnailView.backgroundColor = isOn ? toggleOnTintColor : toggleOffTintColor
        thumbnailView.layer.cornerRadius = thumbnailSize.height / 2.0
        thumbnailView.layer.borderWidth = Constants.borderWidth
        thumbnailView.layer.borderColor = thumbnailOutlineColor.cgColor
        
        if thumbnailShadow {
            thumbnailView.layer.shadowColor = thumbnailShadowColor.cgColor
            thumbnailView.layer.shadowOpacity = Constants.shadowOpacity
            thumbnailView.layer.shadowOffset = CGSize(width: 0, height: thumbnailShadowOffsetY)
            thumbnailView.layer.shadowRadius = Constants.shadowRadius
            thumbnailView.layer.masksToBounds = false
        } else {
            thumbnailView.layer.shadowOpacity = 0
        }
        
        let xPosition = isOn ? backgroundView.frame.width - thumbnailView.frame.width : 0
        thumbnailView.frame.origin.x = xPosition
    }
}

