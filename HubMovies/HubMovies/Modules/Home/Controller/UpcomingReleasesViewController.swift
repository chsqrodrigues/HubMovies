//
//  UpcomingReleasesViewController.swift
//  HubMovies
//
//  Created by Carlos Henrique Siqueira Rodrigues on 18/12/17.
//  Copyright © 2017 Carlos Henrique Siqueira Rodrigues. All rights reserved.
//

import UIKit
import SVPullToRefresh


class UpcomingReleasesViewController: HubMoviesBaseViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var barButton: UIBarButtonItem!
    var searchBar:UISearchBar!
    var page = 1
    var pageSearch = 1
    var arrayGeneres = [ValuesDTO]()
    var isSearch = false
    var dataSourceManager = UpcomingReleasesDataProvider()
    var dataSource = [MovieDTO]() {
        didSet{
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchBar()
        self.dataSourceManager.dataSourceDelegate = self
        self.loading.startAnimating()
        self.dataSourceManager.requestGenres()
        
        barButton = UIBarButtonItem.init(barButtonSystemItem: .search, target: self, action: #selector(actionSearch))
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    override func viewDidAppear(_ animated: Bool) {
        weak var weakSelf = self
        // setup infinite scrolling
        collectionView.addInfiniteScrolling(actionHandler: {() -> Void in
            weakSelf?.page += 1
            weakSelf?.pageSearch += 1
            weakSelf?.loadMovies()
        })
    }
    
    func loadMovies() {
        if collectionView.showsInfiniteScrolling {
            if isSearch {
                self.dataSourceManager.requestSearchMovies(pageSearch, search: searchBar.text ?? "")
            } else {
                self.dataSourceManager.requestUpcomingReleases(page:page)
            }
        }
        
        collectionView.infiniteScrollingView.activityIndicatorViewStyle = .white
    }
    
    func setupSearchBar() {
        self.searchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: 0, width: self.view.frame.size.width, height: 20))
        self.searchBar.placeholder = "Buscar"
        searchBar?.delegate = self
        searchBar?.showsCancelButton = true
        searchBar.keyboardAppearance = .dark
        searchBar.sizeToFit()
    }
    
    @objc func actionSearch() {
        self.navigationItem.rightBarButtonItem = nil
        self.navigationItem.titleView = self.searchBar
        self.searchBar.becomeFirstResponder()
        self.collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
    }
    
    @objc func removeSearchBar() {
        isSearch = false
        pageSearch = 1
        page = 1
        self.dataSourceManager.requestUpcomingReleases(page:page)
        searchBar.text = ""
        self.collectionView.setContentOffset(CGPoint(x:0,y:0), animated: true)
        self.navigationItem.rightBarButtonItem = barButton
        self.navigationItem.titleView = nil
        self.view.endEditing(true)
    }
    
    @objc func removeKeyboard() {
        searchBar.resignFirstResponder()
    }
}

extension UpcomingReleasesViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:ItemMoviesCell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! ItemMoviesCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let item = cell as? ItemMoviesCell {
            item.setupCell(self.dataSource[indexPath.row], generes: arrayGeneres)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = self.dataSource[indexPath.row]
        
        if let controller:DetailsMovieViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailsMovieViewController") as? DetailsMovieViewController {
            controller.movie = item
            controller.generes = self.arrayGeneres
            
            self.show(controller, sender: nil)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width:(self.view.frame.size.width / 2), height: 350)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension UpcomingReleasesViewController: UpcomingReleasesDataProviderProtocol {
    func responseGenres(_ response: GenreDTO) {
        if let generes = response.genres {
            self.arrayGeneres = generes
        }
        self.dataSourceManager.requestUpcomingReleases(page: page)
    }
    
    func responseUpcomingReleases(_ response: UpcomingReleasesDTO) {
        if let results = response.results {
            if response.page == 1 {
                self.dataSource = results
            } else {
                self.dataSource.append(contentsOf: results)
            }
        }
        
        if response.totalPages == response.page {
            collectionView.showsInfiniteScrolling = false
        } else {
            collectionView.showsInfiniteScrolling = true
        }
        
        if response.results == nil || response.results?.count == 0 {
            self.infoLabel.isHidden = false
        } else {
            self.infoLabel.isHidden = true
        }
        
        collectionView.infiniteScrollingView.stopAnimating()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        self.loading.stopAnimating()
    }
    
    func errorData(message: String) {
        self.showAlert(message: message)
    }
}

extension UpcomingReleasesViewController : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearch = true
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        if let text = searchBar.text {
            if searchBar.text?.count != 0 {
                self.dataSourceManager.requestSearchMovies(1, search: text)
            }
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.removeSearchBar()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}


