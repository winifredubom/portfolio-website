import '../models/models.dart';

const PortfolioContent portfolioData = PortfolioContent(
  profile: PortfolioProfile(
    name: 'Idara Ubom',
    title: 'Mobile Application Developer',
    location: 'Lagos, Nigeria',
    summary:
        'Mobile Application Developer with over two years of experience building high-performance, secure, and scalable mobile applications, including real-time features for logistics and e-commerce platforms. Strong in Flutter, Dart, Riverpod, BLoC, Firebase, REST APIs, clean architecture, SOLID principles, secure authentication, session management, and store deployment.',
  ),
  skillCategories: [
    SkillCategory(
      title: 'Mobile Development',
      skills: [
        'Flutter',
        'Dart',
        'Kotlin',
        'Jetpack Compose',
        'Responsive UI',
        'High-performance UI',
      ],
    ),
    SkillCategory(
      title: 'Architecture & State',
      skills: [
        'Riverpod',
        'BLoC',
        'Provider',
        'Clean Architecture',
        'SOLID Principles',
        'Modular Code Structure',
      ],
    ),
    SkillCategory(
      title: 'Realtime Updates',
      skills: [
        'Firebase Authentication',
        'Cloud Firestore',
        'Realtime Database',
        'Cloud Messaging',
        'Storage',
        'RESTful APIs',
      ],
    ),
    SkillCategory(
      title: 'Product Delivery & Tools',
      skills: [
        'GitHub',
        'Google Play Store Deployment',
        'App Store Deployment',
        'Debugging',
        'Github Copilot, ChatGPT, Claude',
        'Cross-team Collaboration',
      ],
    ),
  ],
  experiences: [
    ExperienceItem(
      role: 'Mobile Application Developer',
      company: 'FPG Technologies & Solutions',
      period: 'June 2024 - Present',
      summary:
          'Delivered healthcare and library management products with secure workflows, real-time notifications, and production deployment to Google Play.',
      location: 'Lagos, Nigeria',
      workMode: 'Hybrid',
      highlights: [
        'Developed and deployed a healthcare mobile application to Google Play Store.',
        'Built secure patient management, appointment booking, and real-time notifications.',
        'Built a Library Management System with Flutter, Dart, and Firebase.',
        'Collaborated with QA, PMs, designers, and backend developers.',
        'Improved development speed using AI tools.',
      ],
    ),
    ExperienceItem(
      role: 'Mobile Application Developer (Contract)',
      company: 'CEED Venture Studio',
      period: 'February 2025 - August 2025',
      summary:
          'Contributed contract Flutter work for logistics and food delivery products, including real-time tracking, UI flow design, and critical bug resolution.',
      location: 'Remote',
      workMode: 'Remote',
      highlights: [
        'Designed logistics flow and mobile UI for a logistics application.',
        'Developed real-time delivery tracking and status updates for Lastmile.',
        'Fixed critical bugs in the Frodor food delivery app.',
        'Worked closely with backend and QA teams.',
        'Maintained a clean modular architecture.',
      ],
    ),
    ExperienceItem(
      role: 'Flutter Developer Intern',
      company: 'Epidise',
      period: 'October 2023 - December 2023',
      summary:
          'Supported a skin-condition diagnosis product by translating UI/UX into Flutter screens and integrating Provider-based state handling with Firebase services.',
      location: 'Remote',
      workMode: 'Remote',
      highlights: [
        'Helped build a skin condition diagnosis and management app.',
        'Translated UI/UX into pixel-perfect Flutter interfaces.',
        'Implemented state management with Provider.',
        'Integrated Firebase services.',
      ],
    ),
    ExperienceItem(
      role: 'Android Developer Intern',
      company: 'Start Innovation Hub',
      period: 'March 2022 - October 2022',
      summary:
          'Contributed to an Android healthcare platform with Jetpack Compose, REST API integration, and performance improvements across core product flows.',
      location: 'Uyo, Nigeria',
      workMode: 'On-site',
      highlights: [
        'Contributed to a healthcare platform for medications, appointments, and records.',
        'Built UI with Jetpack Compose.',
        'Integrated REST APIs.',
        'Improved app performance and reduced redundancy.',
      ],
    ),
  ],
  projects: [
    ProjectItem(
      name: 'Eazzy Mart',
      type: 'Freelance Private E-commerce App',
      yearLabel: '2025',
      description:
          'A mobile e-commerce application with product browsing, product details, cart management, dynamic search, and sales notifications.',
      quickSummary:
          'Built around mobile shopping flows with product discovery, responsive search, cart updates, and notification-led re-engagement for commerce users.',
      previewImages: [
        ProjectPreviewImage(
          path: '/images/projects/eazymartsplash.jpeg',
          alt: 'Splash screen preview for the Eazzy Mart mobile commerce application.',
        ),
        ProjectPreviewImage(
          path: '/images/projects/easymarthome.jpeg',
          alt: 'Splash screen preview for the Eazzy Mart mobile commerce application.',
        ),
      ],
      tags: [
        'Flutter',
        'WooCommerce API',
        'Riverpod',
        'Cart',
        'Notifications',
      ],
    ),
    ProjectItem(
      name: 'Beszel Companion',
      type: 'Personal Private Project',
      yearLabel: '2025',
      description:
          'A Flutter-based server monitoring dashboard application that connects to Beszel - a lightweight server monitoring hub. ',
      quickSummary:
          'This mobile/desktop client provides real-time monitoring of your servers with a beautiful Cupertino-styled interface.',
      previewImages: [
        ProjectPreviewImage(
          path: '/images/projects/image0.png',
          alt: 'Preview screens for the Beszel Companion project.',
        ),
        ProjectPreviewImage(
          path: '/images/projects/image1.png',
          alt: 'Preview screens for the Beszel Companion project.',
        ),
        ProjectPreviewImage(
          path: '/images/projects/image2.png',
          alt: 'Preview screens for the Beszel Companion project.',
        ),
      ],
      githubUrl: 'https://github.com/winifredubom/beszel_fpg',
      tags: [
        'Flutter',
        'Pocketbase',
        'Riverpod',
        'Hive Storage',
        'Dio',
        'FL Charts',
      ],
    ),
    ProjectItem(
      name: 'Healthcare Mobile App',
      type: 'Professional Project',
      yearLabel: '2024',
      description:
          'A healthcare mobile application focused on patient management, appointment bookings, and real-time notifications.',
      quickSummary:
          'Structured around secure patient workflows, appointment scheduling, and real-time communication, with clarity and trust at the center of the mobile experience.',
      previewImages: [
        ProjectPreviewImage(
          path: '/images/projects/epidise image.png',
          alt: 'Splash screen preview for the Healthcare Mobile App.',
        ),
        ProjectPreviewImage(
          path: '/images/projects/splash.png',
          alt: 'Home dashboard preview for the Healthcare Mobile App.',
        ),
      ],
      githubUrl: 'https://github.com/winifredubom/dermatologist_subsection_app',
      tags: [
        'Flutter',
        'Firebase',
        'Real-time Notifications',
        'Secure Access',
      ],
    ),

  ],
  socialLinks: [
    SocialLink(
      label: 'GitHub',
      url: 'https://github.com/winifredubom',
    ),
    SocialLink(
      label: 'LinkedIn',
      url: 'https://www.linkedin.com/in/idara-ubom-83601a236/',
    ),
    SocialLink(
      label: 'Email',
      url: 'mailto:idaraubom@outlook.com',
    ),
  ],
);
