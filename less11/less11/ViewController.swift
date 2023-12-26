//
//  ViewController.swift
//  less11
//
//  Created by Карина Дьячина on 21.12.23.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            
            return scrollView
        }()
        
        var stackView: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.spacing = 8
            stackView.translatesAutoresizingMaskIntoConstraints = false
            return stackView
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - ScrollView Delegate Methods
            func scrollViewDidScroll(_ scrollView: UIScrollView) {
                print("Scroll")
            }
            
            func viewForZooming(in scrollView: UIScrollView) -> UIView? {
                return scrollView
            }
            
            func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
                print("Scroll ")
            }
            
            func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
                return true
            }
            
            func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
                
            }
        
        func scrollViewConfigure() {
                let scrollView = UIScrollView(frame: view.bounds)
                
                scrollView.contentSize = CGSize(width: view.bounds.width, height: 1000)
                let contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 1000))
                contentView.backgroundColor = .white
                
                let label = UILabel(frame: CGRect(x: 20, y: 20, width: view.bounds.width - 40, height: 100))
                label.text = "Test text Test text Test text Test text Test text Test text Test text Test text Test text Test text Test text Test text Test text Test text Test text"
                label.numberOfLines = 0
                contentView.addSubview(label)
                
                scrollView.addSubview(contentView)
                view.addSubview(scrollView)
            }
        
        
        func scrollViewAllParametrs() {
                scrollView = UIScrollView(frame: view.bounds)
                
                scrollView.contentSize = CGSize(width: 400, height: 400) // Установка размера содержимого
                
                scrollView.setContentOffset(CGPoint(x: 100, y: 100), animated: true) // Установка смещения содержимого (прокрутка)
                
                scrollView.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20) //ограничение области прокрутки
            
            
            
            scrollView.minimumZoomScale = 0.5
                    scrollView.maximumZoomScale = 2.0
                    scrollView.zoomScale = 1.5 //мастшаб зума по умолчанию
                    
                    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
                    scrollView.addGestureRecognizer(tapGesture)
                    
                    scrollView.showsVerticalScrollIndicator = false
                    scrollView.showsHorizontalScrollIndicator = true
                    
                    //        let outerScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
                    //        let innerScrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 400, height: 400))
                    
                    //        outerScrollView.addSubview(innerScrollView)
                    //        outerScrollView.contentSize = innerScrollView.bounds.size
                    
                }
//        @ func handleTap
    }


}

