import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_app/app/data/repositories/favorite_repository_imp.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/external/datasource/local/session_id_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/account_details_remote_datasource_imp.dart';
import 'package:movie_app/app/external/datasource/remote/favorites_datasource_imp.dart';
import 'package:movie_app/core/utils/api_utils.dart';

import '../../../mockito.mocks.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('Get favorites', () async {
    var dioMock = MockDioHttpServiceImp();
    var prefsMock = MockPreferencesServiceImp();

    var usecase = GetFavoritesUseCaseImp(
      FavoritesRepositoryImp(
        FavoritesDataSourceImp(dioMock),
        AccountDetailsRemoteDataSourceImp(dioMock),
        SessionIdDataSourceImp(prefsMock),
      ),
    );

    // Local
    when(
      prefsMock.getString(any),
    ).thenAnswer((_) async => 'session_id_from_prefs_mock');

    // Remote
    when(
      dioMock.get(API.requestAccountDetails('session_id_from_prefs_mock')),
    ).thenAnswer((_) async {
      return Response(
        data: jsonDecode(await accountDetails()),
        requestOptions: RequestOptions(path: ''),
      );
    });

    when(
      dioMock.get(argThat(startsWith('3/account/'))),
    ).thenAnswer((_) async {
      return Response(data: jsonDecode(jsonData), requestOptions: RequestOptions(path: ''));
    });

    ListEntity? list = await usecase();

    expect(list?.movies?.length, 20);
  });
}

Future<String> accountDetails() async => await rootBundle.loadString('assets/account_details.json');

String jsonData = '''
  {
        "id": 1,
        "page": 1,
        "results": [
            {
                "adult": false,
                "backdrop_path": "/iQFcwSGbZXMkeyKrxbPnwnRo5fl.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 634649,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Spider-Man: No Way Home",
                "overview": "Peter Parker is unmasked and no longer able to separate his normal life from the high-stakes of being a super-hero. When he asks for help from Doctor Strange the stakes become even more dangerous, forcing him to discover what it truly means to be Spider-Man.",
                "popularity": 4716.995,
                "poster_path": "/1g0dhYtq4irTY1GPXvft6k4YLjm.jpg",
                "release_date": "2021-12-15",
                "title": "Spider-Man: No Way Home",
                "video": false,
                "vote_average": 8.1,
                "vote_count": 12294
            },
            {
                "adult": false,
                "backdrop_path": "/c6H7Z4u73ir3cIoCteuhJh7UCAR.jpg",
                "genre_ids": [
                    878,
                    28
                ],
                "id": 524434,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Eternals",
                "overview": "The Eternals are a team of ancient aliens who have been living on Earth in secret for thousands of years. When an unexpected tragedy forces them out of the shadows, they are forced to reunite against mankind’s most ancient enemy, the Deviants.",
                "popularity": 981.809,
                "poster_path": "/bcCBq9N1EMo3daNIjWJ8kYvrQm6.jpg",
                "release_date": "2021-11-03",
                "title": "Eternals",
                "video": false,
                "vote_average": 7.1,
                "vote_count": 5418
            },
            {
                "adult": false,
                "backdrop_path": "/cinER0ESG0eJ49kXlExM0MEWGxW.jpg",
                "genre_ids": [
                    28,
                    12,
                    14
                ],
                "id": 566525,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Shang-Chi and the Legend of the Ten Rings",
                "overview": "Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.",
                "popularity": 692.794,
                "poster_path": "/1BIoJGKbXjdFDAqUEiA2VHqkK1Z.jpg",
                "release_date": "2021-09-01",
                "title": "Shang-Chi and the Legend of the Ten Rings",
                "video": false,
                "vote_average": 7.7,
                "vote_count": 6319
            },
            {
                "adult": false,
                "backdrop_path": "/keIxh0wPr2Ymj0Btjh4gW7JJ89e.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 497698,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Black Widow",
                "overview": "Natasha Romanoff, also known as Black Widow, confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.",
                "popularity": 312.129,
                "poster_path": "/qAZ0pzat24kLdO3o8ejmbLxyOac.jpg",
                "release_date": "2021-07-07",
                "title": "Black Widow",
                "video": false,
                "vote_average": 7.5,
                "vote_count": 7463
            },
            {
                "adult": false,
                "backdrop_path": "/vamhMTvh9m9zFHDoR0v1nRtf6T4.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 429617,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Spider-Man: Far From Home",
                "overview": "Peter Parker and his friends go on a summer trip to Europe. However, they will hardly be able to rest - Peter will have to agree to help Nick Fury uncover the mystery of creatures that cause natural disasters and destruction throughout the continent.",
                "popularity": 187.245,
                "poster_path": "/4q2NNj4S5dG2RLF9CpXsej7yXl.jpg",
                "release_date": "2019-06-28",
                "title": "Spider-Man: Far From Home",
                "video": false,
                "vote_average": 7.5,
                "vote_count": 12492
            },
            {
                "adult": false,
                "backdrop_path": "/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg",
                "genre_ids": [
                    12,
                    878,
                    28
                ],
                "id": 299534,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Avengers: Endgame",
                "overview": "After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more in order to undo Thanos' actions and restore order to the universe once and for all, no matter what consequences may be in store.",
                "popularity": 277.128,
                "poster_path": "/or06FN3Dka5tukK1e9sl16pB3iy.jpg",
                "release_date": "2019-04-24",
                "title": "Avengers: Endgame",
                "video": false,
                "vote_average": 8.3,
                "vote_count": 20916
            },
            {
                "adult": false,
                "backdrop_path": "/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 299537,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Captain Marvel",
                "overview": "The story follows Carol Danvers as she becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races. Set in the 1990s, Captain Marvel is an all-new adventure from a previously unseen period in the history of the Marvel Cinematic Universe.",
                "popularity": 103.834,
                "poster_path": "/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg",
                "release_date": "2019-03-06",
                "title": "Captain Marvel",
                "video": false,
                "vote_average": 6.9,
                "vote_count": 12983
            },
            {
                "adult": false,
                "backdrop_path": "/6P3c80EOm7BodndGBUAJHHsHKrp.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 363088,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Ant-Man and the Wasp",
                "overview": "Just when his time under house arrest is about to end, Scott Lang once again puts his freedom at risk to help Hope van Dyne and Dr. Hank Pym dive into the quantum realm and try to accomplish, against time and any chance of success, a very dangerous rescue mission.",
                "popularity": 70.204,
                "poster_path": "/eivQmS3wqzqnQWILHLc4FsEfcXP.jpg",
                "release_date": "2018-07-04",
                "title": "Ant-Man and the Wasp",
                "video": false,
                "vote_average": 7,
                "vote_count": 11074
            },
            {
                "adult": false,
                "backdrop_path": "/lmZFxXgJE3vgrciwuDib0N8CfQo.jpg",
                "genre_ids": [
                    12,
                    28,
                    878
                ],
                "id": 299536,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Avengers: Infinity War",
                "overview": "As the Avengers and their allies have continued to protect the world from threats too large for any one hero to handle, a new danger has emerged from the cosmic shadows: Thanos. A despot of intergalactic infamy, his goal is to collect all six Infinity Stones, artifacts of unimaginable power, and use them to inflict his twisted will on all of reality. Everything the Avengers have fought for has led up to this moment - the fate of Earth and existence itself has never been more uncertain.",
                "popularity": 417.883,
                "poster_path": "/7WsyChQLEftFiDOVTGkv3hFpyyt.jpg",
                "release_date": "2018-04-25",
                "title": "Avengers: Infinity War",
                "video": false,
                "vote_average": 8.3,
                "vote_count": 24480
            },
            {
                "adult": false,
                "backdrop_path": "/6ELJEzQJ3Y45HczvreC3dg0GV5R.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 284054,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Black Panther",
                "overview": "King T'Challa returns home to the reclusive, technologically advanced African nation of Wakanda to serve as his country's new leader. However, T'Challa soon finds that he is challenged for the throne by factions within his own country as well as without. Using powers reserved to Wakandan kings, T'Challa assumes the Black Panther mantle to join with ex-girlfriend Nakia, the queen-mother, his princess-kid sister, members of the Dora Milaje (the Wakandan 'special forces') and an American secret agent, to prevent Wakanda from being dragged into a world war.",
                "popularity": 108.524,
                "poster_path": "/uxzzxijgPIY7slzFvMotPv8wjKA.jpg",
                "release_date": "2018-02-13",
                "title": "Black Panther",
                "video": false,
                "vote_average": 7.4,
                "vote_count": 18986
            },
            {
                "adult": false,
                "backdrop_path": "/kaIfm5ryEOwYg8mLbq8HkPuM1Fo.jpg",
                "genre_ids": [
                    28,
                    12,
                    14,
                    878
                ],
                "id": 284053,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Thor: Ragnarok",
                "overview": "Thor is imprisoned on the other side of the universe and finds himself in a race against time to get back to Asgard to stop Ragnarok, the destruction of his home-world and the end of Asgardian civilization, at the hands of a powerful new threat, the ruthless Hela.",
                "popularity": 158.559,
                "poster_path": "/rzRwTcFvttcN1ZpX2xv4j3tSdJu.jpg",
                "release_date": "2017-10-24",
                "title": "Thor: Ragnarok",
                "video": false,
                "vote_average": 7.6,
                "vote_count": 17550
            },
            {
                "adult": false,
                "backdrop_path": "/tTlAA0REGPXSZPBfWyTW9ipIv1I.jpg",
                "genre_ids": [
                    28,
                    12,
                    878,
                    18
                ],
                "id": 315635,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Spider-Man: Homecoming",
                "overview": "Following the events of Captain America: Civil War, Peter Parker, with the help of his mentor Tony Stark, tries to balance his life as an ordinary high school student in Queens, New York City, with fighting crime as his superhero alter ego Spider-Man as a new threat, the Vulture, emerges.",
                "popularity": 197.143,
                "poster_path": "/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg",
                "release_date": "2017-07-05",
                "title": "Spider-Man: Homecoming",
                "video": false,
                "vote_average": 7.4,
                "vote_count": 18474
            },
            {
                "adult": false,
                "backdrop_path": "/xpFIaHL7Rm5kKLcEPDEMpjh4Xq6.jpg",
                "genre_ids": [
                    12,
                    28,
                    878
                ],
                "id": 283995,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Guardians of the Galaxy Vol. 2",
                "overview": "The Guardians must fight to keep their newfound family together as they unravel the mysteries of Peter Quill's true parentage.",
                "popularity": 121.847,
                "poster_path": "/y4MBh0EjBlMuOzv9axM4qJlmhzz.jpg",
                "release_date": "2017-04-19",
                "title": "Guardians of the Galaxy Vol. 2",
                "video": false,
                "vote_average": 7.6,
                "vote_count": 18219
            },
            {
                "adult": false,
                "backdrop_path": "/c71zkXAykw5uu4cHnUCE6vA3NY0.jpg",
                "genre_ids": [
                    28,
                    18,
                    878
                ],
                "id": 263115,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Logan",
                "overview": "In the near future, a weary Logan cares for an ailing Professor X in a hideout on the Mexican border. But Logan's attempts to hide from the world and his legacy are upended when a young mutant arrives, pursued by dark forces.",
                "popularity": 82.564,
                "poster_path": "/fnbjcRDYn6YviCcePDnGdyAkYsB.jpg",
                "release_date": "2017-02-28",
                "title": "Logan",
                "video": false,
                "vote_average": 7.8,
                "vote_count": 16754
            },
            {
                "adult": false,
                "backdrop_path": "/eQN31P4IEhyp6NkdccvppJnyuJ4.jpg",
                "genre_ids": [
                    28,
                    12,
                    14,
                    878
                ],
                "id": 284052,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Doctor Strange",
                "overview": "After his career is destroyed, a brilliant but arrogant surgeon gets a new lease on life when a sorcerer takes him under her wing and trains him to defend the world against evil.",
                "popularity": 607.703,
                "poster_path": "/uGBVj3bEbCoZbDjjl9wTxcygko1.jpg",
                "release_date": "2016-10-25",
                "title": "Doctor Strange",
                "video": false,
                "vote_average": 7.4,
                "vote_count": 18775
            },
            {
                "adult": false,
                "backdrop_path": "/2ex2beZ4ssMeOduLD0ILzXKCiep.jpg",
                "genre_ids": [
                    28,
                    12,
                    878,
                    14
                ],
                "id": 246655,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "X-Men: Apocalypse",
                "overview": "After the re-emergence of the world's first mutant, world-destroyer Apocalypse, the X-Men must unite to defeat his extinction level plan.",
                "popularity": 100.389,
                "poster_path": "/2mtQwJKVKQrZgTz49Dizb25eOQQ.jpg",
                "release_date": "2016-05-18",
                "title": "X-Men: Apocalypse",
                "video": false,
                "vote_average": 6.5,
                "vote_count": 11258
            },
            {
                "adult": false,
                "backdrop_path": "/7FWlcZq3r6525LWOcvO9kNWurN1.jpg",
                "genre_ids": [
                    12,
                    28,
                    878
                ],
                "id": 271110,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Captain America: Civil War",
                "overview": "Following the events of Age of Ultron, the collective governments of the world pass an act designed to regulate all superhuman activity. This polarizes opinion amongst the Avengers, causing two factions to side with Iron Man or Captain America, which causes an epic battle between former allies.",
                "popularity": 155.78,
                "poster_path": "/rAGiXaUfPzY7CDEyNKUofk3Kw2e.jpg",
                "release_date": "2016-04-27",
                "title": "Captain America: Civil War",
                "video": false,
                "vote_average": 7.4,
                "vote_count": 19721
            },
            {
                "adult": false,
                "backdrop_path": "/en971MEXui9diirXlogOrPKmsEn.jpg",
                "genre_ids": [
                    28,
                    12,
                    35
                ],
                "id": 293660,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Deadpool",
                "overview": "Deadpool tells the origin story of former Special Forces operative turned mercenary Wade Wilson, who after being subjected to a rogue experiment that leaves him with accelerated healing powers, adopts the alter ego Deadpool. Armed with his new abilities and a dark, twisted sense of humor, Deadpool hunts down the man who nearly destroyed his life.",
                "popularity": 216.207,
                "poster_path": "/fSRb7vyIP8rQpL0I47P3qUsEKX3.jpg",
                "release_date": "2016-02-09",
                "title": "Deadpool",
                "video": false,
                "vote_average": 7.6,
                "vote_count": 26668
            },
            {
                "adult": false,
                "backdrop_path": "/gzhVcfC5j0sTnS4WJzBrCS0Vkr0.jpg",
                "genre_ids": [
                    28,
                    12,
                    878
                ],
                "id": 166424,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Fantastic Four",
                "overview": "Four young outsiders teleport to a dangerous universe, which alters their physical form in shocking ways. Their lives irrevocably upended, the team must learn to harness their daunting new abilities and work together to save Earth from a former friend turned enemy.",
                "popularity": 64.382,
                "poster_path": "/oeMpEsjmiT9PEJbRM1Fm7TZ1dE0.jpg",
                "release_date": "2015-08-05",
                "title": "Fantastic Four",
                "video": false,
                "vote_average": 4.4,
                "vote_count": 5136
            },
            {
                "adult": false,
                "backdrop_path": "/a7sAqMKv5tkAdMzFfIhPqIBmQ9g.jpg",
                "genre_ids": [
                    878,
                    28,
                    12
                ],
                "id": 102899,
                "media_type": "movie",
                "original_language": "en",
                "original_title": "Ant-Man",
                "overview": "Armed with the astonishing ability to shrink in scale but increase in strength, master thief Scott Lang must embrace his inner-hero and help his mentor, Doctor Hank Pym, protect the secret behind his spectacular Ant-Man suit from a new generation of towering threats. Against seemingly insurmountable obstacles, Pym and Lang must plan and pull off a heist that will save the world.",
                "popularity": 80.249,
                "poster_path": "/rS97hUJ1otKTTripGwQ0ujbuIri.jpg",
                "release_date": "2015-07-14",
                "title": "Ant-Man",
                "video": false,
                "vote_average": 7.1,
                "vote_count": 17005
            }
        ],
        "total_pages": 1,
        "total_results": 20
    }
''';
