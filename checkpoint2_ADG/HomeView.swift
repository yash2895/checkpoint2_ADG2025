import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Global gradient background
                LinearGradient(
                    gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
                
                ScrollView {
                    VStack(spacing: 20) {
                        TopSearchBar()
                            .padding(.horizontal)
//
                        IconRow()
                            .padding(.horizontal)

                        NearbyGemsSection()
                        
                        WhereToNextView()

//                        WelcomeBanner()
//                            .padding(.horizontal)

                        RecentlyViewedSection()
                            .padding(.horizontal)
                        
                        Spacer(minLength: 80)
                    }
                    .padding(.top)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

// MARK: - Top Search Bar
struct TopSearchBar: View {
    @State private var query: String = "Explore Chennai"
    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.deepBlue)
                TextField("Explore Chennai", text: $query)
                    .foregroundColor(.black)
            }
            .padding(12)
            .background(
                RoundedRectangle(cornerRadius: 18)
                    .fill(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 18)
                            .stroke(
                                LinearGradient(
                                    gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 2
                            )
                    )
            )

            HStack(spacing: 16) {
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title2)
                        .foregroundColor(.white)
                }
                Button(action: {}) {
                    Image(systemName: "bell")
                        .font(.title2)
                        .foregroundColor(.white)
                }
            }
        }
        .padding(.vertical, 4)
    }
}

// MARK: - Icon Row
struct IconRow: View {
    let items: [(String, String)] = [
        ("gearshape.fill", "Things to do"),
        ("tram.fill", "Transport"),
        ("car.fill", "Car rentals"),
        ("building.2.fill", "Hotels"),
        ("building.columns", "AIFeature"),
        ("square.grid.2x2.fill", "All")
    ]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Categories")
                .font(.title3)
                .bold()
                .foregroundColor(.white)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 0.11) {
                    ForEach(items, id: \.0) { icon, label in
                        if label == "AIFeature" {
                            NavigationLink(destination: EmptyView()) {
                                VStack(spacing: 10) {
                                    ZStack {
                                        Circle()
                                            .fill(Color.white)
                                            .frame(width: 60, height: 60)
                                            .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                        
                                        LinearGradient(
                                            gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                            startPoint: .topLeading,
                                            endPoint: .bottomTrailing
                                        )
                                        .mask(
                                            Image(systemName: icon)
                                                .font(.title2)
                                        )
                                    }
                                    Text(label)
                                        .font(.caption)
                                        .lineLimit(1)
                                        .foregroundColor(.white)
                                }
                                .frame(width: 80)
                            }
                            .buttonStyle(.plain)
                        } else {
                            VStack(spacing: 8) {
                                ZStack {
                                    Circle()
                                        .fill(Color.white)
                                        .frame(width: 60, height: 60)
                                        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
                                    
                                    LinearGradient(
                                        gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                        startPoint: .topLeading,
                                        endPoint: .bottomTrailing
                                    )
                                    .mask(
                                        Image(systemName: icon)
                                            .font(.title2)
                                    )
                                }
                                Text(label)
                                    .font(.caption)
                                    .lineLimit(1)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 80)
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
    }
}

// MARK: - Nearby Gems Section
struct NearbyGemsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Nearby gems in Chennai")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    CardView(imageName: "temple1",
                             title: "Chennai Half Day: Private Guided City Tour",
                             badge: "Bestselling Tours",
                             price: "₹1500")
                    CardView(imageName: "temple1",
                             title: "Chennai full day tour- private guided city tour",
                             badge: nil,
                             price: "₹2899")
                    CardView(imageName: "beach",
                             title: "Marina Beach Walking Tour",
                             badge: "Popular",
                             price: "₹999")
                }
                .padding(.horizontal)
            }
        }
    }
}

struct CardView: View {
    var imageName: String
    var title: String
    var badge: String?
    var price: String

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 120)
                    .clipped()
                    .cornerRadius(12)

                if let badge = badge {
                    Text(badge)
                        .font(.caption2)
                        .padding(.vertical, 4)
                        .padding(.horizontal, 8)
                        .background(
                            LinearGradient(
                                gradient: Gradient(colors: [.lightBlue, .deepBlue]),
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .padding(8)
                }
            }

            Text(title)
                .font(.subheadline)
                .foregroundColor(.black)
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)

            Text(price)
                .font(.subheadline)
                .foregroundColor(.deepBlue)
                .fontWeight(.bold)
        }
        .padding(12)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 4)
        )
        .frame(width: 200)
    }
}

// MARK: WhereToNext
struct WhereToNextView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Where to next?")
                    .font(.headline)
                    .foregroundColor(.white)
                Spacer()
                Button("See more") {}
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
            }
            .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    DestinationChip(imageName: "singapore", title: "Keep exploring", subtitle: "Singapore")
                    DestinationChip(imageName: "phuket", title: "Phuket", subtitle: nil)
                    DestinationChip(imageName: "malaysia", title: "Malaysia", subtitle: nil)
                    DestinationChip(imageName: "bali", title: "Bali", subtitle: nil)
                }
                .padding(.horizontal)
            }
        }
    }
}

struct TourItem: Identifiable {
    let id = UUID()
    let title: String
    let price: String
    let imageName: String
}

// MARK: - Recently Viewed
struct RecentlyViewedSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text("Recently viewed")
                    .font(.title3)
                    .bold()
                    .foregroundColor(.white)
                Spacer()
                NavigationLink(destination: RecentlyViewedView()) {
                    Text("See more")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.8))
                }
            }
            .padding(.horizontal)

            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    
                    SmallCard(imageName: "park", title: "Genting Skyworlds Theme Park Ticket")
                    SmallCard(imageName: "temple1", title: "Chennai Half Day: Private Guided City Tour")
                    SmallCard(imageName: "beach", title: "Marina Beach Walking Tour")
                }
                .padding(.horizontal)
            }
        }
    }
}

struct SmallCard: View {
    var imageName: String
    var title: String
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 160, height: 100)
                .clipped()
                .cornerRadius(10)

            Text(title)
                .font(.subheadline)
                .lineLimit(2)
                .foregroundColor(.black)
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
        )
        .frame(width: 180)
    }
}




struct DestinationChip: View {
    let imageName: String
    let title: String
    let subtitle: String?

    var body: some View {
        HStack(spacing: 8) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 36, height: 36)
                .clipShape(Circle())

            VStack(alignment: .leading, spacing: 2) {
                if let subtitle = subtitle {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.deepBlue)
                    Text(subtitle)
                        .font(.caption)
                        .foregroundColor(.deepBlue.opacity(0.7))
                } else {
                    Text(title)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.deepBlue)
                }
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.white)
                .shadow(color: Color.black.opacity(0.1), radius: 2, x: 0, y: 1)
        )
    }
}

#Preview {
    HomeView()
}
