//
//  VerticalStackLabelView.swift
//  VerticalText
//
//  Created by Yuji Tada on 2023/08/07.
//

import UIKit

@IBDesignable
class VerticalLabelStackView: UIStackView {
    // MARK: - Properties
    @IBInspectable var text: String?
    @IBInspectable var horizontalSpacing: CGFloat = 4
    @IBInspectable var color: UIColor? = .black
    @IBInspectable var layerShadowOffset: CGSize = .zero
    @IBInspectable var shadowOpacity: Float = 0
    @IBInspectable var layerShadowColor: UIColor = .clear
    @IBInspectable var shadowRadius: CGFloat = 0

    var label: UILabel {
        let label = UILabel()
        label.font = .init(name: "HiraMinProN-W6", size: 24)
        return label
    }
    var labelHeight: CGFloat { 30 }

    private var frameHeight: CGFloat = 0

    // MARK: - Initialize
    override init(frame: CGRect) {
        super.init(frame: frame)
        axis = .horizontal
        spacing = horizontalSpacing
        alignment = .top
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        axis = .horizontal
        spacing = horizontalSpacing
        alignment = .top
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if frame.height != frameHeight {
            frameHeight = frame.height
            setup()
        }
    }

    private func setup() {
        arrangedSubviews.forEach { view in
            removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        // 一行に何文字入るか
        let maxCountPerLine = Int(frameHeight / labelHeight)
        // 縦書きStackView
        var verticalStackViews: [UIStackView] = []
        var stackViewIndex = 0
        let textArray = Array(text ?? "")
        textArray.enumerated().forEach { textIndex, character in
            let label = label
            label.text = String(character)
            label.textColor = color
            // 伸ばし棒と()は回転
            if character.isMacron || character.isParenthesis {
                label.transform = .init(rotationAngle: .pi / 2)
                label.layer.shadowOffset = .init(width: layerShadowOffset.height, height: layerShadowOffset.width)
            } else {
                label.layer.shadowOffset = layerShadowOffset
            }
            // アラインメント
            if character.isOpenParenthesis {
                label.textAlignment = .right
            } else if character.isMacron {
                label.textAlignment = .center
            } else {
                label.textAlignment = .natural
            }
            // シャドウ
            label.layer.shadowOpacity = shadowOpacity
            label.layer.shadowColor = layerShadowColor.cgColor
            label.layer.shadowRadius = shadowRadius / UIScreen.main.scale
            // 制約
            label.translatesAutoresizingMaskIntoConstraints = false
            let labelHeightConstraint = label.heightAnchor.constraint(equalToConstant: labelHeight)
            labelHeightConstraint.priority = .init(750)
            labelHeightConstraint.isActive = true
            label.widthAnchor.constraint(equalToConstant: labelHeight).isActive = true
            // 改行
            // TODO: 行開始文字が）になる場合の改行処理を追加
            if (stackViewIndex + 1).isMultiple(of: maxCountPerLine),
               character.isOpenParenthesis {
                // 行端文字が（の場合は改行させる
                verticalStackViews.insert(UIStackView(), at: 0)
                stackViewIndex += 1
            } else if (stackViewIndex + 1).isMultiple(of: maxCountPerLine),
                      let nextCharacter = textArray[safe: textIndex + 1],
                      nextCharacter.isMacron {
                // 行開始文字がーになる場合は前の文字から改行させる
                verticalStackViews.insert(UIStackView(), at: 0)
                stackViewIndex += 1
            } else if stackViewIndex.isMultiple(of: maxCountPerLine) {
                verticalStackViews.insert(UIStackView(), at: 0)
            }

            stackViewIndex += 1
            verticalStackViews.first?.addArrangedSubview(label)
        }
        verticalStackViews.forEach {
            let verticalStackView = $0
            verticalStackView.axis = .vertical
            addArrangedSubview(verticalStackView)
        }
    }
}

