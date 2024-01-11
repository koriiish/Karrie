//
//  ViewController.swift
//  gesture1101
//
//  Created by Карина Дьячина on 11.01.24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        gestureButton()
    }

    func gestureView() {
            let testView = UIView(frame: CGRect(x: 50, y: 200, width: 200, height: 200))
            testView.backgroundColor = UIColor.blue
            view.addSubview(testView)
        }
        
        func gestureButton() {
            let gestureButton = UIButton(type: .system)
            gestureButton.frame = CGRect(x: 50, y: 450, width: 200, height: 40)
            gestureButton.setTitle("Добавить жесты", for: .normal)
            gestureButton.addTarget(self, action: #selector(addGestures), for: .touchUpInside)
            view.addSubview(gestureButton)
        }

    @objc func addGestures() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
            view.subviews.first?.addGestureRecognizer(tapGesture)
            
//            let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress(_:)))
//            view.subviews.first?.addGestureRecognizer(longPressGesture)
//            
//            let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe(_:)))
//            swipeGesture.direction = .right//.left
//            view.subviews.first?.addGestureRecognizer(swipeGesture)
//            
//            let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch(_:)))
//            view.subviews.first?.addGestureRecognizer(pinchGesture)
//            
//            let rotationGesture = UIRotationGestureRecognizer(target: self, action: #selector(handleRotation(_:)))
//            view.subviews.first?.addGestureRecognizer(rotationGesture)
//            
//            let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
//            view.subviews.first?.addGestureRecognizer(panGesture)
////            
//            let edgePanGesture = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleEdgePan(_:)))
//            edgePanGesture.edges = .left
//            view.subviews.first?.addGestureRecognizer(edgePanGesture)
        }

    
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
            print("Tap recognized!")
            printTouchDetails(sender)
            
            
            //MARK: - Hit Test
            let tapLoaction = sender.location(in: view)
            if let tappedView = view.hitTest(tapLoaction, with: nil) {
                print("Tap inside \(tappedView)")
            } else {
                print("Tap outside")
            }
        }

    @objc func handleLongPress(_ sender: UILongPressGestureRecognizer) {
            print("Long press recognized!")
            printTouchDetails(sender)
        }
        
        @objc func handleSwipe(_ sender: UISwipeGestureRecognizer) {
            print("Swipe recognized!")
            printTouchDetails(sender)
        }
        
        @objc func handlePinch(_ sender: UIPinchGestureRecognizer) {
            print("Pinch recognized! Scale: \(sender.scale)")
            printTouchDetails(sender)
        }
        
        @objc func handleRotation(_ sender: UIRotationGestureRecognizer) {
            print("Rotation recognized! Rotation: \(sender.rotation)")
            printTouchDetails(sender)
        }
        
        @objc func handlePan(_ sender: UIPanGestureRecognizer) {
            let translation = sender.translation(in: view)
            print("Pan recognized! Translation: \(translation)")
            printTouchDetails(sender)
        }
        
        @objc func handleEdgePan(_ sender: UIScreenEdgePanGestureRecognizer) {
            print("Edge pan recognized!")
            printTouchDetails(sender)
        }
    
    func printTouchDetails(_ gesture: UIGestureRecognizer) {
            if let view = gesture.view {
                let touch = gesture.location(in: view)
                if touch == gesture.location(in: view) {
                    print("Touch Details:")
                    print("Location: \(touch)")
                    print("State: \(gesture.state.rawValue)")
                    print("--------------")
                }
            }
        }
}

extension ViewController {
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
