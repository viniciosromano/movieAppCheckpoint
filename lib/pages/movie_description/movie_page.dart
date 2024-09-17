import 'package:flutter/material.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/services/api_services.dart'; // Importe seu modelo de dados

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;

  MovieDetailsPage({
    super.key,
    required this.movie,
  });

  final ApiServices apiServices = ApiServices();
  late Future<Result> details = apiServices.getDetailsMovies(movie.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.grey[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),

            // Sinopse
            Text(
              movie.overview,
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),

            // Ano de lançamento
            Text(
              'Ano de Lançamento: ${movie.releaseDate?.year ?? 'N/A'}',
              style: const TextStyle(
                color: Colors.white54,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),

            // Avaliação
            Row(
              children: [
                Text(
                  'Avaliação: ${movie.voteAverage.toStringAsFixed(1)}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
