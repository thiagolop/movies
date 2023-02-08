import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/app/pages/home/widgets/custom_list_card_widget.dart';
import '../../controllers/movie_controller.dart';
import '../../decorators/movies_cache_repository_decorator.dart';
import '../../models/movie_model.dart';
import '../../repositories/movie_repository_imp.dart';
import '../../service/dio_service_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final MovieController _controller = MovieController(MoviesCacheRepositoryDecorator(MoviesRepositoryImp(dioService: DioServiceImp())));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ValueListenableBuilder<MoviesModel?>(
                    valueListenable: _controller.movies,
                    builder: (_, movies, __) {
                      return Visibility(
                          visible: movies != null,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Movies',
                                style: GoogleFonts.roboto(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.withOpacity(0.05),
                                      Colors.grey.withOpacity(0.15),
                                      Colors.grey.withOpacity(0.05),
                                    ],
                                    stops: const [0, 7, 1],
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextField(
                                        onChanged: _controller.onChanged,
                                        decoration: const InputDecoration(
                                          prefixIcon: Icon(Icons.search),
                                          fillColor: Colors.white30,
                                          focusColor: Colors.white30,
                                          hoverColor: Colors.white30,
                                        ),
                                        cursorColor: Colors.white30,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ));
                    }),
                const SizedBox(height: 40),
                ValueListenableBuilder<MoviesModel?>(
                  valueListenable: _controller.movies,
                  builder: (_, movies, __) {
                    return movies != null
                        ? ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: movies.movieList.length,
                            itemBuilder: (_, idx) => CustomListCardWidget(
                              movie: movies.movieList[idx],
                            ),
                            separatorBuilder: (_, __) => const Divider(),
                          )
                        : const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
