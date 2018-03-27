//
//  TabCollectionView.swift
//  test
//
//  Created by xieran on 2018/3/6.
//  Copyright © 2018年 xie ran. All rights reserved.
//

import UIKit
import SnapKit

public class TabScroll: UIScrollView {
    let leftMargin: CGFloat = 16
    let spacing: CGFloat = 32
    var tHeight: CGFloat = 0
    var font = UIFont.systemFont(ofSize: 15)
    
    private var buttons = [TabButton]()
    
    var itemSelectedBlock: ((_ index: Int) -> Void)?
    var titles: [String]? {
        didSet {
            clean()
            
            for (index , title) in (titles ?? []).enumerated() {
                let button = TabButton(title: title, font: self.font)
                button.isSelected = index == 0 ? true : false
                button.tag = index
                button.addTarget(self, action: #selector(click), for: .touchUpInside)
                addSubview(button)
                
                let originX = index == 0 ? self.leftMargin : buttons[index - 1].frame.maxX + self.spacing
                button.frame = CGRect(x: originX, y: 0, width: button.frame.width, height: self.frame.height - 1)
                buttons.append(button)
            }
            
            self.contentSize = CGSize(width: (buttons.last?.frame.maxX ?? 0) + leftMargin, height: self.tHeight)
        }
    }
    
    var selectedIndex = 0 {
        willSet {
            if newValue != selectedIndex {
                buttons[selectedIndex].isSelected = false
                buttons[newValue].isSelected = true
                
                scrollItemToCenter(atIndex: newValue)
            }
        }
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        tHeight = frame.size.height
        
        backgroundColor = .white
        
        let line = UIView(frame: CGRect(x: 0, y: tHeight - 1, width: frame.size.width, height: 1))
        line.backgroundColor = UIColor(red: 244.0/255.0, green: 244.0/255.0, blue: 244.0/255.0, alpha: 1)
        addSubview(line)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func click(sender: UIButton) {
        buttons[selectedIndex].isSelected = false
        selectedIndex = sender.tag
        buttons[selectedIndex].isSelected = true
        scrollItemToCenter(atIndex: selectedIndex)
        itemSelectedBlock?(sender.tag)
    }
    
    func scrollItemToCenter(atIndex index: Int) {
        let button = buttons[index]
        
        let maxOffsetX = contentSize.width - frame.width
        
        if button.center.x > self.center.x , button.center.x - frame.width / 2 <= maxOffsetX {
            UIView.animate(withDuration: 0.2, animations: {
                self.setContentOffset(CGPoint(x: button.center.x - self.center.x, y: 0), animated: false)
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.scrollRectToVisible(CGRect(x: button.frame.minX - self.leftMargin, y: 0, width: button.frame.width + 2 * self.leftMargin, height: button.frame.height), animated: false)
            })
        }
    }
    
    func clean() {
        for (index , btn) in buttons.enumerated().reversed() {
            btn.removeFromSuperview()
            buttons.remove(at: index)
        }
    }
}

private class TabButton: UIButton {
    lazy var line: UIView = {
        let v = UIView()
        v.backgroundColor = UIColor(red: 1, green: 102.0/255.0, blue: 0, alpha: 1)
        v.isHidden = true
        addSubview(v)
        return v
    }()
    
    init(title: String, font: UIFont) {
        super.init(frame: .zero)
        
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor(red: 119.0/255.0, green: 119.0/255.0, blue: 119.0/255.0, alpha: 1), for: .normal)
        self.setTitleColor(UIColor(red: 1, green: 102.0/255.0, blue: 0, alpha: 1), for: .selected)
        self.setTitleColor(UIColor(red: 1, green: 102.0/255.0, blue: 0, alpha: 1), for: [.selected , .highlighted])
        self.titleLabel?.font = font
        
        self.frame.size.width = (title as NSString).boundingRect(with: CGSize(width: 1000, height: 1000), options: [.usesLineFragmentOrigin], attributes: [NSAttributedStringKey.font : font], context: nil).size.width + 1
        
        line.snp.makeConstraints { (make) in
            make.bottom.centerX.equalToSuperview()
            make.height.equalTo(2)
            make.width.equalTo(self.frame.size.width)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var isSelected: Bool {
        didSet {
            line.isHidden = !isSelected
        }
    }
}

