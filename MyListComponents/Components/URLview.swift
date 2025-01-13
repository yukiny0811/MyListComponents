import SwiftUI
import Combine

struct FaviconView: View {
    let websiteURL: URL
    @State private var favicon: Image? = nil
    @State private var isLoading = false
    @State private var errorMessage: String? = nil

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("ファビコンを読み込み中...")
            } else if let favicon = favicon {
                favicon
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            } else {
                Image(systemName: "questionmark.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.gray)
            }
        }
        .onAppear {
            loadFavicon()
        }
    }

    private func loadFavicon() {
        isLoading = true
        errorMessage = nil

        // まず /favicon.ico を試みる
        guard let faviconURL = URL(string: "\(websiteURL.scheme ?? "https")://\(websiteURL.host ?? "")/favicon.ico") else {
            self.errorMessage = "無効なURLです。"
            self.isLoading = false
            print("aaa")
            return
        }

        // /favicon.ico をダウンロード
        downloadFavicon(from: faviconURL) { success in
            if success {
                print("qoqq")
                self.isLoading = false
                return
            } else {
                // /favicon.ico が取得できない場合、HTMLをパースしてファビコンのURLを取得
                fetchFaviconFromHTML()
            }
        }
    }

    private func downloadFavicon(from url: URL, completion: @escaping (Bool) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    print("ファビコンダウンロードエラー: \(error.localizedDescription)")
                    completion(false)
                    return
                }

                guard let data = data, let uiImage = UIImage(data: data) else {
                    print("ファビコンが見つかりません。")
                    completion(false)
                    return
                }

                self.favicon = Image(uiImage: uiImage)
                completion(true)
            }
        }.resume()
    }

    private func fetchFaviconFromHTML() {
        let url = websiteURL

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = "HTML取得エラー: \(error.localizedDescription)"
                    self.isLoading = false
                    return
                }

                guard let data = data, let htmlString = String(data: data, encoding: .utf8) else {
                    self.errorMessage = "HTMLを解析できません。"
                    self.isLoading = false
                    return
                }
                
                print(htmlString)

                // 正規表現で <link rel="icon" href="..."> を探す
                if let faviconURL = extractFaviconURL(from: htmlString, baseURL: websiteURL) {
                    // ファビコンをダウンロード
                    downloadFavicon(from: faviconURL) { success in
                        if !success {
                            self.errorMessage = "ファビコンが見つかりません。"
                        }
                        self.isLoading = false
                    }
                } else {
                    self.errorMessage = "ファビコンのURLが見つかりません。"
                    self.isLoading = false
                }
            }
        }.resume()
    }

    private func extractFaviconURL(from html: String, baseURL: URL) -> URL? {
        // 簡単な正規表現で <link rel="icon" href="..."> を探す
        let pattern = "<link[^>]+rel=[\"'](?:shortcut icon|icon)[\"'][^>]*href=[\"']([^\"']+)[\"'][^>]*>"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return nil
        }

        let nsString = html as NSString
        let results = regex.matches(in: html, options: [], range: NSRange(location: 0, length: nsString.length))

        if let match = results.first, match.numberOfRanges > 1 {
            let faviconPath = nsString.substring(with: match.range(at: 1))
            return URL(string: faviconPath, relativeTo: baseURL)?.absoluteURL
        }

        return nil
    }
}

struct URLView: View {
    let urlString: String
   
    var body: some View {
        HStack{
            FaviconView(websiteURL: URL(string:urlString)!)
                    .padding()
                
                Link(destination: URL(string: urlString)!) {
                    Text(urlString)
                        .foregroundColor(.blue)
                        .font(.title2)
                }
            }
        }
    }


#Preview{
    List{
        Section{
            URLView(
                urlString: "https://www.facebook.com"
            )
        }
    }
}
