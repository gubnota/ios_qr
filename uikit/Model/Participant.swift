//
//  Participant.swift
//  gopicar
//
//  Created by Vladislav Muravyev on 26.12.2023.
//

import Foundation
import Combine
import Toast
import UIKit
import AVFAudio

enum NetworkState {
    case wrongToken;
    case synced;
    case initial;
}
enum UIState {
    case showing;
    case empty;
}
struct ParticipantT: Decodable {
    let number: Int
    let id: String
    let fullname: String
    let already_registered: Bool
}

class ParticipantManager: ObservableObject {

    @Published public var participants: [ParticipantT] = []
    @Published public var filtered: [ParticipantT] = []
    @Published public var searchText = ""
    @Published public var scannedCode = "";
    @Published public var state: NetworkState = NetworkState.initial;
    @Published public var uiState: UIState = UIState.empty;
    @Published public var participant: ParticipantT?
    let feedbackGenerator = UIImpactFeedbackGenerator(style: .medium)
    @Published public var loading: Bool = false

    static let shared = ParticipantManager()
    private init() {
        
        if (getToken() == ""){
            setToken(token: "130d651e-a181-493d-a604-5b3f90bb2eed")
        }
        // Initialize the participants array
        participants = [
        ]
//        fetchData();
        performPostRequest()
    }
    
    @objc func haptic() {
        // Generate haptic feedback on tap
        feedbackGenerator.prepare()
        feedbackGenerator.impactOccurred()
    }
    
    func play(){
        let randomNumber = Int.random(in: 1..<4)
        let soundFileExtension = "mp3"
//        let soundFileURL = Bundle.main.url(forResource: "bellsprout", withExtension: nil, subdirectory: "pockemon")//(forResource: "01", ofType: "mp3")
    
//        print(audioDataAsset?.data)
//        if (soundFileURL != nil) {
        //if let soundFileURL = Bundle.main.url(forResource: "sounds/0\(randomNumber)", withExtension: nil) {
            if let audioDataAsset = NSDataAsset(name: "sounds/\(randomNumber)"){
            do {
                // Create an AVAudioPlayer instance with the sound file URL
                let audioPlayer = try AVAudioPlayer(data: audioDataAsset.data)// (contentsOf: soundFileURL!)
                
                // Prepare the audio player to play the sound
                audioPlayer.prepareToPlay()
                
                // Play the sound
                audioPlayer.play()
            } catch {
                // Handle any errors that occur while creating the AVAudioPlayer
                print("Error: \(error.localizedDescription)")
            }
        } else {
            // Handle the case where the sound file is not found
            print("Sound file not found")
        }
    }
    
    func getAvatar(i:Int) -> UIImage? {
        var pockemons = ["abra","bellsprout","caterpie","charmander","dratini","eevee","jigglypuff","meowth","mew","pidgey","pikachu","psyduck","rattata","snorlax","squirtle","venonat","weedle","zubat"];

        return UIImage(named: "pockemon/\(pockemons[i % 18])", in: Bundle.main, compatibleWith: nil)
//        if let bgImg = UIImage(named: "pockemon/abra", in: Bundle.main, compatibleWith: nil) {
//            newV.setBackgroundImage(bgImg, for: .normal)
//    }
    }
    func isToken() -> Bool{
        return scannedCode.starts(with: "token:")// ? true : false
    }
    
    func isValidQr() -> Bool {
        let pattern = ":[-0-9a-fA-F]{36}$"
        if let _ = scannedCode.range(of: pattern, options: .regularExpression) {
            return true;
        } else {
            return false;
        }
    }

    func performGetRequest() {
        // Replace "your-api-endpoint" with the actual API endpoint that serves the JSON data
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode([ParticipantT].self, from: data)
                    DispatchQueue.main.async {
                        self.participants = decodedData
                        self.filtered = decodedData
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
    func onlyLate() {
        filtered = participants.filter { $0.number == 0 }
    }
    
    func filter(search: String? = nil){
        // Sort the participants array based on the custom sorting logic
        if let search {
            filtered = participants.filter { participant in
                let nameWithoutSpaces = participant.fullname.replacingOccurrences(of: " ", with: "")
                return nameWithoutSpaces.range(of: search, options: .caseInsensitive) != nil
            }
        }
        else { filtered = participants}
        filtered = filtered.sorted { (participant1:ParticipantT, participant2:ParticipantT) in
            if participant1.number > 0 && participant2.number > 0 {
                return participant1.number < participant2.number
            } else if participant1.number == 0 && participant2.number == 0 {
                return participant1.fullname < participant2.fullname
            } else {
                // If one age is greater than 0 and the other is 0 or less, prioritize age
                return participant1.number > 0
            }
        }
    }
    func performPostRequest() {
        // Define the URL and request body
        let url = URL(string: "https://newyear.pge.ru/api/v1/participants")!
        let requestBody: [String: Any] = [
            "token": getToken()
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: requestBody)
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("newyear.pge.ru", forHTTPHeaderField: "Host")
        request.setValue("48", forHTTPHeaderField: "Content-Length")
        request.httpBody = jsonData
        
        // Perform the request using URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle the error
                    self.showToast(message: "Ошибка запроса к базе", subtitle: "\(error)")

                    print("Request failed with error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    // Handle invalid response
                    print("Invalid response")
                    self.state = .wrongToken
                    self.showToast(message: "Неверный токен", subtitle: "Зарегистрируйте токен гопикара…")
                    return
                }
                
                // Handle the response data
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode([ParticipantT].self, from: data)
                        // Handle the decoded response
                        self.participants = decodedResponse;
                        print("Received response: \(decodedResponse)")
                    } catch {
                        // Handle decoding error
                        self.showToast(message: "Ошибка запроса к базе", subtitle: "\(error)")
                    }
                }
            }
        }.resume()
    }


    func registerParticipant(ctrlr: UIViewController) {
        if(loading) {return;}
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.loading = false;
        }
        loading = true;
        let user_id = extractToken()
        // check if this user already registered
        if let user = getById(user_id) {
            if (user.number > 0){
                participant = user
                self.loading = false;
//                DispatchQueue.main.async {
                if let nav = ctrlr.navigationController {
                    var controllers = nav.viewControllers
                    controllers.removeLast()
                    let destCtrlr = Portrait_VC(nibName: "Portrait_VC", bundle: nil)
                    controllers.append(destCtrlr)
                    nav.setViewControllers(controllers, animated: true)
                }
                
//                }
                return;
            }
        }
        if (user_id == "") {
            showToast(message: "Пользователь не зарегистрирован!");
            return;
        }
        
//        pm.showToast(message: "Пользователь отсканирован")

        // Define the URL and request body
        let url = URL(string: "https://newyear.pge.ru/api/v1/register")!
        let requestBody: [String: Any] = [
            "token": getToken(),
            "user_id": user_id
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: requestBody)
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("newyear.pge.ru", forHTTPHeaderField: "Host")
//        request.setValue("48", forHTTPHeaderField: "Content-Length")
        request.httpBody = jsonData
        
        // Perform the request using URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    // Handle the error
                    self.showToast(message: "Ошибка запроса к базе", subtitle: "\(error)")
                    self.loading = false;
                    print("Request failed with error: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    // Handle invalid response
                    print("Invalid response")
                    self.state = .wrongToken
                    self.showToast(message: "Неверный токен", subtitle: "Зарегистрируйте токен гопикара…")
                    self.loading = false;
                    return
                }
                
                // Handle the response data
                if let data = data {
                    do {
                        let decodedResponse = try JSONDecoder().decode(ParticipantT.self, from: data)
                        // Handle the decoded response
                        self.participant = decodedResponse;
                        print("Received response: \(decodedResponse)")
                        self.loading = false;
                        self.performPostRequest()// fetch new participants
                        if let nav = ctrlr.navigationController {
                            var controllers = nav.viewControllers
                            controllers.removeLast()
                            let destCtrlr = Portrait_VC(nibName: "Portrait_VC", bundle: nil)
                            controllers.append(destCtrlr)
                            nav.setViewControllers(controllers, animated: true)
                        }
//                        let destCtrlr = Portrait_VC(nibName: "Portrait_VC", bundle: nil)
//                        ctrlr.navigationController?.pushViewController(destCtrlr, animated: false)

                    } catch {
                        // Handle decoding error
                        self.showToast(message: "Ошибка запроса к базе", subtitle: "\(error)")
                    }
                }
            }
        }.resume()
    }
    
    func filterParticipantsByName(_ searchString: String) { //}-> [ParticipantT] {
        if searchString.isEmpty {
            self.filtered = participants
        } else {
            self.filtered =  participants.filter {
            $0.fullname.localizedCaseInsensitiveContains(searchString)
            || String($0.number).contains(searchString)
            }
        }
    }
    func getById(_ token: String) -> ParticipantT? { //}-> [ParticipantT] {
        if !token.isEmpty {
            var p = participants.filter {
            $0.id.localizedCaseInsensitiveContains(token)
            }
            
            if (p.count > 0) {return p.first}
        }
        return nil
    }
    
    func extractToken()->String{
        if let range = scannedCode.range(of: ":") {
            let substring = scannedCode[range.upperBound...]
            return "\(substring)" // Output: "sample string"
        }
        return ""
    }
    
    func setToken(token:String="") {
        // Save a key-value pair
            if (token == "" && scannedCode.starts(with: "token:")) {
                let tok = scannedCode.replacingOccurrences(of: "token:", with: "")
                UserDefaults.standard.set(tok, forKey: "token")
                performPostRequest()
            }
    }
    func getToken() -> String {
        // Retrieve a value for a key
        if let savedValue = UserDefaults.standard.string(forKey: "token") {
            return savedValue;
        }
        return "";
    }
    
    func showToast(message:String, subtitle:String = ""){
//        if (uiState == .empty){
//            uiState = UIState.showing
//            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                self.uiState = UIState.empty
//            }
            let config = ToastConfiguration(
                direction: .center,
                dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                animationTime: 0.2
            )
//            DispatchQueue.main.async {
//                NotificationBanner.show(message)
                            subtitle == "" ? Toast.text(message,config: config).show() : Toast.text(message, subtitle: subtitle,config: config).show()
//            }
//        }
    }
}
