class AppConstants {
  static final List<Map<String, dynamic>> projects = [
    {
      "title": "Salla Spare – Customer App POV",
      "subtitle": "Multi-Vendor Automotive Spare Parts Marketplace",
      "videoPath": "assets/videos/Salla-Spare.mp4",
      "description": """
Customer-facing mobile application (1 of 3 synchronized apps: Customer • Vendor • Driver) of Salla Spare — the region’s fastest-growing multi-vendor platform for genuine and aftermarket car spare parts.
Built entirely by me as the Flutter developer, this app delivers a fully personalized, hassle-free shopping experience tailored to each user’s exact vehicle.

Core Features:
• My Garage: Users register their car(s) (type, model, year, engine, trim), and the entire app automatically shows only parts that are 100% compatible.
• Browse spare parts from dozens of verified vendors with ratings, reviews, and detailed product pages.
• Search & Filters by category, name, and ability to send special requests.
• Real-time in-app chat with customer support and delivery drivers (Firestore-powered).
• Login via phone with Firebase Authentication.
• Payment options: Credit/Debit Card, Digital Wallet, and Cash on Delivery.
• Smart checkout with zone-based pricing and automated delivery fees.
• Coupon & promo code system applied at checkout.
• Full digital wallet for storing balance, receiving refunds, and faster future payments.
• Order tracking with clear status flow.
• Complete English ↔ Arabic localization with RTL support.
• Firebase Cloud Messaging for instant push notifications.
• Firestore schema designed to handle massive product catalogs and real-time updates.
""",
    },
    {
      "title": "E-Commerce Template App",
      "subtitle": "Production-Ready Flutter Template",
      "videoPath": "assets/videos/e-commerce.mp4",
      "description": """
A complete, white-label e-commerce solution built from the ground up as a highly customizable template. Businesses and agencies can launch fully branded stores for their clients in days instead of months — with minimal code changes required.
As the Flutter developer, I was responsible for a lot of project aspects: architecture, front-end, state management, and Firebase backend design.

Key Highlights & Features:
• Clean Architecture + Bloc/Cubit for scalable code.
• Dependency injection with Provider and repository pattern.
• Dynamic remote configuration engine: app name, logo, colors, splash screen, and feature sets loaded from Firebase.
• Multi-tenancy & package tiers: Standard vs Premium features toggled per client in real time.
• Global kill-switch for instant app disable (maintenance or subscription control).
• Full Stripe integration with Payment Intents, Apple Pay, Google Pay.
• Complete Arabic/English localization with automatic RTL/LTR switching.
• Firebase suite: Auth, Firestore, push notifications, Cloud Messaging topics, and Remote Config.
• Privacy-first analytics wrapper tracking Add to Cart, Purchase, Refund, and screen views.
• Real-time order tracking.
• Built-in loyalty system: progress points, tiers, and voucher redemption.
• Responsive design across phones, tablets.
""",
      "appStoreLink": "https://apps.apple.com/us/app/arqana/id6757395604",
      "playStoreLink":
          "https://play.google.com/store/apps/details?id=com.qahwa.store&hl=en",
    },
    {
      "title": "Note Taker – Vehicle Testing Tool for tablets",
      "subtitle": "Internal Project • Corelia",
      "videoPath": "assets/videos/Notetaker.mp4",
      "description": """
A specialized mobile tool designed to streamline automotive testing workflows and manage vehicle test cases.
Built as an internal project for Corelia where I implemented the full mobile logic and integrated backend endpoints for real-time synchronization.

Key Features:
• Intuitive interface for logging vehicle details, environmental conditions, and test scenarios.
• Dynamic selection system for specific test elements and driving behaviors.
• Structured data entry with real-time editing and auto-timestamping.
• Automated CSV export functionality for seamless data analysis and reporting.
""",
    },
  ];

  static final List<Map<String, dynamic>> moreProjects = [
    {
      "title": "Oppy Detector",
      "subtitle": "Internal Project – Corelia",
      "description": """
A smart opportunity management tool that supports multiple user roles in tracking, analyzing, and scoring business opportunities.
• Built responsive, role-specific user interfaces and dynamic forms to streamline workflows.
• Integrated APIs for secure authentication and role-based access control.
• Integrated AI-powered recommendation chatbot and analytics features.
""",
    },
    {
      "title": "Food Waste Reduction App",
      "subtitle": "Graduation Project – Grade A+",
      "description": """
A cross-platform mobile app aimed at reducing food waste by connecting donors, recipients, and volunteer drivers.
• Developed the application using Flutter with real-time coordination between users.
• Integrated Firebase for authentication and real-time database management.
• Utilized Google Maps API for location services and implemented live tracking functionality.
""",
    },
  ];

  static final List<Map<String, dynamic>> experience = [
    {
      "company": "Freelance",
      "roles": [
        {"title": "Flutter Developer", "period": "2025 - present", "type": ""},
      ],
    },
    {
      "company": "Corelia",
      "roles": [
        {
          "title": "Flutter Developer",
          "period": "October 2024 - July 2025",
          "type": "Full-Time",
        },
        {
          "title": "Flutter Developer Internship",
          "period": "July 2024 - September 2024",
          "type": "Internship",
        },
      ],
    },
    {
      "company": "Canadian International College",
      "roles": [
        {
          "title": "Teaching Assistant",
          "period": "October 2023 - July 2024",
          "type": "Full-Time",
        },
      ],
    },
    {
      "company": "Genius Minds",
      "roles": [
        {
          "title": "Programming Instructor for Kids",
          "period": "October 2022 - December 2023",
          "type": "Part-Time",
        },
      ],
    },
    {
      "company": "GoMyCode",
      "roles": [
        {
          "title": "Scratch Instructor for Kids",
          "period": "September 2023 - November 2023",
          "type": "Part-Time",
        },
      ],
    },
  ];

  static final List<Map<String, String>> publications = [
    {
      "title":
          "Comparative Evaluation of Software Composition Analysis Tools in the Context of Technical Debt Reduction",
      "conference":
          "International Conference of Technical Debt and Software Composition Analysis: A Multidisciplinary Approach, 2024",
      "citation":
          "Ali, N., Mohamed, S., & Magdi, D. (2024). Comparative Evaluation of Software Composition Analysis Tools in Context of Technical Debt Reduction. The International Journal of Public Policies in Egypt, 3(4), 206 - 228.",
      "link": "https://ijppe.journals.ekb.eg/article_389252.html",
    },
    {
      "title": "NutriCraft: A Diet Recommendation System Using K-Means",
      "authors": "Samar Khaled Mohamed, Nour Mohamed, Dr. Dina Salem",
      "citation":
          "Mohamed, N., Gamal, A., Khaled, S., Salem, D.R. (2026). NurtriCraft: A Diet Recommendation System Using K-Means. In: Magdi, D., Karam, E., Mamdouh, M., Amit, J. (eds) The Future of Inclusion: Bridging the Digital Divide with Emerging Technologies. ITAF 2024.",
      "conference":
          "ITAF 2024 – International Conference on Foresights of Technology and Management within Emerging Developments, Canadian International College (CIC), 2024",
      "link": "https://link.springer.com/chapter/10.1007/978-981-96-5013-2_7",
    },
  ];

  static const String linkedIn = "LinkedIn Link";
  static const String linkedInLink =
      "https://www.linkedin.com/in/samar-khaleed/";
  static const String gitHub = "GitHub Link ";
  static const String gitHubLink = "https://github.com/SamarKhalid";
  static const String email = "samar.khaleed.309@gmail.com";
  static const String phone = "+20 1002083661";
}
