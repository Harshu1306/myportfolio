import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// -------------------- MAIN APP --------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      routes: {
        '/about': (context) => const AboutPage(),
        '/projects': (context) => const ProjectsPage(),
      },
    );
  }
}

// -------------------- APP DRAWER --------------------
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Text(
              "Navigation",
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("About Me"),
            onTap: () => Navigator.pushNamed(context, '/about'),
          ),
          ListTile(
            leading: const Icon(Icons.work),
            title: const Text("Projects"),
            onTap: () => Navigator.pushNamed(context, '/projects'),
          ),
        ],
      ),
    );
  }
}

// -------------------- HOME PAGE --------------------
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: const Text("Welcome"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.pink.shade100],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(76, 255, 105, 180),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const CircleAvatar(
                radius: 90,
                // Make sure to add your photo to the assets folder and update pubspec.yaml
                backgroundImage: AssetImage('assets/23XV1M0527.jpeg'),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Harshitha Patwari",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.pink.shade900,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "AI & ML Enthusiast • Flutter Developer",
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[700],
                fontStyle: FontStyle.italic,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _homeButton(
                  context,
                  icon: Icons.person,
                  label: "About Me",
                  route: '/about',
                ),
                const SizedBox(width: 16),
                _homeButton(
                  context,
                  icon: Icons.work,
                  label: "Projects",
                  route: '/projects',
                ),
              ],
            ),
            const SizedBox(height: 30),
            Text(
              "🚀 Passionate about building impactful solutions.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _homeButton(BuildContext context,
      {required IconData icon, required String label, required String route}) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.pushNamed(context, route),
      icon: Icon(icon, color: Colors.white),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.pink.shade400,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 5,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// -------------------- ABOUT PAGE --------------------
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Me")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Profile",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 8),
            const Text(
              "Enthusiastic second-year B.Tech Computer Science student with a passion for technology and innovation. Strong interest in Machine Learning, Software Development, and Web Development, with hands-on experience in various technical domains and academic projects.",
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            const SizedBox(height: 24),
            const Text(
              "Education",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 8),
            _buildEducationItem(
              'Bachelor of Technology (B.Tech) - Computer Science',
              'CR Rao Advanced Institute of Mathematics, Statistics & Computer Science (AIMSCS)',
              '2023 - 2027 | CGPA: 9.2',
            ),
            _buildEducationItem(
              'Intermediate (Class 11 & 12)',
              'Sri Chaitanya Junior College, Hyderabad',
              '2021 - 2023 | Percentage: 97.6%',
            ),
            _buildEducationItem(
              'High School (Class 10)',
              'Jawahar Navodaya Vidyalaya, Medak',
              '2019 - 2021 | Percentage: 89%',
            ),
            const SizedBox(height: 24),
            const Text(
              "Technical Skills",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 8),
            _buildSkillsList({
              "Programming Languages": "Python, Java, C, R",
              "Web Development": "Basic knowledge of HTML, CSS, JavaScript",
              "Tools & Platforms": "VS Code, Ubuntu, Eclipse, R Studio",
              "Core Concepts": "Data Structures & Algorithms, Object-Oriented Programming",
            }),
            const SizedBox(height: 24),
            const Text(
              "Certifications",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 8),
            _buildCertificationsList([
              'AI & ML – iHub Data, IIIT Hyderabad',
              'Google AI Essentials – Coursera',
              'Generative AI – LinkedIn Learning',
              'Research Project Certification in Plant Disease Recognition using YOLOv8 – IIIT Hyderabad (2025)',
              'AI Engineer Intern-Rayv Under Digital Dots',
              'AI in Devops-HCL under Project Sunshine',
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildEducationItem(String degree, String institution, String details) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(degree, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Text(institution, style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.grey)),
          Text(details),
        ],
      ),
    );
  }

  Widget _buildSkillsList(Map<String, String> skills) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: skills.entries.map((entry) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(fontSize: 16, color: Colors.black),
              children: [
                TextSpan(text: '${entry.key}: ', style: const TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: entry.value),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCertificationsList(List<String> certifications) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: certifications.map((cert) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("• ", style: TextStyle(fontSize: 16, color: Colors.pink)),
            Expanded(child: Text(cert, style: const TextStyle(fontSize: 16))),
          ],
        ),
      )).toList(),
    );
  }
}

// -------------------- PROJECTS PAGE --------------------
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Projects")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Projects",
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
            ),
            const SizedBox(height: 16),
            _buildProjectCard(
              "Plant Disease Recognition using YOLOv8",
              "Built and trained a YOLOv8 model on a custom dataset to detect and classify plant diseases with real-time accuracy.",
              'IIIT Hyderabad (2025)',
            ),
            _buildProjectCard(
              "Video Content Moderation Hackathon",
              "Built a machine learning model to classify video content as harmful or safe using real-world datasets, during the Video Content Moderation Hackathon conducted by Digital Dots.",
              'Digital Dots Hackathon',
            ),
            _buildProjectCard(
              "COVID-19 Case Prediction using Regression",
              "Implemented linear, polynomial, and ridge regression models with regularization to forecast COVID-19 cases using historical data.",
              'AI/ML Project',
            ),
            _buildProjectCard(
              "Diabetes Prediction using ML (KNN & Feature Scaling)",
              "Applied data visualization, feature scaling, and KNN classification on the Pima Indians Diabetes Dataset for binary classification.",
              'AI/ML Project',
            ),
            _buildProjectCard(
              "Weather App | React.js, OpenWeatherMap API",
              "Built a responsive weather application using React that fetches real-time weather data using the OpenWeatherMap API key.",
              'Web Development Project',
            ),
            _buildProjectCard(
              "Hypothesis Testing using Penguins Dataset",
              "Conducted statistical analysis using Python to test hypotheses on penguin species data.",
              'Data Analysis Project',
            ),
            _buildProjectCard(
              "Data Analysis with Excel – Census 2011 Dataset",
              "Analyzed population and density metrics using advanced Excel functions.",
              'Data Analysis Project',
            ),
            _buildProjectCard(
              "DevOps Project – Sunshine",
              "Developed a project integrating DevOps practices and AI concepts as part of a course project.",
              'HCL under Project Sunshine',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(String title, String description, String technology) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.pink,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),
            Text(
              technology,
              style: const TextStyle(
                fontSize: 12,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}