import 'package:flutter/material.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/provider/quiz_provider.dart';
import 'package:flutter_favourite_quiz/features/quiz/presentation/widgets/quiz_card.dart';
import 'package:flutter_favourite_quiz/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:svg_flutter/svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    _fetchQuizzes();
  }

// Fetch the quizzes
  Future<void> _fetchQuizzes() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<QuizProvider>(context, listen: false).getQuizzes();
    if (Provider.of<QuizProvider>(context, listen: false).hasError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to load quizzes. Please try again later. 🙁'),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstants.bgColor,
        body: Theme(
          data: theme.copyWith(
            colorScheme: theme.colorScheme.copyWith(
              surfaceVariant: Colors.transparent,
            ),
          ),
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hola, User!',
                            style: TextConstants.heading1,
                          ),
                          const Text(
                            'Welcome 👋',
                            style: TextConstants.heading1,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 4,
                            width: MediaQuery.of(context).size.width * 0.5,
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  colors: ColorConstants.gradient),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/avatar.png'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Add the TabBar
                const TabBar(
                  tabs: [
                    Tab(text: 'All Quizzes'),
                    Tab(text: 'Favourites'),
                  ],
                  indicatorColor: Colors.white,
                  labelColor: Colors.white,
                ),
                const SizedBox(height: 20),
                // Add the TabBarView
                Expanded(
                  child: Consumer<QuizProvider>(
                      builder: (context, quizProvider, child) {
                    return TabBarView(
                      children: [
                        // First tab content
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive())
                            : quizProvider.quizzes.isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: SvgPicture.asset(
                                      "assets/empty.svg",
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: quizProvider.quizzes.length,
                                    itemBuilder: (context, index) {
                                      final quiz = quizProvider.quizzes[index];
                                      return QuizCard(
                                        quiz: quiz,
                                        onFavouritePressed: () => quizProvider
                                            .toggleFavourite(quiz: quiz),
                                      );
                                    },
                                  ),
                        // Second tab content (Favourites)
                        isLoading
                            ? const Center(
                                child: CircularProgressIndicator.adaptive())
                            : quizProvider.quizzes
                                    .where((quiz) => quiz.isFavourite)
                                    .isEmpty
                                ? Padding(
                                    padding: const EdgeInsets.all(50.0),
                                    child: SvgPicture.asset(
                                      "assets/empty.svg",
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: quizProvider.quizzes
                                        .where((quiz) => quiz.isFavourite)
                                        .length,
                                    itemBuilder: (context, index) {
                                      final favouriteQuizzes = quizProvider
                                          .quizzes
                                          .where((quiz) => quiz.isFavourite)
                                          .toList();
                                      return QuizCard(
                                        quiz: favouriteQuizzes[index],
                                        onFavouritePressed: () =>
                                            quizProvider.toggleFavourite(
                                                quiz: favouriteQuizzes[index]),
                                      );
                                    },
                                  ),
                      ],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
