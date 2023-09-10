//
//  PeculiaritiesCollectionView.swift
//  HotelRoamHaven
//
//  Created by Айдар Оспанов on 10.09.2023.
//

import UIKit

final class PeculiaritiesCollectionView: UICollectionView {
    
    //weak var dishDelegate: DishCollectionViewDelegate?
    private var qwer = ["ddsdasdd", "dasdasdsdadsaddada", "fdfdasfjkfaksja"]
    
    private let identifier = "PeculiaritiesCollectionView"
    
    
    private let collectionFlowLayout = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionFlowLayout)
        
        setupConfigure()
        setupCollectionLayout()
        setupDelegate()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConfigure() {
        translatesAutoresizingMaskIntoConstraints = false
        register(PeculiaritiesCollectionViewCell.self, forCellWithReuseIdentifier: identifier)
    }
    
    private func setupCollectionLayout() {
        collectionFlowLayout.minimumInteritemSpacing = 5
        collectionFlowLayout.minimumLineSpacing = 2
        collectionFlowLayout.scrollDirection = .vertical
        collectionFlowLayout
            .collectionView?
            .showsVerticalScrollIndicator = false
    }
    
    private func setupDelegate() {
        dataSource = self
        delegate = self
    }
    
    private func calculateWidthForCell(at indexPath: IndexPath) -> CGFloat {
        let sampleText = qwer[indexPath.row]
    
        let font = UIFont.mediumSFPro16() // Установите желаемый шрифт
        let textAttributes: [NSAttributedString.Key: Any] = [.font: font ?? UIFont.systemFont(ofSize: 16)]
        let boundingRect = (sampleText as NSString).boundingRect(
            with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: 19), // Ширина не ограничена
            options: .usesLineFragmentOrigin,
            attributes: textAttributes,
            context: nil
        )
        
        let cellWidth = (boundingRect.width) + 10
        return cellWidth
    }
}

//MARK: UI
extension PeculiaritiesCollectionView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
    }
}

//MARK: UICollectionViewDataSource

extension PeculiaritiesCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        qwer.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: identifier,
            for: indexPath
        )
        
        guard let cell = cell as? PeculiaritiesCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let qwe = qwer[indexPath.row]
        cell.configure(with: qwe)
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout

extension PeculiaritiesCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let collectionViewWidth = collectionView.bounds.width
        let cellWidth = calculateWidthForCell(at: indexPath) // Вычисляем ширину ячейки на основе текста
        return CGSize(width: cellWidth, height: collectionView.bounds.height)
        
        //return CGSize(width: cellWidth, height: collectionView.bounds.height)
    }
    
    
}
