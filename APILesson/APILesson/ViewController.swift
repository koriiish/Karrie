//
//  ViewController.swift
//  APILesson
//
//  Created by berdy on 22.02.24.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    enum Constants {
        static let getUrl = URL(string: "https://jsonplaceholder.typicode.com/todos/1")!
        static let postUrl = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        static let postData = "title=foo&body=bar&userId=1".data(using: .utf8)!
        static let apiKey = "6291d2ac-d18e-11ee-91a9-0242ac130002-6291d4be-d18e-11ee-91a9-0242ac130002"
        static let city = "Berlin"
        static let weatherApi = "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        static let parameters: [String: Any] = ["q": city, "appid": apiKey]
        static let dogApiUrl = "https://api.thedogapi.com/v1/breeds"
        static let catApiUrl = "https://api.thecatapi.com/v1/breeds"
        static let countryApiUrl = "https://restcountries.com/v3/all"
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var tracks: [Track] = []
    var dogs: [DogBreed] = []
    var cats: [CatBreed] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getTrackData()
//        getRequest()
//        postRequest()
//        getWeather()
//        postWeather()
//        getDogBreeds()
//        getCatBreeds()
        getCountryInfo()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//            self.setupTableView()
//        }
    }
    
    private func setupTableView() {
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        tableView.register(AnimalTableViewCell.self, forCellReuseIdentifier: "AnimalTableViewCell")
        tableView.reloadData()
    }
    
    func getTrackData() {
        do {
            let jsonData = try LocalJSONParser.readLocalJSONFile(forName: "track")
            if let tracks = LocalJSONParser.parse(jsonData: jsonData) {
                for track in tracks {
                    self.tracks.append(track)
                    print(tracks)
                }
            } else {
                print("Ошибка парсинга данных")
            }
        } catch {
            print("Ошибка чтения файла JSON: \(error)")
        }
    }
    
    func getRequest() {
        NetworkManager.performGetRequest(url: Constants.getUrl) { result in
            switch result {
            case .success(let data):
                print("Succes. Data: \(data)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func postRequest() {
        NetworkManager.performPostRequest(url: Constants.postUrl, data: Constants.postData) { result in
            switch result {
            case .success(let data):
                print("Succes. Data: \(data)")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getWeather() {
        AF.request(Constants.weatherApi).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let weatherResponse):
                let temperature = weatherResponse.main.temp
                print("Temperature in \(Constants.city): \(temperature)°C")
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func postWeather() {
        AF.request(Constants.weatherApi, method: .post, parameters: Constants.parameters, encoding: URLEncoding.default).responseDecodable(of: WeatherResponse.self) { response in
            switch response.result {
            case .success(let value):
                print("Текущая погода в \(Constants.city): \(value)")
            case .failure(let error):
                print("Ошибка при выполнении POST запроса: \(error.localizedDescription)")
            }
        }
    }
    
    func getDogBreeds() {
        AF.request(Constants.dogApiUrl).responseDecodable(of: [DogBreed].self) { response in
            switch response.result {
            case .success(let dogBreeds):
                for breed in dogBreeds {
                    print("ID: \(breed.id), Name: \(breed.name), Bred For: \(breed.bredFor ?? "N/A")")
                    self.dogs.append(breed)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getCatBreeds() {
        AF.request(Constants.catApiUrl).responseDecodable(of: [CatBreed].self) { response in
            switch response.result {
            case .success(let dogBreeds):
                for breed in dogBreeds {
                    print("ID: \(breed.id), Name: \(breed.name), Temperament: \(breed.temperament)")
                    self.cats.append(breed)
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func getCountryInfo() {
        AF.request(Constants.catApiUrl).responseDecodable(of: [Country].self) { response in
            switch response.result {
            case .success(let countries):
                for country in countries {
                    print("Continent: \(country.continents), Name: \(country.name), Timezone: \(country.timezones), Capital: \(String(describing: country.capital)), Flag: \(String(describing: country.flag)), Population: \(country.population)")
                }
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
        
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimalTableViewCell", for: indexPath) as! AnimalTableViewCell
        cell.configureDogs(dogs: dogs[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
