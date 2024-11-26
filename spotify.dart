import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        body: Column(
          children: [
            // Conteúdo rolável
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(8.0),
                children: [
                  // Saudações e ícones no topo
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Boa noite',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.notifications, color: Colors.white),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.refresh, color: Colors.white),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: const Icon(Icons.settings, color: Colors.white),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    'Louvores Infantis',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  // Lista de álbuns
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      children: [
                        albumRow(
                          leftAlbum: Album(
                            title: 'Rindo e Cantando',
                            artist: 'Aline Barros',
                            imageUrl: 'https://i.scdn.co/image/ab67616d0000b2733f17ef7284a7c7427c48be40',
                          ),
                          rightAlbum: Album(
                            title: 'A Arca de Noé',
                            artist: 'Cristina Mel',
                            imageUrl: 'https://i.scdn.co/image/ab67616d0000b273adc840dd39a4435c4448bb67',
                          ),
                        ),
                        albumRow(
                          leftAlbum: Album(
                            title: 'Crianças Diante do Trono',
                            artist: 'Diante do Trono Kids',
                            imageUrl: 'https://i.scdn.co/image/ab6761610000e5ebb73b24ae8bcae0dad392731a',
                          ),
                          rightAlbum: Album(
                            title: 'O Sabão',
                            artist: 'Turma do Printy',
                            imageUrl: 'https://i.scdn.co/image/ab67616d00001e020f320eae8881f0b60cc3ab21',
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Últimos Álbuns',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        albumCard('Rindo e Cantando', 'https://i.scdn.co/image/ab67616d0000b2733f17ef7284a7c7427c48be40'),
                        albumCard('A Bíblia é a Palavra de Deus', 'https://i.scdn.co/image/ab67616d0000b273a86e614111ae098eccea185e'),
                        albumCard('A Arca de Noé', 'https://i.scdn.co/image/ab67616d0000b273adc840dd39a4435c4448bb67'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            miniPlayer('Rindo e Cantando - Aline Barros'),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[900],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
            BottomNavigationBarItem(icon: Icon(Icons.library_music), label: 'Biblioteca'),
          ],
        ),
      ),
    );
  }

  Widget albumCard(String title, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget albumRow({required Album leftAlbum, required Album rightAlbum}) {
    return Row(
      children: [
        Expanded(child: albumTile(leftAlbum)),
        const SizedBox(width: 8.0),
        Expanded(child: albumTile(rightAlbum)),
      ],
    );
  }

  Widget albumTile(Album album) {
    return Container(
      color: Colors.grey[700],
      child: ListTile(
        leading: albumCover(album.imageUrl),
        title: Text(
          album.title,
          style: const TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          album.artist,
          style: const TextStyle(color: Colors.white70),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }

  Widget albumCover(String imageUrl) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget miniPlayer(String title) {
    return Container(
      color: Colors.grey[700],
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        leading: const Icon(Icons.play_arrow, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        trailing: IconButton(
          icon: const Icon(Icons.favorite_border, color: Colors.white),
          onPressed: () {},
        ),
      ),
    );
  }
}

class Album {
  final String title;
  final String artist;
  final String imageUrl;

  Album({required this.title, required this.artist, required this.imageUrl});
}
