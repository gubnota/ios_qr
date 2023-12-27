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
        if (uiState == .empty){
            uiState = UIState.showing
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.uiState = UIState.empty
            }
            let config = ToastConfiguration(
                direction: .center,
                dismissBy: [.time(time: 4.0), .swipe(direction: .natural), .longPress],
                animationTime: 0.2
            )
            subtitle == "" ? Toast.text(message,config: config).show() : Toast.text(message, subtitle: subtitle,config: config).show()
        }
    }
}
